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
    on<WorkOrderInboxSortBlocEvent>(sort);
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


// function for sorting

  FutureOr<void> sort(
    WorkOrderInboxSortBlocEvent event,
    WorkOrderInboxBlocEventEmitter emit,
  ) async {
    try {
      state.maybeMap(
        orElse: () {
          return null;
        },
        loaded: (value) {
          List<Contracts> itemList =
              List.from(value.contracts ?? []);
          switch (event.sortCode) {
            case 0:
              itemList.sort((a, b) => a.endDate!
                  .compareTo(b.endDate!));

              break;
            case 1:
              itemList.sort((a, b) => a.startDate!
                  .compareTo(b.startDate!));
              break;
            case 2:
              itemList.sort((a, b) => a.issueDate!
                  .compareTo(b.issueDate!));
              break;
            case 3:
              itemList.sort((a, b) => b.totalContractedAmount!
                  .compareTo(a.totalContractedAmount!));
              break;
              case 4:
              itemList.sort((a, b) => a.additionalDetails!.cboName!
                  .compareTo(b.additionalDetails!.cboName!));
              break;
            default:
          }

          emit(value.copyWith(
            contracts: itemList
          ));
        },
      );
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

  // event for sorting the list
  const factory WorkOrderInboxBlocEvent.sort({
    required int sortCode,
  }) = WorkOrderInboxSortBlocEvent;

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
