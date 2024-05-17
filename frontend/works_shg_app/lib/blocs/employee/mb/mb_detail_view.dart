//mb_detail_view

import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:works_shg_app/models/employee/mb/mb_inbox_response.dart';
import 'package:works_shg_app/utils/global_variables.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/employee_repository/mb.dart';
import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';
import '../../../models/muster_rolls/muster_workflow_model.dart';
import '../../../services/urls.dart';
import '../../../utils/employee/mb/mb_logic.dart';

part 'mb_detail_view.freezed.dart';

typedef MeasurementDetailBlocEventEmitter = Emitter<MeasurementDetailState>;

class MeasurementDetailBloc
    extends Bloc<MeasurementDetailBlocEvent, MeasurementDetailState> {
  MeasurementDetailBloc() : super(const MeasurementDetailState.initial()) {
    on<MeasurementDetailBookBlocEvent>(getMBDetail);
    on<AddToMeasurementLineEvent>(addMeasurementLine);
    on<UpdateToMeasurementLineEvent>(updateMeasurementLine);
    on<UpdateViewModeEvent>(updateViewMode);
    on<CancelUpdateEvent>(cancelUpdate);
    on<SubmitLineEvent>(updatePriceSOR);
    on<MeasurementUploadDocumentBlocEvent>(modifyDocument);
  }
  FutureOr<void> getMBDetail(
    MeasurementDetailBookBlocEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    Client client = Client();
    try {
      emit(const MeasurementDetailState.initial());
      emit(const MeasurementDetailState.loading());
      final MBDetailResponse res = await MBRepository(client.init())
          .fetchMbDetail(url: Urls.measurementService.measurementDetail, body: {
        // "contractNumber": "WO/2023-24/001379",
        // "tenantId": "od.testing",
        // "measurementNumber": "MB/2023-24/000214",
        // "key": "View",
        "contractNumber": event.contractNumber,
        "tenantId": GlobalVariables.tenantId,
        "measurementNumber": event.measurementNumber,
        "key": "View",
      });

      // final kk = jsonEncode(res.allMeasurements!.first!.copyWith(
      //     workflow: const WorkFlow(
      //   action: "Submit",
      //   assignees: ["NESK"],
      //   comment: "loading",
      // )));
      // print(kk);
      List<FilteredMeasurements> data;
      if (event.screenType == MBScreen.create && res.allMeasurements is! List) {
        data = MBLogic.formContract(mbDetailResponse: res);
        print("object");
      } else {
        data = MBLogic.getMeasureList(mbDetailResponse: res, type: event.screenType,);
      }

      // final List<FilteredMeasurements> data =
      //     MBLogic.getMeasureList(mbDetailResponse: res);
      List<List<List<SorObject>>> sorList = MBLogic.getSors(data);
      print("object");
      emit(
        MeasurementDetailState.loaded(
          null,
          event.screenType == MBScreen.create ? false : true,
          res.allMeasurements is List
              ? res.allMeasurements
                  .map<Measurement>((dynamic item) {
                   if (item is Map) {
             
              return Measurement(
                id: item['id'],
                tenantId: item['tenantId'],
                measurementNumber: item['measurementNumber'],
                physicalRefNumber: item['physicalRefNumber'],
                referenceId: item['referenceId'],
                entryDate: item['entryDate'],
                isActive: item['isActive'],
                wfStatus: item['wfStatus'],
                auditDetails: AuditDetails(
                  createdBy: item['auditDetails']['createdBy'],
                  lastModifiedBy: item['auditDetails']['lastModifiedBy'],
                  createdTime: item['auditDetails']['createdTime'],
                  lastModifiedTime: item['auditDetails']['lastModifiedTime'],
                ),
                additionalDetail: MeasurementAdditionalDetail(
                  endDate: item['additionalDetails']['endDate'],
                  sorAmount: double.parse(item['additionalDetails']['sorAmount'].toString()).toDouble(),
                  startDate: item['additionalDetails']['startDate'],
                  totalAmount: double.parse(item['additionalDetails']['totalAmount'].toString()).toDouble(),
                  nonSorAmount: double.parse(item['additionalDetails']['nonSorAmount'].toString()).toDouble(),
                  musterRollNumber: item['additionalDetails']['musterRollNumber'],
                ),
                measures: (item['measures'] as List)
                    .map<Measure>((e) => Measure.fromJson(e as Map<String, dynamic>))
                    .toList(),
                documents: (item['documents'] as List)
                    .map<WorkflowDocument>((e) => WorkflowDocument.fromJson(e as Map<String, dynamic>))
                    .toList(),
              );
            } else {
              // Assuming there's a conversion method or constructor for Measurement
              return Measurement.fromJson(item as Map<String, dynamic>);
            }
                  })
                  .toList()
                  .first
              : res.allMeasurements!,
          data,
          sorList.first.first,
          sorList.first.last,
          sorList.length >= 2 ? sorList[1].first : null,
          sorList.length >= 2 ? sorList[1].last : null,
        ),
      );
    } on DioError catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementDetailState.error(e.toString()));
    }
  }

  FutureOr<void> addMeasurementLine(
    AddToMeasurementLineEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () => null,
        loaded: (value) {
          print(event.sorId);
          print(event.type);
          List<MeasureLineItem> mk = [];
          // MeasureLineItem ml = MeasureLineItem(
          //   width: event.width,
          //   height: event.height,
          //   length: event.length,
          //   number: event.number,
          //   quantity: (calulateQuantity(
          //       height: event.height,
          //       width: event.width,
          //       length: event.length,
          //       number: event.number)),
          //   measurelineitemNo: event.measurementLineIndex,
          // );

          if (event.single) {
            MeasureLineItem mm = const MeasureLineItem(
              width: 0,
              height: 0,
              length: 0,
              number: 0,
              quantity: 0,
              measurelineitemNo: 1,
            );
            mk = [mm];
          } else {
            MeasureLineItem mm = MeasureLineItem(
              width: 0,
              height: 0,
              length: 0,
              number: 0,
              quantity: 0,
              measurelineitemNo: event.measurementLineIndex,
            );
            mk = [mm];
          }

          // final measurementLineIndex = 0;
          // final sorID = "SOR_000143";
          // final filteredMeasurementsMeasureId =
          //     "594d0557-9bc5-467b-9ff1-babf76e6a24e";
// List<SorObject> sorObjects, String sorId,
//       String filteredMeasurementsMeasureId, int measurementLineIndex, MeasureLineItem updatedMeasurementLine

          if (event.type != "NON-SOR") {
            List<SorObject> data = MBLogic.addMeasurementLine(
              value.sor!,
              event.sorId,
              event.filteredMeasurementMeasureId!,
              event.measurementLineIndex!,
              mk,
            );

            emit(value.copyWith(
              sor: data,
            ));
          } else {
            List<SorObject> data = MBLogic.addMeasurementLine(
              value.nonSor!,
              event.sorId,
              event.filteredMeasurementMeasureId!,
              event.measurementLineIndex!,
              mk,
            );

            emit(value.copyWith(
              nonSor: data,
            ));
          }
        },
      );
    } catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      // emit(MeasurementDetailState.error(e.toString()));
    }
  }

  // update mbline

  FutureOr<void> updateMeasurementLine(
    UpdateToMeasurementLineEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () => null,
        loaded: (value) {
          double target = MBLogic.calculateTotalQuantityAndSkip(
            value.sor!,
            event.sorId,
            event.filteredMeasurementMeasureId!,
            event.measurementLineIndex!,
          );
          print("money: $target");
          print(event.sorId);
          print(event.type);

          double currentLineQty = double.parse(calulateQuantity(
                  height: event.height,
                  width: event.width,
                  length: event.length,
                  number: event.number)
              .toString());

          if ((currentLineQty + target) <=
              (double.parse(event.noOfUnit.toString()) -
                  double.parse(event.cummulativePrevQty.toString()))) {
            MeasureLineItem ml = MeasureLineItem(
              width: event.width,
              height: event.height,
              length: event.length,
              number: event.number,
              quantity: calulateQuantity(
                  height: event.height,
                  width: event.width,
                  length: event.length,
                  number: event.number),
              measurelineitemNo: event.measurementLineIndex,
            );

            if (event.type != "NON-SOR") {
              List<SorObject> data = MBLogic.updateMeasurementLine(
                value.sor!,
                event.sorId,
                event.filteredMeasurementMeasureId!,
                event.measurementLineIndex!,
                ml,
              );

              emit(value.copyWith(
                sor: data,
                warningMsg: null,
              ));
            } else {
              List<SorObject> data = MBLogic.updateMeasurementLine(
                value.nonSor!,
                event.sorId,
                event.filteredMeasurementMeasureId!,
                event.measurementLineIndex!,
                ml,
              );

              emit(value.copyWith(
                nonSor: data,
                warningMsg: null,
              ));
            }
          } else {
            emit(value.copyWith(
              warningMsg:
                  "The current quantity of MB entry should not exceed the approved quantity minus the consumed quantity.",
            ));
          }
        },
      );
    } catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementDetailState.error(e.toString()));
    }
  }

