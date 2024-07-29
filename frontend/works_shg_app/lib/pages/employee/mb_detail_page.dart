import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/blocs/employee/estimate/estimate.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_crud.dart';
import 'package:works_shg_app/blocs/employee/mb/project_type.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/constants.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/utils/notifiers.dart';
import 'package:works_shg_app/widgets/atoms/empty_image.dart';
import 'package:works_shg_app/widgets/mb/mb_detail_card.dart';

import '../../blocs/employee/emp_hrms/emp_hrms.dart';
import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/muster_rolls/get_business_workflow.dart';
import '../../blocs/muster_rolls/get_muster_workflow.dart';
import '../../blocs/work_orders/search_individual_work.dart';
import '../../models/employee/mb/filtered_Measures.dart';
import '../../models/file_store/file_store_model.dart';
import '../../models/muster_rolls/business_service_workflow.dart';
import '../../utils/common_methods.dart';
import '../../utils/date_formats.dart';
import '../../utils/employee/mb/mb_logic.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/atoms/digit_timeline.dart';
import '../../widgets/drawer_wrapper.dart';
import '../../widgets/mb/float_action_card.dart';
import '../../widgets/mb/multi_image.dart';
import '../../widgets/mb/workFlowButtonList.dart';
import '../../widgets/mb/sor_item_add_mb.dart';
import '../../widgets/mb/text_button_underline.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class MBDetailPage extends StatefulWidget {
  final String contractNumber;
  final String mbNumber;
  final String? tenantId;
  final MBScreen type;
  const MBDetailPage(
      {super.key,
      required this.contractNumber,
      required this.mbNumber,
      this.tenantId,
      required this.type});

  @override
  State<MBDetailPage> createState() => _MBDetailPageState();
}

class _MBDetailPageState extends State<MBDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  int phots = 0;
  List<DigitTimelineOptions> timeLineAttributes = [];

  // check points for creating new MB
