//mb_detail_view

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:works_shg_app/models/employee/mb/mb_inbox_response.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/employee_repository/mb.dart';
import '../../../models/employee/mb/filtered_Measures.dart';
import '../../../models/employee/mb/mb_detail_response.dart';
import '../../../services/urls.dart';
import '../../../utils/employee/mb/mb_logic.dart';

part 'mb_detail_view.freezed.dart';

typedef MeasurementDetailBlocEventEmitter = Emitter<MeasurementDetailState>;

class MeasurementDetailBloc
    extends Bloc<MeasurementDetailBlocEvent, MeasurementDetailState> {
  MeasurementDetailBloc() : super(const MeasurementDetailState.initial()) {
    on<MeasurementDetailBookBlocEvent>(getMBInbox);
  }
  FutureOr<void> getMBInbox(
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
        "tenantId": "od.testing",
        "measurementNumber": event.measurementNumber,
        "key": "View",
      });

      final kk = jsonEncode(res.allMeasurements!.first!.copyWith(
          workflow: const WorkFlow(
        action: "Submit",
        assignees: ["NESK"],
        comment: "loading",
      )));
      print(kk);
      final List<FilteredMeasurements> data =
          MBLogic.getMeasureList(mbDetailResponse: res);

      List<List<SorObject>> sorList = MBLogic.getSors(data);

      // experiment
      // MBDetailResponse sa = MBDetailResponse(
      //   measurement: Measurement(
      //     id: data.first.id,
      //     tenantId: data.first.tenantId,
      //     measurementNumber: data.first.mbNumber,
      //     physicalRefNumber: data.first.physicalRefNumber,
      //     referenceId: data.first.referenceId,
      //     entryDate: data.first.endDate,
      //     isActive: true,
      //     wfStatus: data.first.wfStatus,
      //     workflow: const WorkFlow(
      //       action: "SAVE_AS_DRAFT",
      //     ),
      //     additionalDetail: MeasurementAdditionalDetail(
      //       endDate: data.first.endDate,
      //       sorAmount: data.first.totalSorAmount,
      //       nonSorAmount: data.first.totalNorSorAmount,
      //       startDate: data.first.startDate,
      //       musterRollNumber: [data.first.musterRollNumber.toString()],
      //       totalAmount: data.first.totalAmount,
      //     ),
      //     measures: MBLogic.getList(
      //       sorList.expand((element) => element).toList(),
      //     ),
      //   ),
      // );

      MBDetailResponse kkk =
          MBLogic.getMbPayloadUpdate(data: data, sorList: sorList);
      print(kkk.measurement.toString());

      //
      emit(
        MeasurementDetailState.loaded(
          res.allMeasurements!.first!,
          data,
          sorList.first,
          sorList.last,
        ),
      );
    } on DioError catch (e) {
      // emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
      emit(MeasurementDetailState.error(e.toString()));
    }
  }
}

@freezed
class MeasurementDetailBlocEvent with _$MeasurementDetailBlocEvent {
  const factory MeasurementDetailBlocEvent.create({
    required String tenantId,
    required String contractNumber,
    required String measurementNumber,
  }) = MeasurementDetailBookBlocEvent;

  const factory MeasurementDetailBlocEvent.clear() =
      MeasurementDetailBlocClearEvent;
}

@freezed
class MeasurementDetailState with _$MeasurementDetailState {
  const MeasurementDetailState._();

  const factory MeasurementDetailState.initial() = _Initial;
  const factory MeasurementDetailState.loading() = _Loading;
  const factory MeasurementDetailState.loaded(
    Measurement rawData,
    List<FilteredMeasurements> data,
    List<SorObject>? sor,
    List<SorObject>? nonSor,
  ) = _Loaded;
  const factory MeasurementDetailState.error(String? error) = _Error;
}