// update view mode
  FutureOr<void> updateViewMode(
    UpdateViewModeEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () => null,
        loaded: (value) {
          emit(
            value.copyWith(
              viewStatus: event.updateView,
            ),
          );
        },
      );
    } catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      // emit(MeasurementDetailState.error(e.toString()));
    }
  }

// cancel sor&non-sor mode
  FutureOr<void> cancelUpdate(
    CancelUpdateEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () => null,
        loaded: (value) async {
          if (event.type == "sor") {
            List<SorObject> s = await resetFilteredMeasure(
                value.sor!, event.sorId, [value.data.first]);

            TotalEstimate sorData = MBLogic.calculateTotalQuantity(
                s, "sorId", "filteredMeasurementsMeasureId", 0);

            emit(
              value.copyWith(
                warningMsg: null,
                sor: sorData.sorObjectList,
              ),
            );
          } else {
            List<SorObject> ns = await resetFilteredMeasure(
                value.nonSor!, event.sorId, [value.data.first]);

            TotalEstimate nonSorData = MBLogic.calculateTotalQuantity(
                ns, "sorId", "filteredMeasurementsMeasureId", 0);
            emit(
              value.copyWith(
                warningMsg: null,
                nonSor: nonSorData.sorObjectList,
              ),
            );
          }
        },
      );
    } catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementDetailState.error(e.toString()));
    }
  }

  Future<List<SorObject>> resetFilteredMeasure(List<SorObject> sorObjects,
      String sorId, List<FilteredMeasurements> previousData) async {
    // Find the index of the SorObject with the specified sorId
    int sorIndex =
        sorObjects.indexWhere((sorObject) => sorObject.sorId == sorId);
    if (sorIndex != -1) {
      // Find the previous SorObject from previousData based on sorId
      SorObject? previousSor = findSorObjectById(previousData, sorId);

      if (previousSor != null) {
        // Create a copy of sorObjects
        List<SorObject> copyOfSorObjects = List.of(sorObjects);

        // Replace the existing SorObject with the previous one
        copyOfSorObjects[sorIndex] = previousSor;

        // Return the modified list instead of modifying sorObjects directly
        return copyOfSorObjects;
      }
    }

    // Return the original list if no modification is made
    return sorObjects;
  }
