import requests
import json
import time
import os
import copy
from elasticsearch import Elasticsearch, helpers


ES_HOST = os.getenv("ES_HOST_URL")
ES_USERNAME = os.getenv("ES_USERNAME")
ES_PASSWORD = os.getenv("ES_PASSWORD")

es = Elasticsearch([ES_HOST], http_auth=(ES_USERNAME, ES_PASSWORD), verify_certs=False)

gender_vs_beneficiary_map = {}

# Current time in milliseconds
current_time_millis = int(time.time() * 1000)

# 30 days ago in milliseconds 
thirty_days_ago_millis = current_time_millis - (30 * 24 * 60 * 60 * 1000)

print(current_time_millis)
print(thirty_days_ago_millis)


def extract_data():
    beneficiary_ids = set()
    pi_index_name = os.getenv("ES_PI_INDEX")
    query = {
        "size": 10000, 
            "query": {
                "bool": {
                    "must": [
                        {
                            "range": {
                                "Data.auditDetails.lastModifiedTime": {
                                "gte": thirty_days_ago_millis,
                                "lte": current_time_millis
                                }
                            }
                        }
                    ]
                }
            },
            "sort" : [
                {
                    "Data.@timestamp" : "asc"
                }
            ]
    }

    docs = es.search(index=pi_index_name, body=query)["hits"]["hits"]
    print(f"{len(docs)}, docs from ifms pi index")
    pi_data = []
    while len(docs) > 0:
        last_sort_value = docs[-1]["sort"][0]
        print(f"Last sort value: {last_sort_value}")

        for data in docs:
            pi_data.append(data)
            for pi in data["_source"]["Data"]["beneficiaryDetails"]:
                if pi["beneficiaryType"] == "IND":
                    beneficiary_ids.add(pi["beneficiaryId"])


        query_with_search_after = copy.deepcopy(query)
        query_with_search_after["search_after"] = [last_sort_value]
        response = es.search(index=pi_index_name, body=query_with_search_after)
        docs = response["hits"]["hits"]
        print(f"{len(docs)} docs from ifms pi index")
    print(f"{len(pi_data)} objects in pi data")
    create_gender_vs_beneficiary_map(beneficiary_ids)
    
    return pi_data

transformed_bulk_data = []

def transform_data(data):
    ES_TRANSFORMER_PI_INDEX = os.getenv("ES_TRANSFORMER_PI_INDEX")

    for pi in data:
        beneficiary_details = pi["_source"]["Data"]["beneficiaryDetails"]

        for index, details in enumerate(beneficiary_details):
            #Creating a new document for each beneficiaryDetails object
            transformed_data = {
                "Data": {
                    **pi["_source"]["Data"],  #Include all other fields in Data
                    "parentIndexId" : pi["_id"],
                    "beneficiaryDetails": details  #Overwrite beneficiaryDetails with one object at a time
                }
            }

            if "numBeneficiaries" in transformed_data:
                del transformed_data["Data"]["numBeneficiaries"]
            if "grossAmount" in transformed_data:
                del transformed_data["Data"]["grossAmount"]
            if "netAmount" in transformed_data:
                del transformed_data["Data"]["netAmount"]
            if "piStatus" in transformed_data["Data"]:
                del transformed_data["Data"]["piStatus"]

            beneficiary_id = transformed_data["Data"]["beneficiaryDetails"]["beneficiaryId"]

            transformed_data["Data"]["gender"] = gender_vs_beneficiary_map[beneficiary_id] if beneficiary_id in gender_vs_beneficiary_map else None

            index_id = f"{transformed_data['Data']['id']}{transformed_data['Data']['beneficiaryDetails']['id']}{transformed_data['Data']['beneficiaryDetails']['beneficiaryId']}"
            index_query = {"index": { "_index" : ES_TRANSFORMER_PI_INDEX ,"_id": index_id}}
            data_object = transformed_data

            transformed_bulk_data.append(json.dumps(index_query))
            transformed_bulk_data.append(json.dumps(data_object))

    return None


def create_gender_vs_beneficiary_map(beneficiary_ids : set):
    beneficiary_ids_list = list(beneficiary_ids)
    individual_index = os.getenv("ES_INDIVIDUAL_INDEX")
    chunk_size = 10000
    for i in range(0, len(beneficiary_ids_list), chunk_size):
        chunk = beneficiary_ids_list[i:i + chunk_size]
        query = {
            "size" : len(chunk),
            "query" : {
                "terms" : {
                    "Data.id.keyword" : chunk
                }
            },
            "_source": ["Data.id", "Data.gender"]
        }
        # docs = index_batch(url= ES_INDIVIDUAL_SEARCH, query = query).json()["hits"]["hits"]
        docs = es.search(index=individual_index, body=query)["hits"]["hits"]
        for item in docs:
            gender_vs_beneficiary_map[item["_source"]["Data"]["id"]] = item["_source"]["Data"]["gender"] if "gender" in item["Data"] else None

    return None

    


def main():
    pi_data = extract_data()

    transform_data(pi_data)

    
    req_body = '\n'.join(transformed_bulk_data) + '\n'
    response = es.bulk(body=req_body)

    if response["errors"]:
        for item in response["items"]:
            if "error" in item["index"]:
                print(f"Insert/Update failed for document id {item['index']['_id']} for the reasom : {item['index']['error']}")

    return None



if __name__ == '__main__':
    main()