//  ACTIVE
  String workorderStatus = "";
  //  INWORKFLOW
  String estimateStatus = "";
  @override
  void initState() {
    if (widget.type == MBScreen.create) {
      context.read<BusinessWorkflowBloc>().add(
            //hard coded
            GetBusinessWorkflowEvent(
              tenantId: widget.tenantId!,
              // businessService: 'CONTRACT',
              businessService: 'MB',
            ),
          );
      // SearchIndividualWorkBloc
      context.read<SearchIndividualWorkBloc>().add(
            IndividualWorkSearchEvent(
                contractNumber: widget.contractNumber, body: null),
          );
    } else {
      context.read<MusterGetWorkflowBloc>().add(
            FetchMBWorkFlowEvent(
                tenantId: widget.tenantId!, mbNumber: widget.mbNumber),
          );
    }
    context.read<MeasurementDetailBloc>().add(
          MeasurementDetailBookBlocEvent(
            tenantId: widget.tenantId!,
            contractNumber: widget.contractNumber,
            measurementNumber: widget.mbNumber,
            screenType: widget.type,
          ),
        );

    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabController.removeListener(_handleTabSelection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<MeasurementCrudBloc, MeasurementCrudState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () => {},
              loaded: (value) {
                if (widget.type == MBScreen.update) {
                  context.read<MusterGetWorkflowBloc>().add(
                        FetchMBWorkFlowEvent(
                            tenantId: GlobalVariables.tenantId!,
                            mbNumber: widget.mbNumber!),
                      );

                  context.read<MeasurementDetailBloc>().add(
                        MeasurementDetailBookBlocEvent(
                          tenantId: widget.tenantId!,
                          contractNumber: widget.contractNumber,
                          measurementNumber: widget.mbNumber,
                          screenType: widget.type,
                        ),
                      );
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).popUntil(
                    (route) => route is! PopupRoute,
                  );
                } else if ((value.measurement!.wfStatus == "SUBMITTED") &&
                    widget.type == MBScreen.create) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).popUntil(
                    (route) => route is! PopupRoute,
                  );
                  context.router.popUntilRouteWithPath('home');
                } else if ((value.measurement!.wfStatus == "DRAFTED") &&
                    widget.type == MBScreen.create) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).popUntil(
                    (route) => route is! PopupRoute,
                  );
                }

                Notifiers.getToastMessage(
                    context,
                    t.translate(
                        "WF_UPDATE_SUCCESS_MB_${value.measurement?.workflow?.action}"),
                    'SUCCESS');
              },
              error: (value) {
                Notifiers.getToastMessage(
                    context, value.error.toString(), 'ERROR');
              },
            );
          },
        ),
        BlocListener<MusterGetWorkflowBloc, MusterGetWorkflowState>(
          listener: (context, state) {
            state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              loaded: (mbWorkFlow) {
                final g = mbWorkFlow.musterWorkFlowModel?.processInstances;
                if (g != null &&
                    g.first.nextActions != null &&
                    g.first.nextActions!.isNotEmpty) {
                  final data = g.first.nextActions!.first.roles?.join(',');

                  context.read<EmpHRMSBloc>().add(
                        EmpHRMSLoadBlocEvent(
                          isActive: true,
                          roles: data ?? "",
                          tenantId: widget.tenantId!,
                        ),
                      );
                }
              },
            );
          },
        ),
      ],
      child: DefaultTabController(
        length: 3,
        child: BlocBuilder<LocalizationBloc, LocalizationState>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar:
                  BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loaded: (value) {
                      double sorprice = 0.00;

                      for (int i = 0; i < value.sor!.length; i++) {
                        final key = value.sor![i];
                        List<FilteredMeasurementsEstimate> line =
                            value.sor![i].filteredMeasurementsMeasure.map(
                          (e) {
                            return e.contracts!.first.estimates!.first;
                          },
                        ).toList();
                        int consumed = value.sor![i].filteredMeasurementsMeasure
                            .fold(0, (sum, obj) {
                          double m = obj!.currentValue!;
                          return sum + m.toInt();
                        });
                        sorprice += (line.first.unitRate! * consumed);
                      }
                      if (widget.type == MBScreen.update) {
                        return BlocBuilder<MusterGetWorkflowBloc,
                            MusterGetWorkflowState>(
                          builder: (context, state) {
                            return state.maybeMap(
                              orElse: () => const SizedBox.shrink(),
                              loaded: (mbWorkFlow) {
                                final g = mbWorkFlow
                                    .musterWorkFlowModel?.processInstances;

                                return Draggable(
                                  childWhenDragging: FloatActionCard(
                                    actions: () {
                                      DigitActionDialog.show(
                                        context,
                                        widget: CommonButtonCard(
                                          g: g,
                                          contractNumber: widget.contractNumber,
                                          mbNumber: widget.mbNumber,
                                          type: widget.type,
                                        ),
                                      );
                                    },
                                    // amount: sorprice.toString(),
                                    amount: value.data.first.totalAmount != null
                                        ? value.data.first.totalAmount!
                                            .roundToDouble()
                                            .toStringAsFixed(2)
                                        : "0.00",
                                    openButtonSheet: () {
                                      _openBottomSheet(
                                          t,
                                          context,
                                          value.data.first.totalSorAmount!,
                                          value.data.first.totalNorSorAmount!,
                                          value.data.first.totalAmount!,
                                          g,
                                          widget.contractNumber,
                                          widget.mbNumber,
                                          widget.type,
                                          null,
                                          (g != null &&
                                                  (g.first.nextActions !=
                                                          null &&
                                                      g.first.nextActions!
                                                          .isEmpty))
                                              ? false
                                              : true,
                                          workorderStatus,
                                          estimateStatus,
                                          (value.data.length >= 2
                                              ? (value.data[1].wfStatus ==
                                                      "APPROVED" ||
                                                  value.data[1].wfStatus ==
                                                      "REJECTED")
                                              : false));
                                    },
                                    totalAmountText: t.translate(
                                        i18.measurementBook.totalMbAmount),
                                    subtext: t.translate(
                                        i18.measurementBook.forCurrentEntry),
                                    showAction: (g != null &&
                                            (g.first.nextActions != null &&
                                                g.first.nextActions!.isEmpty))
                                        ? false
                                        : true,
                                  ),
                                  onDragEnd: (details) {
                                    _openBottomSheet(
                                        t,
                                        context,
                                        value.data.first.totalSorAmount!,
                                        value.data.first.totalNorSorAmount!,
                                        value.data.first.totalAmount!,
                                        g,
                                        widget.contractNumber,
                                        widget.mbNumber,
                                        widget.type,
                                        null,
                                        (g != null &&
                                                (g.first.nextActions != null &&
                                                    g.first.nextActions!
                                                        .isEmpty))
                                            ? false
                                            : true,
                                        workorderStatus,
                                        estimateStatus,
                                        (value.data.length >= 2
                                            ? (value.data[1].wfStatus ==
                                                    "APPROVED" ||
                                                value.data[1].wfStatus ==
                                                    "REJECTED")
                                            : false));
                                  },
                                  feedback: const SizedBox.shrink(),
                                  // feedback: FloatActionCard(
                                  //   actions: () {
                                  //     DigitActionDialog.show(
                                  //       context,
                                  //       widget: CommonButtonCard(
                                  //         g: g,
                                  //         contractNumber: widget.contractNumber,
                                  //         mbNumber: widget.mbNumber,
                                  //         type: widget.type,
                                  //       ),
                                  //     );
                                  //   },
                                  //   // amount: sorprice.toString(),
                                  //   amount: value.data.first.totalAmount != null
                                  //       ? value.data.first.totalAmount!
                                  //           .roundToDouble()
                                  //           .toStringAsFixed(2)
                                  //       : "0.00",
                                  //   openButtonSheet: () {
                                  //     _openBottomSheet(
                                  //         t,
                                  //         context,
                                  //         value.data.first.totalSorAmount!,
                                  //         value.data.first.totalNorSorAmount!,
                                  //         value.data.first.totalAmount!,
                                  //         g,
                                  //         widget.contractNumber,
                                  //         widget.mbNumber,
                                  //         widget.type,
                                  //         null,
                                  //         (g != null &&
                                  //                 (g.first.nextActions !=
                                  //                         null &&
                                  //                     g.first.nextActions!
                                  //                         .isEmpty))
                                  //             ? false
                                  //             : true,
                                  //         workorderStatus,
                                  //         estimateStatus,
                                  //         (value.data.length >= 2
                                  //             ? (value.data[1].wfStatus ==
                                  //                     "APPROVED" ||
                                  //                 value.data[1].wfStatus ==
                                  //                     "REJECTED")
                                  //             : false));
                                  //   },
                                  //   totalAmountText: t.translate(
                                  //       i18.measurementBook.totalMbAmount),
                                  //   subtext: t.translate(
                                  //       i18.measurementBook.forCurrentEntry),
                                  //   showAction: (g != null &&
                                  //           (g.first.nextActions != null &&
                                  //               g.first.nextActions!.isEmpty))
                                  //       ? false
                                  //       : true,
                                  // ),
                                  child: FloatActionCard(
                                    actions: () {
                                      DigitActionDialog.show(
                                        context,
                                        widget: CommonButtonCard(
                                          g: g,
                                          contractNumber: widget.contractNumber,
                                          mbNumber: widget.mbNumber,
                                          type: widget.type,
                                        ),
                                      );
                                    },
                                    // amount: sorprice.toString(),
                                    amount: value.data.first.totalAmount != null
                                        ? value.data.first.totalAmount!
                                            .roundToDouble()
                                            .toStringAsFixed(2)
                                        : "0.00",
                                    openButtonSheet: () {
                                      _openBottomSheet(
                                          t,
                                          context,
                                          value.data.first.totalSorAmount!,
                                          value.data.first.totalNorSorAmount!,
                                          value.data.first.totalAmount!,
                                          g,
                                          widget.contractNumber,
                                          widget.mbNumber,
                                          widget.type,
                                          null,
                                          (g != null &&
                                                  (g.first.nextActions !=
                                                          null &&
                                                      g.first.nextActions!
                                                          .isEmpty))
                                              ? false
                                              : true,
                                          workorderStatus,
                                          estimateStatus,
                                          (value.data.length >= 2
                                              ? (value.data[1].wfStatus ==
                                                      "APPROVED" ||
                                                  value.data[1].wfStatus ==
                                                      "REJECTED")
                                              : false));
                                    },
                                    totalAmountText: t.translate(
                                        i18.measurementBook.totalMbAmount),
                                    subtext: t.translate(
                                        i18.measurementBook.forCurrentEntry),
                                    showAction: (g != null &&
                                            (g.first.nextActions != null &&
                                                g.first.nextActions!.isEmpty))
                                        ? false
                                        : true,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else {
                        return BlocBuilder<BusinessWorkflowBloc,
                            BusinessGetWorkflowState>(
                          builder: (context, state) {
                            return state.maybeMap(
                              orElse: () => const SizedBox.shrink(),
                              loaded: (business) {
                                const g = null;
                                final bk = business.businessWorkFlowModel!
                                        .businessServices ??
                                    [];

                                return Draggable(
                                  childWhenDragging: FloatActionCard(
                                    actions: () {
                                      DigitActionDialog.show(
                                        context,
                                        widget: CommonButtonCard(
                                          g: g,
                                          contractNumber: widget.contractNumber,
                                          mbNumber: widget.mbNumber,
                                          type: widget.type,
                                          bs: bk,
                                        ),
                                      );
                                    },
                                    amount: value.data.first.totalAmount != null
                                        ? value.data.first.totalAmount!
                                            .roundToDouble()
                                            .toStringAsFixed(2)
                                        : "0.00",
                                    openButtonSheet: () {
                                      _openBottomSheet(
                                          t,
                                          context,
                                          value.data.first.totalSorAmount!,
                                          value.data.first.totalNorSorAmount!,
                                          value.data.first.totalAmount!,
                                          g,
                                          widget.contractNumber,
                                          widget.mbNumber,
                                          widget.type,
                                          bk,
                                          (bk != null &&
                                                  (bk != null && bk.isEmpty))
                                              ? false
                                              : true,
                                          workorderStatus,
                                          estimateStatus,
                                          (value.data.length >= 2
                                              ? (value.data[1].wfStatus ==
                                                      "APPROVED" ||
                                                  value.data[1].wfStatus ==
                                                      "REJECTED")
                                              : true));
                                    },
                                    totalAmountText: t.translate(
                                        i18.measurementBook.totalMbAmount),
                                    subtext: t.translate(
                                        i18.measurementBook.forCurrentEntry),
                                    showAction: (bk != null &&
                                            (bk != null && bk.isEmpty))
                                        ? false
                                        : true,
                                  ),
                                  onDragEnd: (details) {
                                    _openBottomSheet(
                                        t,
                                        context,
                                        value.data.first.totalSorAmount!,
                                        value.data.first.totalNorSorAmount!,
                                        value.data.first.totalAmount!,
                                        g,
                                        widget.contractNumber,
                                        widget.mbNumber,
                                        widget.type,
                                        bk,
                                        (bk != null &&
                                                (bk != null && bk.isEmpty))
                                            ? false
                                            : true,
                                        workorderStatus,
                                        estimateStatus,
                                        (value.data.length >= 2
                                            ? (value.data[1].wfStatus ==
                                                    "APPROVED" ||
                                                value.data[1].wfStatus ==
                                                    "REJECTED")
                                            : true));
                                  },
                                  feedback: const SizedBox.shrink(),
                                  child: FloatActionCard(
                                    actions: () {
                                      DigitActionDialog.show(
                                        context,
                                        widget: CommonButtonCard(
                                          g: g,
                                          contractNumber: widget.contractNumber,
                                          mbNumber: widget.mbNumber,
                                          type: widget.type,
                                          bs: bk,
                                        ),
                                      );
                                    },
                                    amount: value.data.first.totalAmount != null
                                        ? value.data.first.totalAmount!
                                            .roundToDouble()
                                            .toStringAsFixed(2)
                                        : "0.00",
                                    openButtonSheet: () {
                                      _openBottomSheet(
                                          t,
                                          context,
                                          value.data.first.totalSorAmount!,
                                          value.data.first.totalNorSorAmount!,
                                          value.data.first.totalAmount!,
                                          g,
                                          widget.contractNumber,
                                          widget.mbNumber,
                                          widget.type,
                                          bk,
                                          (bk != null &&
                                                  (bk != null && bk.isEmpty))
                                              ? false
                                              : true,
                                          workorderStatus,
                                          estimateStatus,
                                          (value.data.length >= 2
                                              ? (value.data[1].wfStatus ==
                                                      "APPROVED" ||
                                                  value.data[1].wfStatus ==
                                                      "REJECTED")
                                              : true));
                                    },
                                    totalAmountText: t.translate(
                                        i18.measurementBook.totalMbAmount),
                                    subtext: t.translate(
                                        i18.measurementBook.forCurrentEntry),
                                    showAction: (bk != null &&
                                            (bk != null && bk.isEmpty))
                                        ? false
                                        : true,
                                  ),
                                );
                              },
                            );
                          },
                        );
                      }
                    },
                    loading: (value) {
                      return const SizedBox.shrink();
                    },
                  );
                },
              ),
              backgroundColor: const DigitColors().seaShellGray,
              appBar: AppBar(
                titleSpacing: 0,
                title: const AppBarLogo(),
              ),
              drawer: DrawerWrapper(
                Drawer(
                  child: SideBar(
                    module: CommonMethods.getLocaleModules(),
                  ),
                ),
              ),
              body: BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
                builder: (context, state) {
                  return state.maybeMap(
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                    loaded: (value) {
                      final dynamic mm;
                      if (widget.type == MBScreen.create) {
                        mm = null;
                      } else {
                        mm = value.data.first.documents
                            ?.map((d) => FileStoreModel(
                                  name: d.documentAdditionalDetails?.fileName,
                                  fileStoreId: d.fileStore,
                                  id: d.id,
                                  tenantId:
                                      d.documentAdditionalDetails?.tenantId,
                                ))
                            .toList();
                      }
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Back(
                              callback: () {
                                context.router.popUntilRouteWithPath(
                                    widget.type == MBScreen.update
                                        ? 'measurement-inbox'
                                        : 'workOrder-inbox');
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                t.translate(
                                    i18.measurementBook.measurementBookTitle),
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineLarge,
                              ),
                            ),
                            DigitCard(
                              // margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              child: ExpansionTile(
                                expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                expandedAlignment: Alignment.topLeft,
                                title: Text(
                                  t.translate(
                                      i18.measurementBook.primaryDetails),
                                  style: DigitTheme.instance.mobileTheme
                                      .textTheme.headlineMedium,
                                ),
                                children: [
                                  CommonMBCard(
                                    items: primaryItems(
                                        t, value.data, widget.type),
                                    widget: value.data.length > 1
                                        ? CommonTextButtonUnderline(
                                            label: t.translate(i18
                                                .measurementBook.mbShowHistory),
                                            onPressed: () {
                                              context.router.push(
                                                MBHistoryBookRoute(
                                                  contractNumber:
                                                      widget.contractNumber,
                                                  mbNumber: widget.mbNumber,
                                                  tenantId: widget.tenantId,
                                                  type: widget.type,
                                                ),
                                              );
                                            },
                                          )
                                        : const SizedBox.shrink(),
                                    show: false,
                                    sla: 1,
                                  ),
                                ],
                              ),
                            ),

                            // tab

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                // padding: EdgeInsets.zero,
                                // controller: _tabController,
                                children: [
                                  Expanded(
                                    child: CustomTab(
                                      text: t
                                          .translate(i18.measurementBook.mbSor),
                                      isSelected: _selectedIndex == 0,
                                      onTap: () {
                                        _tabController.animateTo(0);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTab(
                                      text: t.translate(
                                          i18.measurementBook.mbNonSor),
                                      isSelected: _selectedIndex == 1,
                                      onTap: () {
                                        _tabController.animateTo(1);
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: CustomTab(
                                      text: t.translate(
                                          i18.measurementBook.mbWorksitePhotos),
                                      isSelected: _selectedIndex == 2,
                                      onTap: () {
                                        _tabController.animateTo(2);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: tabViewHeight(
                                value.sor!.length,
                                value.nonSor!.length,
                                widget.type == MBScreen.create ||
                                        value.data.first.wfStatus == "DRAFTED"
                                    ? 0
                                    : value.data.first.documents != null &&
                                            value.data.first.documents!.isEmpty
                                        ? 0
                                        : !value.viewStatus
                                            ? 0
                                            : value
                                                .data.first.documents!.length,
                              ),
                              child: TabBarView(
                                controller: _tabController,
                                children: [
                                  value.sor!.isEmpty
                                      ? Card(
                                          child: Center(
                                              child: EmptyImage(
                                            align: Alignment.center,
                                            label: t
                                                .translate(i18.common.notFound),
                                          )),
                                        )
                                      : ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return sorCard(
                                              t,
                                              context,
                                              index,
                                              magic: value.sor![index]
                                                  .filteredMeasurementsMeasure,

                                              preSorNonSor: value.preSor == null
                                                  ? null
                                                  : value.preSor!.firstWhereOrNull(
                                                              (element) =>
                                                                  element
                                                                      .sorId ==
                                                                  value
                                                                      .sor![
                                                                          index]
                                                                      .sorId) ==
                                                          null
                                                      ? null
                                                      : value.preSor!
                                                          .firstWhereOrNull(
                                                              (element) =>
                                                                  element
                                                                      .sorId ==
                                                                  value
                                                                      .sor![
                                                                          index]
                                                                      .sorId)!
                                                          .filteredMeasurementsMeasure,
                                              // value.preSor![index]
                                              //     .filteredMeasurementsMeasure,
                                              type: "sor",
                                              sorNonSorId:
                                                  value.sor![index].sorId!,
                                              cardLevel: t.translate(
                                                  i18.measurementBook.mbSor),
                                            );
                                          },
                                          itemCount: value.sor!.length,
                                        ),
                                  value.nonSor!.isEmpty
                                      ? Card(
                                          child: Center(
                                            child: EmptyImage(
                                              align: Alignment.center,
                                              label: t.translate(
                                                  i18.common.notFound),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return sorCard(
                                              t,
                                              context,
                                              index,
                                              magic: value.nonSor![index]
                                                  .filteredMeasurementsMeasure,
                                              preSorNonSor: value.preNonSor ==
                                                      null
                                                  ? null
                                                  : value.preNonSor!.firstWhereOrNull(
                                                              (element) =>
                                                                  element
                                                                      .sorId ==
                                                                  value
                                                                      .nonSor![
                                                                          index]
                                                                      .sorId) !=
                                                          null
                                                      ? value.preNonSor!
                                                          .firstWhereOrNull(
                                                              (element) =>
                                                                  element
                                                                      .sorId ==
                                                                  value
                                                                      .nonSor![
                                                                          index]
                                                                      .sorId)!
                                                          .filteredMeasurementsMeasure
                                                      : null,
                                              type: "NonSor",
                                              sorNonSorId:
                                                  value.nonSor![index].sorId!,
                                              cardLevel: t.translate(
                                                  i18.measurementBook.mbNonSor),
                                            );
                                          },
                                          itemCount: value.nonSor!.length,
                                        ),
                                  widget.type == MBScreen.create
                                      ? Card(
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8.0),
                                                  child: FilePickerDemo(
                                                    fromServerFile: value
                                                        .data.first.documents,
                                                    callBack: (List<
                                                                FileStoreModel>?
                                                            g,
                                                        List<WorkflowDocument>?
                                                            l) {
                                                      context
                                                          .read<
                                                              MeasurementDetailBloc>()
                                                          .add(
                                                            MeasurementUploadDocumentBlocEvent(
                                                              tenantId: '',
                                                              workflowDocument:
                                                                  l!,
                                                            ),
                                                          );
                                                    },
                                                    extensions: const [
                                                      'jpg',
                                                      'png',
                                                      'jpeg',
                                                    ],
                                                    moduleName:
                                                        'img_measurement_book',
                                                    headerType:
                                                        MediaType.mbDetail,
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  //  color: DigitColors().curiousBlue,
                                                  child: Text(t.translate(i18
                                                      .measurementBook
                                                      .mbPhotoInfo)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : value.data.first.documents != null &&
                                              value
                                                  .data.first.documents!.isEmpty
                                          ? !value.viewStatus
                                              ? Card(
                                                  child: Center(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: FilePickerDemo(
                                                            fromServerFile:
                                                                value.data.first
                                                                    .documents,
                                                            callBack: (List<
                                                                        FileStoreModel>?
                                                                    g,
                                                                List<WorkflowDocument>?
                                                                    l) {
                                                              context
                                                                  .read<
                                                                      MeasurementDetailBloc>()
                                                                  .add(
                                                                    MeasurementUploadDocumentBlocEvent(
                                                                      tenantId:
                                                                          '',
                                                                      workflowDocument:
                                                                          l!,
                                                                    ),
                                                                  );
                                                            },
                                                            extensions: const [
                                                              'jpg',
                                                              'png',
                                                              'jpeg',
                                                            ],
                                                            moduleName:
                                                                'img_measurement_book',
                                                            headerType:
                                                                MediaType
                                                                    .mbDetail,
                                                          ),
                                                        ),
                                                        // TODO:[text change]
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: Text(
                                                              t.translate(i18
                                                                  .measurementBook
                                                                  .mbPhotoInfo)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Card(
                                                  child: Center(
                                                  child: EmptyImage(
                                                    align: Alignment.center,
                                                    label: t.translate(i18
                                                        .measurementBook
                                                        .noDocumentFound),
                                                  ),
                                                ))
                                          : !value.viewStatus
                                              ? Card(
                                                  child: Center(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          child: FilePickerDemo(
                                                            fromServerFile:
                                                                value.data.first
                                                                    .documents,
                                                            callBack: (List<
                                                                        FileStoreModel>?
                                                                    g,
                                                                List<WorkflowDocument>?
                                                                    l) {
                                                              context
                                                                  .read<
                                                                      MeasurementDetailBloc>()
                                                                  .add(
                                                                    MeasurementUploadDocumentBlocEvent(
                                                                      tenantId:
                                                                          '',
                                                                      workflowDocument:
                                                                          l!,
                                                                    ),
                                                                  );
                                                            },
                                                            extensions: const [
                                                              'jpg',
                                                              'png',
                                                              'jpeg',
                                                            ],
                                                            moduleName:
                                                                'img_measurement_book',
                                                            headerType:
                                                                MediaType
                                                                    .mbDetail,
                                                          ),
                                                        ),
                                                        // TODO:[text change]
                                                        Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          //  color: DigitColors().curiousBlue,
                                                          child: Text(
                                                              t.translate(i18
                                                                  .measurementBook
                                                                  .mbPhotoInfo)),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : DigitCard(
                                                  child: ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        if (index == 0) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        8.0),
                                                            child: Column(
                                                              children: [
                                                                DigitInfoCard(
                                                                  title: t.translate(
                                                                      i18.common
                                                                          .info),
                                                                  description: t
                                                                      .translate(i18
                                                                          .measurementBook
                                                                          .infoImageTip),
                                                                ),
                                                                InkWell(
                                                                  onTap: () =>
                                                                      CommonMethods()
                                                                          .onTapOfAttachment(
                                                                    mm![index],
                                                                    mm![index]
                                                                        .tenantId!,
                                                                    context,
                                                                    roleType:
                                                                        RoleType
                                                                            .employee,
                                                                  ),
                                                                  child: Chip(
                                                                    labelPadding:
                                                                        const EdgeInsets.all(
                                                                            10),
                                                                    // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                                                    label:
                                                                        SizedBox(
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      child:
                                                                          Text(
                                                                        AppLocalizations.of(context)
                                                                            .translate(
                                                                          mm![index]
                                                                              .name
                                                                              .toString(),
                                                                        ),
                                                                        maxLines:
                                                                            3,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        } else {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom:
                                                                        8.0),
                                                            child: InkWell(
                                                              onTap: () =>
                                                                  CommonMethods()
                                                                      .onTapOfAttachment(
                                                                mm![index],
                                                                mm![index]
                                                                    .tenantId!,
                                                                context,
                                                                roleType: RoleType
                                                                    .employee,
                                                              ),
                                                              child: Chip(
                                                                labelPadding:
                                                                    const EdgeInsets
                                                                        .all(10),
                                                                // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                                                label: SizedBox(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  child: Text(
                                                                    AppLocalizations.of(
                                                                            context)
                                                                        .translate(
                                                                      mm![index]
                                                                          .name
                                                                          .toString(),
                                                                    ),
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      },
                                                      itemCount: value
                                                          .data
                                                          .first
                                                          .documents!
                                                          .length),
                                                ),
                                ],
                              ),
                            ),
                            widget.type == MBScreen.update
                                ?
                                //workflow
                                BlocBuilder<MusterGetWorkflowBloc,
                                    MusterGetWorkflowState>(
                                    builder: (context, state) {
                                      return state.maybeMap(
                                        orElse: SizedBox.shrink,
                                        loaded: (value) {
                                          List<ProcessInstances> modifiedData =
                                              value.musterWorkFlowModel!
                                                  .processInstances!
                                                  .where((element) =>
                                                      element.action !=
                                                      Constants.saveAsDraft)
                                                  .toList();
                                          // ..insert(0, value
                                          // .musterWorkFlowModel!
                                          // .processInstances!.first);
                                          if (modifiedData.isNotEmpty &&
                                              (modifiedData.first.nextActions !=
                                                      null &&
                                                  modifiedData
                                                      .first
                                                      .nextActions!
                                                      .isNotEmpty)) {
                                            modifiedData = [
                                              ...[modifiedData.first],
                                              ...modifiedData
                                            ];
                                          } else if (modifiedData.isNotEmpty) {
                                            modifiedData = [
                                              ...[modifiedData.first],
                                              ...modifiedData
                                            ];
                                          }
                                          timeLineAttributes.clear();

                                          timeLineAttributes = modifiedData
                                              .mapIndexed((i, e) =>
                                                  DigitTimelineOptions(
                                                    title: t.translate((i ==
                                                                0 &&
                                                            e.action ==
                                                                "APPROVE")
                                                        ? e.workflowState
                                                                    ?.state ==
                                                                "EDIT_RE_SUBMIT"
                                                            ? 'WF_MB_STATUS_${e.workflowState?.state}'
                                                            : 'WF_MB_STATUS_${e.workflowState?.state}'
                                                        : i == 0
                                                            ? e.workflowState
                                                                        ?.state ==
                                                                    "EDIT_RE_SUBMIT"
                                                                ? 'WF_MB_STATUS_${e.workflowState?.state}'
                                                                : 'WF_MB_STATUS_${e.workflowState?.state}'
                                                            : 'WF_MB_STATUS_${e.action}'),
                                                    subTitle: (i == 0 &&
                                                            e.action ==
                                                                "APPROVE")
                                                        ? DateFormats
                                                            .getTimeLineDate(e
                                                                    .auditDetails
                                                                    ?.lastModifiedTime ??
                                                                0)
                                                        : i != 0
                                                            ? DateFormats
                                                                .getTimeLineDate(e
                                                                        .auditDetails
                                                                        ?.lastModifiedTime ??
                                                                    0)
                                                            : null,
                                                    isCurrentState: i == 0,
                                                    comments: (i == 0 &&
                                                            e.action ==
                                                                "APPROVE")
                                                        ? e.comment
                                                        : i != 0
                                                            ? e.comment
                                                            : null,
                                                    documents: (i == 0 &&
                                                            e.action ==
                                                                "APPROVE")
                                                        ? e.documents != null
                                                            ? e.documents
                                                                ?.map((d) =>
                                                                    FileStoreModel(
                                                                        name:
                                                                            '',
                                                                        fileStoreId: d
                                                                            .documentUid))
                                                                .toList()
                                                            : null
                                                        : i != 0
                                                            ? e.documents !=
                                                                    null
                                                                ? e
                                                                    .documents
                                                                    ?.map((d) => FileStoreModel(
                                                                        name:
                                                                            '',
                                                                        fileStoreId:
                                                                            d.documentUid))
                                                                    .toList()
                                                                : null
                                                            : null,
                                                    assignee: (i == 0 &&
                                                            e.action ==
                                                                "APPROVE")
                                                        ? e.assigner?.name
                                                        : i != 0
                                                            ? e.assigner?.name
                                                            : null,
                                                    mobileNumber: (i == 0 &&
                                                            e.action ==
                                                                "APPROVE")
                                                        ? e.assigner != null
                                                            ? '+91-${e.assigner?.mobileNumber}'
                                                            : null
                                                        : i != 0
                                                            ? e.assigner != null
                                                                ? '+91-${e.assigner?.mobileNumber}'
                                                                : null
                                                            : null,
                                                  ))
                                              .toList();

                                          return timeLineAttributes.isNotEmpty
                                              ? DigitCard(
                                                  child: ExpansionTile(
                                                    title: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8.0),
                                                      child: Text(
                                                        t.translate(i18.common
                                                            .workflowTimeline),
                                                        style: DigitTheme
                                                            .instance
                                                            .mobileTheme
                                                            .textTheme
                                                            .headlineMedium,
                                                      ),
                                                    ),
                                                    children: [
                                                      DigitTimeline(
                                                        timelineOptions:
                                                            timeLineAttributes,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              : const SizedBox.shrink();
                                          //
                                        },
                                      );
                                    },
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      );
                    },
                    loading: (value) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  Map<String, dynamic> primaryItems(
      AppLocalizations t, List<FilteredMeasurements> s, MBScreen mbScreen) {
    if (mbScreen == MBScreen.create) {
      return {
        t.translate(i18.common.musterRollId): s.first.musterRollNumber ?? "NA",

        t.translate(i18.measurementBook.measurementPeriod):
            "${s.first.startDate != null ? DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(s.first.startDate!)) : "NA"} - ${s.first.endDate != null ? DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(s.first.endDate!)) : "NA"}",
        t.translate(i18.attendanceMgmt.projectDesc): s.first.measures!.first
                .contracts!.first.contractAdditionalDetails?.projectDesc ??
            "NA",

        // "SLA Days remaining": 2,
      };
    } else {
      return {
        t.translate(i18.measurementBook.mbNumber): s.first.mbNumber ?? "NA",
        t.translate(i18.common.musterRollId): s.first.musterRollNumber ?? "NA",

        t.translate(i18.measurementBook.measurementPeriod):
            "${s.first.startDate != null ? DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(s.first.startDate!)) : "NA"} - ${s.first.endDate != null ? DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(s.first.endDate!)) : "NA"}",
        t.translate(i18.attendanceMgmt.projectDesc): s.first.measures!.first
                .contracts!.first.contractAdditionalDetails?.projectDesc ??
            "NA",

        // "SLA Days remaining": 2,
      };
    }
  }

  double tabViewHeight(int sork, int nonSork, int photo) {
    switch (_tabController.index) {
      case 0:
        return sork == 0 ? 300 : sork * 500;
      case 1:
        return nonSork == 0 ? 300 : nonSork * 500;
      case 2:
        return photoSize(photo);
      default:
        return 350.0;
    }
  }

  double photoSize(int photok) {
    switch (photok) {
      case 1:
        return (photok * 115) + 112;
      case 2:
        return (photok * 100) + 88;
      case 3:
        return (photok * 100) + 80;
      case 4:
        return (photok * 90) + 80;
      case 5:
        return (photok * 80) + 80;

      default:
        return 350;
    }
  }

  Card sorCard(
    AppLocalizations t,
    BuildContext ctx,
    int index, {
    List<FilteredMeasurementsMeasure>? magic,
    List<FilteredMeasurementsMeasure>? preSorNonSor,
    required String type,
    required String sorNonSorId,
    required String cardLevel,
  }) {
    List<FilteredMeasurementsEstimate> line = magic!.map(
      (e) {
        return e.contracts!.first.estimates!.first;
      },
    ).toList();
    String noOfQty = line.fold("0.0000", (sum, obj) {
      double m = double.parse(obj.noOfunit!.toString()).toDouble();
      return double.parse((double.parse(sum) + m.toDouble()).toString())
          .toStringAsFixed(4);
    });

    final String preConumed = preSorNonSor == null
        ? "0.0000"
        : preSorNonSor!.fold("0.0000", (sum, obj) {
            double m = obj.contracts!.first.estimates!.first.isDeduction == true
                ? -(obj.cumulativeValue!)
                : (obj.cumulativeValue!);
            return double.parse((double.parse(sum) + m.toDouble()).toString())
                .toStringAsFixed(4);
          });

    return Card(
      child: SizedBox(
        height: 480,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  "$cardLevel ${index + 1}",
                  style:
                      DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
                ),
              ),
              SORTableCard(
                element: {
                  t.translate(i18.measurementBook.description):
                      magic.first.contracts!.first.estimates!.first.name,
                  t.translate(i18.measurementBook.unit): line[0].uom,
                  t.translate(i18.measurementBook.rate):
                      line[0].unitRate == null
                          ? 0.00
                          : double.parse(line[0].unitRate!.toString())
                              .toStringAsFixed(2),
                  t.translate(i18.measurementBook.approvedQty): noOfQty,

                  //TODO:[localization]
                  "${t.translate(i18.measurementBook.preConsumedKey)}\n${t.translate(i18.measurementBook.preConsumedPre)}":
                      //  t.translate(i18.measurementBook.consumedQty):
                      preSorNonSor == null ? "0.0000" : preConumed
                },
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(t.translate(i18.measurementBook.currentMBEntry),
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const DigitColors().cloudGray,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Text(
                            (magic.fold(0.0, (sum, obj) {
                              double m;
                              if (obj.contracts?.first.estimates?.first
                                      .isDeduction ==
                                  false) {
                                m = obj.measureLineItems!.fold(0.0,
                                    (subSum, ob) {
                                  double mk =
                                      double.parse(ob.quantity!.toString());
                                  return subSum + mk;
                                });
                              } else {
                                m = obj.measureLineItems!.fold(0.0,
                                    (subSum, ob) {
                                  double mr =
                                      double.parse(ob.quantity!.toString());
                                  return subSum + mr;
                                });
                                m = -m;
                              }
                              return sum + m;
                            })).toStringAsFixed(4),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 3,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: ctx,
                              builder: (_) {
                                return HorizontalCardListDialog(
                                  lineItems: magic,
                                  index: index,
                                  type: type,
                                  // noOfUnit: line[0].noOfunit,
                                  noOfUnit: noOfQty,
                                  cummulativePrevQty: preSorNonSor == null
                                      ? 0.0000
                                      // : preSorNonSor!.first.cumulativeValue,
                                      : preSorNonSor!.fold(0.0000, (sum, obj) {
                                          double m = obj
                                                      .contracts!
                                                      .first
                                                      .estimates!
                                                      .first
                                                      .isDeduction ==
                                                  true
                                              ? -(obj.cumulativeValue!)
                                              : (obj.cumulativeValue!);
                                          return sum + m.toDouble();
                                        }),
                                  sorId: sorNonSorId,
                                );
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Icon(
                              Icons.add_circle,
                              size: 30,
                              color: const DigitColors().burningOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // end
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                    child: Text(
                      t.translate(i18.measurementBook.mbAmtCurrentEntry),
                      style: Theme.of(context).textTheme.headlineSmall,
                      textScaleFactor: 0.99,
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 5.0, right: 5.0, bottom: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const DigitColors().cloudGray,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        (magic.fold(0.0, (sum, obj) {
                          double m = obj.mbAmount != null
                              ? (obj.mbAmount != null && obj.mbAmount! < 0)
                                  ? (obj.mbAmount! * (-1))
                                  : obj.mbAmount!
                              : 0.00;
                          if (obj.contracts?.first.estimates?.first
                                  .isDeduction ==
                              true) {
                            m = -(m); // Negate the amount for deductions
                          } else {
                            m = (m);
                          }
                          return sum + m;
                        })).toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ),
                ],
              ),

              //

              // DigitTextField(
              //   controller: TextEditingController()
              //     ..value
              //     ..text = (magic.fold(0.0, (sum, obj) {
              //       double m = obj.mbAmount != null
              //           ? (obj.mbAmount != null && obj.mbAmount! < 0)
              //               ? (obj.mbAmount! * (-1))
              //               : obj.mbAmount!
              //           : 0.00;
              //       if (obj.contracts?.first.estimates?.first.isDeduction ==
              //           true) {
              //         m = -(m); // Negate the amount for deductions
              //       } else {
              //         m = (m);
              //       }
              //       return sum + m;
              //     })).toStringAsFixed(2),
              //   label: t.translate(i18.measurementBook.mbAmtCurrentEntry),
              //   isDisabled: true,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBottomSheet(
    AppLocalizations t,
    BuildContext context,
    double totalSorAmount,
    double totalNonSorAmount,
    double mbAmount,
    List<ProcessInstances>? processInstances,
    String contractNumber,
    String mbNumber,
    MBScreen type,
    List<BusinessServices>? bs,
    bool showBtn,
    String workorderStatus,
    String estimateStatus,
    bool previousMBStatus,
  ) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 5,
                  ),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      // "Total SOR Amount",
                      t.translate(i18.measurementBook.totalSorAmount),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      // "(for current entry)",
                      t.translate(i18.measurementBook.forCurrentEntry),
                      style:
                          DigitTheme.instance.mobileTheme.textTheme.bodySmall,
                    ),
                    trailing: Text(
                      totalSorAmount!.toDouble().toStringAsFixed(2),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ListTile(
                    title: Text(
                      // "Total Non SOR Amount",
                      t.translate(i18.measurementBook.totalNonSorAmount),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      // "(for current entry)",
                      t.translate(i18.measurementBook.forCurrentEntry),
                      style:
                          DigitTheme.instance.mobileTheme.textTheme.bodySmall,
                    ),
                    trailing: Text(
                      totalNonSorAmount!.toDouble().toStringAsFixed(2),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 80,
                width: MediaQuery.sizeOf(context).width,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  border: Border.all(
                    color: Colors.grey,
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ListTile(
                          title: Text(
                            // "Total MB Amount",
                            t.translate(i18.measurementBook.totalMbAmount),
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            // "(for current entry)",
                            t.translate(i18.measurementBook.forCurrentEntry),
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mbAmount!.roundToDouble().toStringAsFixed(2),
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineMedium,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              showBtn
                  ? DigitElevatedButton(
                      child: Text(t.translate(i18.measurementBook.mbAction)),
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (widget.type == MBScreen.update) {
                          DigitActionDialog.show(
                            context,
                            widget: CommonButtonCard(
                              g: processInstances,
                              contractNumber: contractNumber,
                              mbNumber: mbNumber,
                              type: widget.type,
                              bs: bs,
                            ),
                          );
                        } else {
                          DigitActionDialog.show(
                            context,
                            widget: CommonButtonCard(
                              g: processInstances,
                              contractNumber: contractNumber,
                              mbNumber: mbNumber,
                              type: widget.type,
                              bs: bs,
                            ),
                          );
                        }

                        // before
                      })
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function onTap;

  const CustomTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 50,
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: 1.0,
            ),
            left: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: 1.0,
            ),
            right: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: 1.0,
            ),
            bottom: BorderSide(
              color: isSelected
                  ? const DigitColors().burningOrange
                  : const DigitColors().cloudGray,
              width: isSelected ? 3.0 : 1.0,
            ),
          ),
          borderRadius: BorderRadius.circular(2),
          color: isSelected
              ? const DigitColors().white.withOpacity(0.2)
              : Colors.transparent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              text,
              style: TextStyle(
                color: isSelected
                    ? const DigitColors().black
                    : const DigitColors().cloudGray,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SORTableCard extends StatelessWidget {
  final Map<String, dynamic> element;
  final Border? border;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final double gap;
  final num fraction;

  const SORTableCard({
    super.key,
    required this.element,
    this.border,
    this.color,
    this.padding,
    this.gap = 0,
    this.fraction = 2,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: border),
        child: Padding(
          padding: padding ?? const EdgeInsets.only(right: 8, bottom: 16),
          child: Column(
            children: element.keys
                .map((e) => Container(
                      margin: DigitTheme.instance.verticalMargin,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / fraction,
                            child: Text(
                              e,
                              style: theme.textTheme.headlineSmall,
                              textAlign: TextAlign.start,
                            ),
                          ),
                          SizedBox(width: gap),
                          Flexible(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 1.4),
                            child: Text(
                              element[e].toString(),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