//temp for bug fixes
  // SorObject? findSorObjectById(
  //     List<FilteredMeasurements> filteredMeasurementsList, String sorId) {
  //   for (FilteredMeasurements filteredMeasurements
  //       in filteredMeasurementsList) {
  //     List<FilteredMeasurementsMeasure> mutableList = [];
  //     for (FilteredMeasurementsMeasure measure
  //         in filteredMeasurements.measures ?? []) {
  //       if (measure.contracts!.first.estimates!.first.sorId == sorId) {
  //         mutableList.add(measure);
  //         return SorObject(
  //             id: measure.contracts!.first.estimates!.first.id,
  //             sorId: measure.contracts!.first.estimates!.first.sorId,
  //             filteredMeasurementsMeasure: mutableList
  //             // Fill in the properties of SorObject based on the found measure
  //             );
  //       }
  //     }
  //   }
  //   return null; // If no SorObject with the given sorId is found
  // }

  SorObject? findSorObjectById(
      List<FilteredMeasurements> filteredMeasurementsList, String sorId) {
    for (FilteredMeasurements filteredMeasurements
        in filteredMeasurementsList) {
      List<FilteredMeasurementsMeasure> mutableList = [];
      for (FilteredMeasurementsMeasure measure
          in filteredMeasurements.measures ?? []) {
        if (measure.contracts!.first.estimates!.first.sorId == sorId) {
          mutableList.add(measure);
          // Do not return here
        }
      }
      if (mutableList.isNotEmpty) {
        // If any matching measures are found, create and return SorObject
        return SorObject(
            id: mutableList.first.contracts!.first.estimates!.first.id,
            sorId: mutableList.first.contracts!.first.estimates!.first.sorId,
            filteredMeasurementsMeasure: mutableList
            // Fill in the properties of SorObject based on the found measures
            );
      }
    }
    return null; // If no SorObject with the given sorId is found in any filtered measurements
  }

