//mb_crud

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:works_shg_app/services/urls.dart';
import 'package:works_shg_app/utils/employee/mb/mb_logic.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/employee_repository/mb.dart';
import '../../../models/employee/mb/mb_detail_response.dart';
import '../../../models/employee/mb/mb_inbox_response.dart';
part 'mb_crud.freezed.dart';

typedef MeasurementCrudBlocEventEmitter = Emitter<MeasurementCrudState>;

class MeasurementCrudBloc
    extends Bloc<MeasurementCrudBlocEvent, MeasurementCrudState> {
  MeasurementCrudBloc() : super(const MeasurementCrudState.initial()) {
    on<MeasurementUpdateBlocEvent>(updateMeasurement);
  }
  FutureOr<void> updateMeasurement(
    MeasurementUpdateBlocEvent event,
    MeasurementCrudBlocEventEmitter emit,
  ) async {
    Client client = Client();

    try {
       
      emit(const MeasurementCrudState.loading());

      final Measurement res = await MBRepository(client.init()).updateMeasurement(
        url: Urls.measurementService.updateMeasurement,
        body: {
          "measurements": [MBLogic.measurementToMap(event.measurement)]
          //     "measurements": [
          //     {
          //         "id": "23ed34a6-368c-40f7-903b-62e2445aa9b5",
          //         "tenantId": "od.testing",
          //         "measurementNumber": "MB/2023-24/000256",
          //         "physicalRefNumber": null,
          //         "referenceId": "WO/2023-24/001412",
          //         "entryDate": 1710159043609,
          //         "measures": [
          //             {
          //                 "id": "d4632a70-c1c5-4cd7-bbc3-b2b2a9d75807",
          //                // "referenceId": "23ed34a6-368c-40f7-903b-62e2445aa9b5",
          //                 "targetId": "9abc43c4-4c41-49ff-8528-08dd6bc138f9",
          //                 "length": 1,
          //                 "breadth": 1,
          //                 "height": 1,
          //                 "numItems": 7,
          //                 "currentValue": 7,
          //                 "cumulativeValue": 7,
          //                 "isActive": true,
          //                 "comments": null,
          //                 "documents": null,
          //                 // "auditDetails": {
          //                 //     "createdBy": "4ec9da90-ef66-47c8-8a0b-eb87d8cf9c31",
          //                 //     "lastModifiedBy": "81b1ce2d-262d-4632-b2a3-3e8227769a11",
          //                 //     "createdTime": 1709822340529,
          //                 //     "lastModifiedTime": 1710159043886
          //                 // },
          //                 "additionalDetails": {
          //                     "type": "SOR",
          //                     "mbAmount": 472.21999999999997,
          //                     "measureLineItems": [
          //                         {
          //                             "width": 0,
          //                             "height": 0,
          //                             "length": 0,
          //                             "number": "2.5",
          //                             "quantity": 2.5,
          //                             "measurelineitemNo": 0
          //                         },
          //                         {
          //                             "width": 0,
          //                             "height": 0,
          //                             "length": "1.5",
          //                             "number": 0,
          //                             "quantity": 1.5,
          //                             "measurelineitemNo": 1
          //                         },
          //                         {
          //                             "width": 0,
          //                             "height": 0,
          //                             "length": 0,
          //                             "number": "2",
          //                             "quantity": 2,
          //                             "measurelineitemNo": 2
          //                         },
          //                         {
          //                             "width": "1",
          //                             "height": 0,
          //                             "length": 0,
          //                             "number": 0,
          //                             "quantity": 1,
          //                             "measurelineitemNo": 3
          //                         }
          //                     ]
          //                 }
          //             }
          //         ],
          //         "isActive": true,
          //         "documents": [],
          //         // "auditDetails": {
          //         //     "createdBy": "4ec9da90-ef66-47c8-8a0b-eb87d8cf9c31",
          //         //     "lastModifiedBy": "81b1ce2d-262d-4632-b2a3-3e8227769a11",
          //         //     "createdTime": 1709822340529,
          //         //     "lastModifiedTime": 1710159043886
          //         // },
          //         "additionalDetails": {
          //             "endDate": 1710700199999,
          //             "sorAmount": 472.21999999999997,
          //             "startDate": 1710095400000,
          //             "totalAmount": 472.21999999999997,
          //             "nonSorAmount": 0,
          //             "musterRollNumber": []
          //         },
          //         "wfStatus": "SUBMITTED",
          //         "workflow": {
          //             "action": "VERIFY_AND_FORWARD"
          //         }
          //     }
          // ],
        },
      );

     emit(MeasurementCrudState.loaded(res));
    } on DioError catch (e) {
      emit(MeasurementCrudState.error(e.toString()));
    }
  }
}

@freezed
class MeasurementCrudBlocEvent with _$MeasurementCrudBlocEvent {
  const factory MeasurementCrudBlocEvent.update({
    required String tenantId,
    required Measurement measurement,
    required WorkFlow workFlow,
  }) = MeasurementUpdateBlocEvent;

  const factory MeasurementCrudBlocEvent.clear() =
      MeasurementCrudBlocClearEvent;
}

@freezed
class MeasurementCrudState with _$MeasurementCrudState {
  const MeasurementCrudState._();

  const factory MeasurementCrudState.initial() = _Initial;
  const factory MeasurementCrudState.loading() = _Loading;
  const factory MeasurementCrudState.loaded(
    Measurement? measurement,
  ) = _Loaded;
  const factory MeasurementCrudState.error(String? error) = _Error;
}
