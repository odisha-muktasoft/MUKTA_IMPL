import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:works_shg_app/data/repositories/employee_repository/work_order.dart';
import 'package:works_shg_app/models/employee/work_order/wo_inbox_response.dart';
import 'package:works_shg_app/utils/global_variables.dart';

import '../../../data/remote_client.dart';
import '../../../data/repositories/work_order_repository/my_works_repository.dart';
import '../../../models/works/contracts_model.dart';
import '../../../services/urls.dart';
import '../../../utils/constants.dart';
part 'workorder_book.freezed.dart';

typedef WorkOrderInboxBlocEventEmitter = Emitter<WorkOrderInboxState>;

class WorkOrderInboxBloc
    extends Bloc<WorkOrderInboxBlocEvent, WorkOrderInboxState> {
  WorkOrderInboxBloc() : super(const WorkOrderInboxState.initial()) {
    on<WorkOrderInboxBlocCreateEvent>(getWorkOrderInbox);
  }
  FutureOr<void> getWorkOrderInbox(
    WorkOrderInboxBlocCreateEvent event,
    WorkOrderInboxBlocEventEmitter emit,
  ) async {
    Client client = Client();
    try {
      if (event.offset == 0) {
        emit(const WorkOrderInboxState.loading());
      }
      // old
      // final WOInboxResponse res = await WORepository(client.init())
      //     .fetchWoInbox(url: Urls.measurementService.measurementInbox, body: {
      //   "inbox": {
      //     "tenantId": GlobalVariables.tenantId,
      //     "moduleSearchCriteria": {"tenantId": GlobalVariables.tenantId},
      //     "processSearchCriteria": {
      //       "businessService": ["CONTRACT","CONTRACT-REVISION"],
      //       "moduleName": "contract-service"
      //     },
      //     "limit": 10,
      //     "offset": event.offset
      //   },
        
      // });

       ContractsModel contractsModel =
            await MyWorksRepository(client.init()).searchMyWorks(
                url: Urls.workServices.myWorks,
                body: {
                  
                  "tenantId": GlobalVariables.tenantId??
                  GlobalVariables
                      .organisationListModel!.organisations!.first.tenantId,
                  "orgIds": [],
                  "wfStatus": ["ACCEPTED"],
                  "pagination": {
                    "limit": "10",
                    "offSet": event.offset.toString(),
                    "sortBy": "lastModifiedTime",
                    "order": "desc"
                  }
                },
                options: Options(extra: {
                  "userInfo": GlobalVariables.userRequestModel,
                  "accessToken": GlobalVariables.authToken,
                  "apiId": "asset-services",
                  "msgId": "search with from and to values"
                }));

      if (event.offset == 0) {
        emit(WorkOrderInboxState.loaded(null,true,
        contractsModel.contracts?.where((e) => e.status != Constants.inActive)
                .toList(),
        ));
      } else {
        state.maybeMap(
          orElse: () {
            return null;
          },
          loaded: (value) {
            List<Contracts> data = [];
            data.addAll(value.contracts?? []);
            data.addAll(contractsModel.contracts!.where((e) => e.status != Constants.inActive)
                .toList());

            emit(WorkOrderInboxState.loaded(
                null,
                data!.length<10?false:true,
                data,
                ),);
          },
        );
      }
    } on DioError catch (e) {
      emit(WorkOrderInboxState.error(e.response?.data['Errors'][0]['code']));
    }
  }
}

@freezed
class WorkOrderInboxBlocEvent with _$WorkOrderInboxBlocEvent {
  const factory WorkOrderInboxBlocEvent.create({
    required String tenantId,
    required String businessService,
    required String moduleName,
    required int limit,
    required int offset,
  }) = WorkOrderInboxBlocCreateEvent;

  const factory WorkOrderInboxBlocEvent.clear() =
     WorkOrderInboxBlocClearEvent;
}

@freezed
class WorkOrderInboxState with _$WorkOrderInboxState {
  const WorkOrderInboxState._();

  const factory WorkOrderInboxState.initial() = _Initial;
  const factory WorkOrderInboxState.loading() = _Loading;
  const factory WorkOrderInboxState.loaded(WOInboxResponse? mbInboxResponse,
  bool isLoading,
  List<Contracts>? contracts,
  ) =
      _Loaded;
  const factory WorkOrderInboxState.error(String? error) = _Error;
}
