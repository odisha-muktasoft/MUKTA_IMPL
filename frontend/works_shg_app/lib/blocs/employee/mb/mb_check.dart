//mb_detail_view

import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:works_shg_app/models/employee/mb/mb_inbox_response.dart';
import 'package:works_shg_app/utils/global_variables.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/employee_repository/mb.dart';
import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';
import '../../../models/muster_rolls/muster_workflow_model.dart';
import '../../../services/urls.dart';
import '../../../utils/employee/mb/mb_logic.dart';

part 'mb_check.freezed.dart';

typedef MeasurementCheckBlocEventEmitter = Emitter<MeasurementCheckState>;

class MeasurementCheckBloc
    extends Bloc<MeasurementCheckBlocEvent, MeasurementCheckState> {
  MeasurementCheckBloc() : super(const MeasurementCheckState.initial()) {
    on<MeasurementCheckEvent>(checkMB);
  }
  FutureOr<void> checkMB(
    MeasurementCheckEvent event,
    MeasurementCheckBlocEventEmitter emit,
  ) async {
    Client client = Client();
    try {
      emit(const MeasurementCheckState.initial());
      emit(const MeasurementCheckState.loading());
      final MBDetailResponse res = await MBRepository(client.init())
          .fetchMbDetail(url: Urls.measurementService.measurementDetail, body: {
        "contractNumber": event.contractNumber,
        "tenantId": GlobalVariables.tenantId,
        "measurementNumber": event.measurementNumber,
        "key": "View",
      });

      bool? workOrderStatus;
      bool? estimateStatus;
      bool? existingMB;
      if (res.allMeasurements is! List) {
        workOrderStatus = (res.contract!.wfStatus == "APPROVED" ||
                res.contract!.wfStatus == "ACCEPTED")
            ? true
            : false;
        estimateStatus = res.estimate!.wfStatus == "APPROVED" ? true : false;

        existingMB = true;
      } else {
        workOrderStatus = (res.contract!.wfStatus == "APPROVED" ||
                res.contract!.wfStatus == "ACCEPTED")
            ? true
            : false;
        estimateStatus = res.estimate!.wfStatus == "APPROVED" ? true : false;

        existingMB = (res.allMeasurements[0]['wfStatus'] == "APPROVED" ||
                res.allMeasurements[0]['wfStatus'] == "REJECTED")
            ? true
            : false;
      }

      emit(
        MeasurementCheckState.loaded(
          workOrderStatus,
          estimateStatus,
          existingMB,
          event.contractNumber,
        ),
      );
    } on DioError catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementCheckState.error(e.toString()));
    }
  }
}

@freezed
class MeasurementCheckBlocEvent with _$MeasurementCheckBlocEvent {
  const factory MeasurementCheckBlocEvent.create({
    required String tenantId,
    required String contractNumber,
    required String measurementNumber,
    required MBScreen screenType,
  }) = MeasurementCheckEvent;

  const factory MeasurementCheckBlocEvent.clear() =
      MeasurementCheckBlocClearEvent;
}

@freezed
class MeasurementCheckState with _$MeasurementCheckState {
  const MeasurementCheckState._();

  const factory MeasurementCheckState.initial() = _Initial;
  const factory MeasurementCheckState.loading() = _Loading;
  const factory MeasurementCheckState.loaded(
    bool? workOrderStatus,
    bool? estimateStatus,
    bool? existingMB,
    String? workOrderNumber,
  ) = _Loaded;
  const factory MeasurementCheckState.error(String? error) = _Error;
}
