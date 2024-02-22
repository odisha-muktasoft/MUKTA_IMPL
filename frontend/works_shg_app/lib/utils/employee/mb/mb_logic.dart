import 'package:collection/collection.dart';

import '../../../models/employee/mb/mb_detail_response.dart';

class MBLogic {
  static dynamic getMeasureList({required MBDetailResponse mbDetailResponse}) {
    final List<Measurement> allMeasurements =
        mbDetailResponse.allMeasurements ?? [];

    final data = allMeasurements.map((e) {
      final data = {
        "totalSorAmount": e.additionalDetail?.sorAmount ?? 0.0,
        "totalNorSorAmount": e.additionalDetail?.nonSorAmount ?? 0.0,
        "totalAmount": e.additionalDetail?.totalAmount ?? 0.0,
        "musterRollNumber": e.additionalDetail?.musterRollNumber ?? "",
        "mbNumber": e.measurementNumber,
        "wfStatus": e.wfStatus,
        "tenantId": e.tenantId,
        "measures": e.measures?.map((e) {
          final data = {
            "length": e.length,
            "breath": e.breadth,
            "height": e.height,
            "numItems": e.numItems,
            "currentValue": e.currentValue,
            "cummulativeValue": e.cumulativeValue,
            "contract": getContract(e.targetId!, mbDetailResponse)
          };
          return data;
        }).toList(),
      };

      return data;
    }).toList();

    // print(data);
    return data.whereNotNull().toList() ?? [];
  }

  static dynamic getContract(String targetId, MBDetailResponse mb) {
    final alldata = mb.contract?.lineItems?.map((e) {
      if (e.contractLineItemRef == targetId) {
        final data = {
          "estimateId": e.estimateId,
          "estimateLineItemId": e.estimateLineItemId,
          "contractLineItemRef": e.contractLineItemRef,
          "unitRate": e.unitRate,
          "status": e.status,
          "estimate": getEstimate(e.estimateLineItemId!, mb)
        };
        return data;
      }
    }).toList();
    return alldata!.whereNotNull().toList() ?? [];
  }

  // estimate

  static dynamic getEstimate(String contractLineItemRef, MBDetailResponse mb) {
    final alldata = mb.estimate?.estimateDetails?.map((e) {
      if (e.id == contractLineItemRef) {
        final data = {
          "id": e.id,
          "sorId": e.sorId,
          "category": e.category,
          "name": e.name,
          "description": e.description,
          "unitRate": e.unitRate,
          "noOfunit": e.noOfunit,
          "uom": e.uom,
          "length": e.length,
          "width": e.width,
          "height": e.height,
          "quantity": e.quantity,
          "isDeduction": e.isDeduction,
        };
        return data;
      }
    }).toList();

    return alldata!.whereNotNull().toList() ?? [];
  }

// get sors

  static Map<String, List<Map<String, dynamic>>> getSors(List<dynamic> s) {
    List<dynamic> sor = [];
    List<dynamic> nonSor = [];

    final k = s!.first!['measures'];

    for (int i = 0; i < s.first!['measures'].length; i++) {
      if (k[i]['contract'][0]['estimate'][0]['category'] == "SOR") {
        sor.add(k[i]);
      } else {
        nonSor.add(k[i]);
      }
    }

    Map<String, List<Map<String, dynamic>>> groupedObjects = {};

    for (var obj in sor) {
      String mValue = obj['contract'][0]['estimate'][0]['sorId'];
      if (groupedObjects.containsKey(mValue)) {
        groupedObjects[mValue]!.add(obj);
      } else {
        groupedObjects[mValue] = [obj];
      }
    }

    return groupedObjects;
  }
}
