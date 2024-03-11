import 'package:collection/collection.dart';

import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';
import '../../../models/employee/mb/mb_inbox_response.dart';

class MBLogic {
  static List<FilteredMeasurements> getMeasureList(
      {required MBDetailResponse mbDetailResponse}) {
    final List<Measurement> allMeasurements =
        mbDetailResponse.allMeasurements ?? [];

    final data = allMeasurements.map((e) {
      FilteredMeasurements datak = FilteredMeasurements(
          id: e.id,
          totalSorAmount: e.additionalDetail?.sorAmount ?? 0.0,
          totalNorSorAmount: e.additionalDetail?.nonSorAmount ?? 0.0,
          totalAmount: e.additionalDetail?.totalAmount ?? 0.0,
          endDate: e.additionalDetail?.endDate,
          startDate: e.additionalDetail?.startDate,
          entryDate: e.entryDate,
          physicalRefNumber: e.physicalRefNumber,
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
              tenantId: null,
              targetId: e.targetId,
              isActive: e.isActive,
              id: e.id,
              contracts: getContract(
                e.targetId!,
                mbDetailResponse,
              ),
              measureLineItems: e.measureAdditionalDetails != null
                  ? e.measureAdditionalDetails!.measureLineItems != null
                      ? e.measureAdditionalDetails!.measureLineItems!
                      : null
                  : null,
            );

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
          noOfunit: e.noOfunit != null ? e.noOfunit!.toInt() : 0,
          uom: e.uom,
          length: e.length != null ? e.length!.toInt() : 0,
          width: e.width != null ? e.width!.toInt() : 0,
          height: e.height != null ? e.height!.toInt() : 0,
          quantity: e.quantity != null ? e.quantity!.toInt() : 0,
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
    return [listSors, listNonSors];
  }

  // to get

  static List<Measure> getList(List<SorObject> sorObjects) {
    List<Measure> measureList = [];

    for (SorObject sorObject in sorObjects) {
      for (FilteredMeasurementsMeasure measure
          in sorObject.filteredMeasurementsMeasure) {
        measureList.add(Measure(
          description: measure.contracts?.first.estimates?.first.description,
          comments:
              null, // You can set comments to the appropriate value if available
          targetId: measure.targetId,
          breadth: measure.breath,
          length: measure.length,
          height: measure.height,
          isActive: measure.isActive,
          referenceId: measure.referenceId,
          numItems: measure.numItems,
          id: measure.id,
          cumulativeValue: measure.cumulativeValue,
          currentValue: measure.currentValue,
          measureAdditionalDetails: MeasureAdditionalDetails(
            type: measure.type,
            mbAmount: measure.mbAmount,
            measureLineItems: measure.measureLineItems,
          ),
        ));
      }
    }

    return measureList;
  }

// form payload for update MB

  static MBDetailResponse getMbPayloadUpdate({
    required List<FilteredMeasurements> data,
    required List<List<SorObject>> sorList,
  }) {
    MBDetailResponse sa = MBDetailResponse(
      measurement: Measurement(
        id: data.first.id,
        tenantId: data.first.tenantId,
        measurementNumber: data.first.mbNumber,
        physicalRefNumber: data.first.physicalRefNumber,
        referenceId: data.first.referenceId,
        entryDate: data.first.endDate,
        isActive: true,
        wfStatus: data.first.wfStatus,
        workflow: const WorkFlow(
          action: "SAVE_AS_DRAFT",
        ),
        additionalDetail: MeasurementAdditionalDetail(
          endDate: data.first.endDate,
          sorAmount: data.first.totalSorAmount,
          nonSorAmount: data.first.totalNorSorAmount,
          startDate: data.first.startDate,
          musterRollNumber: [data.first.musterRollNumber.toString()],
          totalAmount: data.first.totalAmount,
        ),
        measures: MBLogic.getList(
          sorList.expand((element) => element).toList(),
        ),
      ),
    );

    return sa;
  }
}

class SorObject {
  String? sorId;
  String? id;
  List<FilteredMeasurementsMeasure> filteredMeasurementsMeasure = [];

  SorObject({this.id, this.sorId, required this.filteredMeasurementsMeasure});
}
