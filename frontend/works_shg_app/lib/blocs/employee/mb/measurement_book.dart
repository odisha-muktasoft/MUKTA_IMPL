import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/employee_repository/mb.dart';
import '../../../models/employee/mb/mb_inbox_response.dart';
import '../../../services/urls.dart';
part 'measurement_book.freezed.dart';

typedef MeasurementInboxBlocEventEmitter = Emitter<MeasurementInboxState>;

class MeasurementInboxBloc
    extends Bloc<MeasurementInboxBlocEvent, MeasurementInboxState> {
  MeasurementInboxBloc() : super(const MeasurementInboxState.initial()) {
    on<MeasurementBookInboxBlocEvent>(getMBInbox);
  }
  FutureOr<void> getMBInbox(
    MeasurementBookInboxBlocEvent event,
    MeasurementInboxBlocEventEmitter emit,
  ) async {
    Client client = Client();
    try {
      if (event.offset == 0) {
        emit(const MeasurementInboxState.loading());
      }

      final MBInboxResponse res = await MBRepository(client.init())
          .fetchMbInbox(url: Urls.measurementService.measurementInbox, body: {
        "inbox": {
          "tenantId": "od.testing",
          "moduleSearchCriteria": {"tenantId": "od.testing"},
          "processSearchCriteria": {
            "businessService": ["MB"],
            "moduleName": "measurement-service"
          },
          "limit": 10,
          "offset": event.offset
        },
        // "RequestInfo": {
        //   "apiId": "Rainmaker",
        //   "authToken": "db570c2b-950a-4084-87fc-6fa7482a22f7",
        //   "userInfo": {
        //     "id": 357,
        //     "uuid": "4ec9da90-ef66-47c8-8a0b-eb87d8cf9c31",
        //     "userName": "EMPJIT",
        //     "name": "Sumana Naga sai",
        //     "mobileNumber": "7895456214",
        //     "emailId": null,
        //     "locale": null,
        //     "type": "EMPLOYEE",
        //     "active": true,
        //     "tenantId": "od.testing",
        //     "permanentCity": null
        //   },
        //   "msgId": "1708076019861|en_IN",
        //   "plainAccessRequest": {}
        // }
      });
      if (event.offset == 0) {
        emit(MeasurementInboxState.loaded(res,true));
      } else {
        state.maybeMap(
          orElse: () {
            return null;
          },
          loaded: (value) {
            List<ItemData> data = [];
            data.addAll(value.mbInboxResponse.items ?? []);
            data.addAll(res.items!);

            emit(MeasurementInboxState.loaded(
                value.mbInboxResponse.copyWith(items: data),
                res.items!.length<10?false:true
                ),);
          },
        );
      }
    } on DioError catch (e) {
      emit(MeasurementInboxState.error(e.response?.data['Errors'][0]['code']));
    }
  }
}

@freezed
class MeasurementInboxBlocEvent with _$MeasurementInboxBlocEvent {
  const factory MeasurementInboxBlocEvent.create({
    required String tenantId,
    required String businessService,
    required String moduleName,
    required int limit,
    required int offset,
  }) = MeasurementBookInboxBlocEvent;

  const factory MeasurementInboxBlocEvent.clear() =
      MeasurementBookInboxBlocClearEvent;
}

@freezed
class MeasurementInboxState with _$MeasurementInboxState {
  const MeasurementInboxState._();

  const factory MeasurementInboxState.initial() = _Initial;
  const factory MeasurementInboxState.loading() = _Loading;
  const factory MeasurementInboxState.loaded(MBInboxResponse mbInboxResponse,
  bool isLoading
  ) =
      _Loaded;
  const factory MeasurementInboxState.error(String? error) = _Error;
}
