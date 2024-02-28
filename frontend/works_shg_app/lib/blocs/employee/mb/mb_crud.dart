//mb_crud

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:works_shg_app/services/urls.dart';

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

       await MBRepository(client.init()).updateMeasurement(url: Urls.measurementService.updateMeasurement,
       body: {

       });
       
     } on DioError catch (e) {
       
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
    MBInboxResponse mbInboxResponse,
  ) = _Loaded;
  const factory MeasurementCrudState.error(String? error) = _Error;
}