// calculate qty
  dynamic calulateQuantity({
    required dynamic height,
    required dynamic width,
    required dynamic length,
    required dynamic number,
  }) {
    //return  field==0?1:field;

    if ((height == '0' && width == '0' && length == '0' && number == '0') ||
        (height == '0.0' &&
            width == '0.0' &&
            length == '0.0' &&
            number == '0.0') ||
        (height == 0 && width == 0 && length == 0 && number == 0) ||
        (height == 0.0 && width == 0.0 && length == 0.0 && number == 0.0)) {
      return 0;
    } else {
      if (height == '0' || height == '0.0') {
        height = 1;
      }
      if (width == '0' || width == '0.0') {
        width = 1;
      }
      if (length == '0' || length == '0.0') {
        length = 1;
      }
      if (number == '0' || number == '0.0') {
        number = 1;
      }

      return double.parse((double.parse(height.toString()) *
                  double.parse(width.toString()) *
                  double.parse(length.toString()) *
                  double.parse(number.toString()))
              .toString())
          .toString();
    }
  }

// update price
  FutureOr<void> updatePriceSOR(
    SubmitLineEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () => null,
        loaded: (value) {
          TotalEstimate sorData = MBLogic.calculateTotalQuantity(
              value.sor!, "sorId", "filteredMeasurementsMeasureId", 0);

          TotalEstimate nonSorData = MBLogic.calculateTotalQuantity(
              value.nonSor!, "sorId", "filteredMeasurementsMeasureId", 0);

//update data

          List<FilteredMeasurements> newData = value.data.mapIndexed(
            (index, e) {
              if (index == 0) {
                return FilteredMeasurements(
                  tenantId: e.tenantId,
                  id: e.id,
                  wfStatus: e.wfStatus,
                  mbNumber: e.mbNumber,
                  totalAmount: (sorData.totalAmount + nonSorData.totalAmount),
                  totalNorSorAmount: nonSorData.totalAmount,
                  totalSorAmount: sorData.totalAmount,
                  musterRollNumber: e.musterRollNumber,
                  endDate: e.endDate,
                  startDate: e.startDate,
                  entryDate: e.entryDate,
                  referenceId: e.referenceId,
                  physicalRefNumber: e.physicalRefNumber,
                  measures: e.measures,
                  documents: e.documents?.map((e) => e).toList(),
                );
              } else {
                return e;
              }
            },
          ).toList();

//

          emit(
            value.copyWith(
              data: newData,
              warningMsg: null,
              sor: sorData.sorObjectList,
              nonSor: nonSorData.sorObjectList,
            ),
          );
        },
      );
    } on DioError catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementDetailState.error(e.toString()));
    }
  }

