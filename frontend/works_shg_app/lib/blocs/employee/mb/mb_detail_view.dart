//mb_detail_view

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/employee_repository/mb.dart';
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
      emit(
       const  MeasurementDetailState.loading()
      );
      final MBDetailResponse res = await MBRepository(client.init())
          .fetchMbDetail(url: Urls.measurementService.measurementDetail, body: {
        "contractNumber": "WO/2023-24/001379",
        "tenantId": "od.testing",
        "measurementNumber": "MB/2023-24/000214",
        "key": "View",
      });

     final data= MBLogic.getMeasureList(mbDetailResponse: res);
    final Map<String, List<Map<String, dynamic>>> ok= MBLogic.getSors(data);
     emit(MeasurementDetailState.loaded(ok));
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
    required String businessService,
    required String moduleName,
    required int limit,
    required int offset,
  }) = MeasurementDetailBookBlocEvent;

  const factory MeasurementDetailBlocEvent.clear() =
      MeasurementDetailBlocClearEvent;
}

@freezed
class MeasurementDetailState with _$MeasurementDetailState {
  const MeasurementDetailState._();

  const factory MeasurementDetailState.initial() = _Initial;
  const factory MeasurementDetailState.loading() = _Loading;
  const factory MeasurementDetailState.loaded(dynamic data) = _Loaded;
  const factory MeasurementDetailState.error(String? error) = _Error;
}
