import 'package:collection/collection.dart';

import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';

class MBLogic {
  static List<FilteredMeasurements> getMeasureList(
      {required MBDetailResponse mbDetailResponse}) {
    final List<Measurement> allMeasurements =
        mbDetailResponse.allMeasurements ?? [];

    final data = allMeasurements.map((e) {
      FilteredMeasurements datak = FilteredMeasurements(
          totalSorAmount: e.additionalDetail?.sorAmount ?? 0.0,
          totalNorSorAmount: e.additionalDetail?.nonSorAmount ?? 0.0,
          totalAmount: e.additionalDetail?.totalAmount ?? 0.0,
          endDate: e.additionalDetail?.endDate,
          startDate: e.additionalDetail?.startDate,
          entryDate: e.entryDate,
          // to be chnaged
          //musterRollNumber: e.additionalDetail?.musterRollNumber ?? "",
          musterRollNumber: "",
          mbNumber: e.measurementNumber,
          wfStatus: e.wfStatus,
          tenantId: e.tenantId,
          measures: e.measures?.map((e) {
            FilteredMeasurementsMeasure filteredMeasurementsMeasure =
                FilteredMeasurementsMeasure(
                  mbAmount: e.measureAdditionalDetails?.mbAmount,
                  type: e.measureAdditionalDetails?.type,
                    length: e.length,
                    breath: e.breadth,
                    height: e.height,
                    numItems: e.numItems,
                    currentValue: e.currentValue,
                    cumulativeValue: e.cumulativeValue,
                    tenantId: e.targetId,
                    contracts: getContract(e.targetId!, mbDetailResponse));

            return filteredMeasurementsMeasure;
          }).toList());

      return datak;
    }).toList();

    // print(data);
    return data.whereNotNull().toList() ?? [];
  }

  static List<FilteredMeasurementsContract> getContract(
      String targetId, MBDetailResponse mb) {
    final alldata = mb.contract?.lineItems?.map((e) {
      if (e.contractLineItemRef == targetId) {
        FilteredMeasurementsContract filteredMeasurementsContract =
            FilteredMeasurementsContract(
                estimateId: e.estimateId,
                estimateLineItemId: e.estimateLineItemId,
                contractLineItemRef: e.contractLineItemRef,
                unitRate: e.unitRate,
                status: e.status,
                estimates: getEstimate(e.estimateLineItemId!, mb));

        return filteredMeasurementsContract;
      }
    }).toList();
    return alldata!.whereNotNull().toList() ?? [];
  }

  // estimate

  static List<FilteredMeasurementsEstimate> getEstimate(
      String contractLineItemRef, MBDetailResponse mb) {
    final alldata = mb.estimate?.estimateDetails?.map((e) {
      if (e.id == contractLineItemRef) {
        FilteredMeasurementsEstimate filteredMeasurementsEstimate =
            FilteredMeasurementsEstimate(
          id: e.id,
          sorId: e.sorId,
          category: e.category,
          name: e.name,
          description: e.description,
          unitRate: e.unitRate,
          noOfunit: e.noOfunit,
          uom: e.uom,
          length: e.length,
          width: e.width,
          height: e.height,
          quantity: e.quantity,
          isDeduction: e.isDeduction,
        );

        return filteredMeasurementsEstimate;
      }
    }).toList();

    return alldata!.whereNotNull().toList() ?? [];
  }

  static List<List<SorObject>> getSors(List<FilteredMeasurements> s) {
    List<FilteredMeasurementsMeasure> sor = [];
    List<FilteredMeasurementsMeasure> nonSor = [];

    final k = s!.first!.measures;

    for (int i = 0; i < s.first!.measures!.length; i++) {
      if (k![i].contracts!.first.estimates!.first.category == "SOR") {
        sor.add(k[i]);
      } else {
        nonSor.add(k[i]);
      }
    }

    List<SorObject> listSors = [];
     List<SorObject> listNonSors = [];

    bool isObjectExists(String objectId) {
      return listSors.any((obj) => obj.sorId == objectId);
    }

    void addObjectOrModify(
        String objectId, FilteredMeasurementsMeasure newobj, String type) {
      if (type == "NonSOR") {

        if (isObjectExists(objectId)) {
          SorObject existingObject =
              listNonSors.firstWhere((obj) => obj.sorId == objectId);

          existingObject.filteredMeasurementsMeasure.add(newobj);
        } else {
          listNonSors.add(
            SorObject(
              filteredMeasurementsMeasure: [newobj],
              id: newobj.contracts!.first.estimates!.first.id,
              sorId: newobj.contracts!.first.estimates!.first.sorId,
            ),
          );
        }

      } else {
        if (isObjectExists(objectId)) {
          SorObject existingObject =
              listSors.firstWhere((obj) => obj.sorId == objectId);

          existingObject.filteredMeasurementsMeasure.add(newobj);
        } else {
          listSors.add(
            SorObject(
              filteredMeasurementsMeasure: [newobj],
              id: newobj.contracts!.first.estimates!.first.id,
              sorId: newobj.contracts!.first.estimates!.first.sorId,
            ),
          );
        }
      }
    }

    for (var obj in sor) {
      String mValue = obj!.contracts!.first.estimates!.first.sorId!;

      addObjectOrModify(mValue, obj, "SOR");
    }
//get nonSors
   

     for (var obj in nonSor) {
      String mValue = obj!.contracts!.first.estimates!.first.sorId!;

      addObjectOrModify(mValue, obj, "NonSOR");
    }

//
    return [listSors,listNonSors];
  }
}

class SorObject {
  String? sorId;
  String? id;
  List<FilteredMeasurementsMeasure> filteredMeasurementsMeasure = [];

  SorObject({this.id, this.sorId, required this.filteredMeasurementsMeasure});
}