// modify document

  FutureOr<void> modifyDocument(
    MeasurementUploadDocumentBlocEvent event,
    MeasurementDetailBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () => null,
        loaded: (value) {
//update data

          List<WorkflowDocument> updatedDocuments = [
            ...value.data.first.documents ?? []
          ]; // Create a copy of existing documents

// Add or update the new documents
          if (event.workflowDocument != null &&
              event.workflowDocument.isNotEmpty) {
            if (updatedDocuments.isEmpty) {
              // If updatedDocuments is empty, assign event.workflowDocument directly
              updatedDocuments = List.from(event.workflowDocument);
            } else {
              // Iterate over each new document
              for (WorkflowDocument document in event.workflowDocument) {
                // Find and replace the document with the same id, or add the new document
                // int index = updatedDocuments.indexWhere((doc) => doc.id == document.id);
                // if (index != -1) {
                //   updatedDocuments[index] = document;
                // } else {
                //   updatedDocuments.add(document);
                // }

                updatedDocuments.add(document);
              }
            }
          }

          List<FilteredMeasurements> newData = value.data.mapIndexed(
            (index, e) {
              if (index == 0) {
                return FilteredMeasurements(
                  tenantId: e.tenantId,
                  id: e.id,
                  wfStatus: e.wfStatus,
                  mbNumber: e.mbNumber,
                  totalAmount: e.totalAmount,
                  totalNorSorAmount: e.totalNorSorAmount,
                  totalSorAmount: e.totalSorAmount,
                  musterRollNumber: e.musterRollNumber,
                  endDate: e.endDate,
                  startDate: e.startDate,
                  entryDate: e.entryDate,
                  referenceId: e.referenceId,
                  physicalRefNumber: e.physicalRefNumber,
                  measures: e.measures,
                  documents: updatedDocuments.map((e) => e).toList(),
                );
              } else {
                return e;
              }
            },
          ).toList();

//
print(newData);
          emit(
            value.copyWith(
              data: newData,
              warningMsg: null,
            ),
          );
        },
      );
    } on DioError catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementDetailState.error(e.toString()));
    }
  }
}

@freezed
class MeasurementDetailBlocEvent with _$MeasurementDetailBlocEvent {
  const factory MeasurementDetailBlocEvent.uploadDocument({
    required String tenantId,
    required List<WorkflowDocument> workflowDocument,
  }) = MeasurementUploadDocumentBlocEvent;

  const factory MeasurementDetailBlocEvent.create({
    required String tenantId,
    required String contractNumber,
    required String measurementNumber,
    required MBScreen screenType,
  }) = MeasurementDetailBookBlocEvent;

  const factory MeasurementDetailBlocEvent.clear() =
      MeasurementDetailBlocClearEvent;
  const factory MeasurementDetailBlocEvent.addToMeasurementLineList({
    required String sorId,
    required String type,
    int? index,
    int? measurementLineIndex,
    String? filteredMeasurementMeasureId,
    dynamic height,
    dynamic width,
    dynamic length,
    dynamic number,
    dynamic quantity,
    required bool single,
  }) = AddToMeasurementLineEvent;

  const factory MeasurementDetailBlocEvent.updateToMeasurementLineList({
    required dynamic noOfUnit,
    required dynamic cummulativePrevQty,
    required String sorId,
    required String type,
    int? index,
    int? measurementLineIndex,
    String? filteredMeasurementMeasureId,
    dynamic height,
    dynamic width,
    dynamic length,
    dynamic number,
    dynamic quantity,
  }) = UpdateToMeasurementLineEvent;
  // update view mode

  const factory MeasurementDetailBlocEvent.updateViewMode({
    required bool updateView,
  }) = UpdateViewModeEvent;

  // reset the sorlist

  const factory MeasurementDetailBlocEvent.cancelUpdate({
    required bool cancelUpdate,
    required String sorId,
    required dynamic filteredMeasurementsMeasureId,
    required String type,
  }) = CancelUpdateEvent;

  // submit

  const factory MeasurementDetailBlocEvent.submitLine({
    required dynamic noOfUnit,
    required dynamic cummulativePrevQty,
    required String sorId,
    required String type,
    int? index,
    int? measurementLineIndex,
    String? filteredMeasurementMeasureId,
  }) = SubmitLineEvent;
}

@freezed
class MeasurementDetailState with _$MeasurementDetailState {
  const MeasurementDetailState._();

  const factory MeasurementDetailState.initial() = _Initial;
  const factory MeasurementDetailState.loading() = _Loading;
  const factory MeasurementDetailState.loaded(
    String? warningMsg,
    bool viewStatus,
    dynamic rawData,
    List<FilteredMeasurements> data,
    List<SorObject>? sor,
    List<SorObject>? nonSor,
    List<SorObject>? preSor,
    List<SorObject>? preNonSor,
  ) = _Loaded;
  const factory MeasurementDetailState.error(String? error) = _Error;
}
