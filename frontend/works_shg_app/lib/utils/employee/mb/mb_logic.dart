import 'package:collection/collection.dart';

import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';

class MBLogic {
  static List<FilteredMeasurements> getMeasureList({required MBDetailResponse mbDetailResponse}) {
    final List<Measurement> allMeasurements =
        mbDetailResponse.allMeasurements ?? [];

    final data = allMeasurements.map((e) {
      FilteredMeasurements datak = FilteredMeasurements(
          totalSorAmount: e.additionalDetail?.sorAmount ?? 0.0,
          totalNorSorAmount: e.additionalDetail?.nonSorAmount ?? 0.0,
          totalAmount: e.additionalDetail?.totalAmount ?? 0.0,
          musterRollNumber: e.additionalDetail?.musterRollNumber ?? "",
          mbNumber: e.measurementNumber,
          wfStatus: e.wfStatus,
          tenantId: e.tenantId,
          measures: e.measures?.map((e) {
            FilteredMeasurementsMeasure filteredMeasurementsMeasure =
                FilteredMeasurementsMeasure(
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

  static List<FilteredMeasurementsContract> getContract(String targetId, MBDetailResponse mb) {
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

  static List<FilteredMeasurementsEstimate> getEstimate(String contractLineItemRef, MBDetailResponse mb) {
    final alldata = mb.estimate?.estimateDetails?.map((e) {

     
      if (e.id == contractLineItemRef) {
         FilteredMeasurementsEstimate filteredMeasurementsEstimate=FilteredMeasurementsEstimate(
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

  ///end
  // static dynamic getMeasureList({required MBDetailResponse mbDetailResponse}) {
  //   final List<Measurement> allMeasurements =
  //       mbDetailResponse.allMeasurements ?? [];

  //   final data = allMeasurements.map((e) {
  //     final data = {
  //       "totalSorAmount": e.additionalDetail?.sorAmount ?? 0.0,
  //       "totalNorSorAmount": e.additionalDetail?.nonSorAmount ?? 0.0,
  //       "totalAmount": e.additionalDetail?.totalAmount ?? 0.0,
  //       "musterRollNumber": e.additionalDetail?.musterRollNumber ?? "",
  //       "mbNumber": e.measurementNumber,
  //       "wfStatus": e.wfStatus,
  //       "tenantId": e.tenantId,
  //       "measures": e.measures?.map((e) {
  //         final data = {
  //           "length": e.length,
  //           "breath": e.breadth,
  //           "height": e.height,
  //           "numItems": e.numItems,
  //           "currentValue": e.currentValue,
  //           "cummulativeValue": e.cumulativeValue,
  //           "contract": getContract(e.targetId!, mbDetailResponse)
  //         };
  //         return data;
  //       }).toList(),
  //     };

  //     return data;
  //   }).toList();

  //   // print(data);
  //   return data.whereNotNull().toList() ?? [];
  // }

  // static dynamic getContract(String targetId, MBDetailResponse mb) {
  //   final alldata = mb.contract?.lineItems?.map((e) {
  //     if (e.contractLineItemRef == targetId) {
  //       final data = {
  //         "estimateId": e.estimateId,
  //         "estimateLineItemId": e.estimateLineItemId,
  //         "contractLineItemRef": e.contractLineItemRef,
  //         "unitRate": e.unitRate,
  //         "status": e.status,
  //         "estimate": getEstimate(e.estimateLineItemId!, mb)
  //       };
  //       return data;
  //     }
  //   }).toList();
  //   return alldata!.whereNotNull().toList() ?? [];
  // }

  // // estimate

  // static dynamic getEstimate(String contractLineItemRef, MBDetailResponse mb) {
  //   final alldata = mb.estimate?.estimateDetails?.map((e) {
  //     if (e.id == contractLineItemRef) {
  //       final data = {
  //         "id": e.id,
  //         "sorId": e.sorId,
  //         "category": e.category,
  //         "name": e.name,
  //         "description": e.description,
  //         "unitRate": e.unitRate,
  //         "noOfunit": e.noOfunit,
  //         "uom": e.uom,
  //         "length": e.length,
  //         "width": e.width,
  //         "height": e.height,
  //         "quantity": e.quantity,
  //         "isDeduction": e.isDeduction,
  //       };
  //       return data;
  //     }
  //   }).toList();

  //   return alldata!.whereNotNull().toList() ?? [];
  // }

// // get sors

//   static Map<String, List<Map<String, dynamic>>> getSors(List<FilteredMeasurements> s) {
//     List<FilteredMeasurementsMeasure> sor = [];
//     List<dynamic> nonSor = [];

//     final k = s!.first!.measures;

//     for (int i = 0; i < s.first!.measures!.length; i++) {
//       // if (k[i]['contract'][0]['estimate'][0]['category'] == "SOR") {
//          if (k![i].contracts!.first.estimates!.first.category == "SOR") {
//         sor.add(k[i]);
//       } else {
//         nonSor.add(k[i]);
//       }
//     }

//     //Map<String, List<Map<String, dynamic>>> groupedObjects = {};
//     List<SorObject> groupedObjects = [];

//     // for (var obj in sor) {
//     //  // String mValue = obj['contract'][0]['estimate'][0]['sorId'];
//     //    String mValue = obj!.contracts!.first.estimates!.first.sorId!;
//     //   if (groupedObjects.containsKey(mValue)) {
//     //     groupedObjects[mValue]!.add(obj);
//     //   } else {
//     //     groupedObjects[mValue] = [obj];
//     //   }
//     // }

//     // return groupedObjects;


// /// my work
// /// 
//  bool isObjectExists(String objectId) {
//     return groupedObjects.any((obj) => obj.id == objectId);
//   }

//   // Function to add or modify object in the list
//   void addObjectOrModify(String objectId, String newName) {
//     if (isObjectExists(objectId)) {
//       // Modify object if it exists
//       SorObject existingObject = groupedObjects.firstWhere((obj) => obj.id == objectId);
//       // For example, adding a new field value
//       existingObject.sorId = newName;
//     } else {
//       // Add new object if it doesn't exist
//       groupedObjects.add(SorObject(id: objectId, m: 0, name: newName));
//     }
//   }
//     for (var obj in sor) {
//      // String mValue = obj['contract'][0]['estimate'][0]['sorId'];
//        String mValue = obj!.contracts!.first.estimates!.first.sorId!;

//        addObjectOrModify(mValue,'');
//       // if (groupedObjects.containsKey(mValue)) {
//       //   groupedObjects[mValue]!.add(obj);
//       // } else {
//       //   groupedObjects[mValue] = [obj];
//       // }
//     }

//     return groupedObjects;
//   }


/// testing
// get sors

  static List<SorObject> getSors(List<FilteredMeasurements> s) {
    List<FilteredMeasurementsMeasure> sor = [];
    List<dynamic> nonSor = [];

    final k = s!.first!.measures;

    for (int i = 0; i < s.first!.measures!.length; i++) {
      // if (k[i]['contract'][0]['estimate'][0]['category'] == "SOR") {
         if (k![i].contracts!.first.estimates!.first.category == "SOR") {
        sor.add(k[i]);
      } else {
        nonSor.add(k[i]);
      }
    }

    //Map<String, List<Map<String, dynamic>>> groupedObjects = {};
    List<SorObject> groupedObjects = [];

    // for (var obj in sor) {
    //  // String mValue = obj['contract'][0]['estimate'][0]['sorId'];
    //    String mValue = obj!.contracts!.first.estimates!.first.sorId!;
    //   if (groupedObjects.containsKey(mValue)) {
    //     groupedObjects[mValue]!.add(obj);
    //   } else {
    //     groupedObjects[mValue] = [obj];
    //   }
    // }

    // return groupedObjects;


/// my work
/// 
 bool isObjectExists(String objectId) {
    return groupedObjects.any((obj) => obj.sorId == objectId);
  }

  // Function to add or modify object in the list
  void addObjectOrModify(String objectId, FilteredMeasurementsMeasure newobj) {
    if (isObjectExists(objectId)) {
      // Modify object if it exists
      SorObject existingObject = groupedObjects.firstWhere((obj) => obj.sorId == objectId);
      // For example, adding a new field value
     existingObject.filteredMeasurementsMeasure.add(newobj);
    } else {
      // Add new object if it doesn't exist
      groupedObjects.add( SorObject(filteredMeasurementsMeasure: [newobj],
      id: newobj.contracts!.first.estimates!.first.id,
      sorId: newobj.contracts!.first.estimates!.first.sorId,
      ),
      );
    }
  }
    for (var obj in sor) {
     // String mValue = obj['contract'][0]['estimate'][0]['sorId'];
       String mValue = obj!.contracts!.first.estimates!.first.sorId!;

       addObjectOrModify(mValue, obj);
      // if (groupedObjects.containsKey(mValue)) {
      //   groupedObjects[mValue]!.add(obj);
      // } else {
      //   groupedObjects[mValue] = [obj];
      // }
    }

    return groupedObjects;
  }
}



class SorObject {
  String? sorId;
  String? id;
  List<FilteredMeasurementsMeasure> filteredMeasurementsMeasure=[];

  SorObject({ this.id,  this.sorId,  required this.filteredMeasurementsMeasure});

  
}