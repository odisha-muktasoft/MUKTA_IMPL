import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/ComponentTheme/digit_tab_bar_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tab.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/labelled_fields.dart'
    as ui_label;
import 'package:digit_ui_components/widgets/atoms/text_chunk.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart'
    as ui_component;
import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/digit_timeline_molecule.dart';
import 'package:digit_ui_components/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_crud.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/constants.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/widgets/atoms/empty_image.dart';
import 'package:works_shg_app/widgets/mb/custom_side_bar.dart';
import 'package:works_shg_app/widgets/mb/custom_tab.dart';
import 'package:works_shg_app/widgets/new_custom_app_bar.dart';

import '../../blocs/employee/emp_hrms/emp_hrms.dart';
import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/muster_rolls/get_business_workflow.dart';
import '../../blocs/muster_rolls/get_muster_workflow.dart';
import '../../blocs/work_orders/search_individual_work.dart';
import '../../models/employee/mb/filtered_measures.dart';
import '../../models/file_store/file_store_model.dart';
import '../../models/muster_rolls/business_service_workflow.dart';
import '../../utils/common_methods.dart';
import '../../utils/date_formats.dart';
import '../../utils/employee/mb/mb_logic.dart';
import '../../widgets/side_bar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/atoms/digit_timeline.dart';
import '../../widgets/drawer_wrapper.dart';
import '../../widgets/mb/float_action_card.dart';
import '../../widgets/mb/multi_image.dart';
import '../../widgets/mb/work_flow_button_list.dart';
import '../../widgets/mb/sor_item_add_mb.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/widgets/loaders.dart' as shg_loader;

@RoutePage()
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
  //int _selectedIndex = 0;

  int phots = 0;
  List<DigitTimelineOptions> timeLineAttributes = [];

  late TextEditingController consumedQty;
  late TextEditingController currentAmt;

  // check points for creating new MB
//  ACTIVE
  String workorderStatus = "";
  //  INWORKFLOW
  String estimateStatus = "";
  @override
  void initState() {
    consumedQty = TextEditingController();
    currentAmt = TextEditingController();

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
    // _tabController.addListener(_handleTabSelection);
  }

  // void _handleTabSelection() {
  //   setState(() {
  //     _selectedIndex = _tabController.index;
  //   });
  // }

  @override
  void dispose() {
    consumedQty.clear();
    currentAmt.clear();
    consumedQty.dispose();
    currentAmt.dispose();

    _tabController.dispose();
    // _tabController.removeListener(_handleTabSelection);
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
              loaded: (valueLoaded) {
                if (widget.type == MBScreen.update) {
                  context.read<MusterGetWorkflowBloc>().add(
                        FetchMBWorkFlowEvent(
                            tenantId: GlobalVariables.tenantId!,
                            mbNumber: widget.mbNumber),
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
                } else if ((valueLoaded.measurement!.wfStatus == "SUBMITTED") &&
                    widget.type == MBScreen.create) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).popUntil(
                    (route) => route is! PopupRoute,
                  );
                  context.router.popUntilRouteWithPath('home');
                } else if ((valueLoaded.measurement!.wfStatus == "DRAFTED") &&
                    widget.type == MBScreen.create) {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).popUntil(
                    (route) => route is! PopupRoute,
                  );
                }

                Toast.showToast(
                  context,
                  message: t.translate(
                      "WF_UPDATE_SUCCESS_MB_${valueLoaded.measurement?.workflow?.action}"),
                  type: ToastType.success,
                );

                context.read<MeasurementDetailBloc>().add(
                      MeasurementDetailBookBlocEvent(
                        tenantId: widget.tenantId!,
                        contractNumber: widget.contractNumber,
                        measurementNumber:
                            valueLoaded.measurement!.measurementNumber!,
                        screenType: MBScreen.update,
                      ),
                    );
              },
              error: (value) {
                Navigator.of(
                  context,
                  rootNavigator: true,
                ).popUntil(
                  (route) => route is! PopupRoute,
                );
                // Notifiers.getToastMessage(
                //     context, value.error.toString(), 'ERROR');

                Toast.showToast(
                  context,
                  message: value.error.toString(),
                  type: ToastType.error,
                );
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
                                      showDialog(
                                        context: context,
                                        builder: (context) => CommonButtonCard(
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
                                  child: FloatActionCard(
                                    actions: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) =>
                                              CommonButtonCard(
                                                g: g,
                                                contractNumber:
                                                    widget.contractNumber,
                                                mbNumber: widget.mbNumber,
                                                type: widget.type,
                                              ));
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
                                      showDialog(
                                        context: context,
                                        builder: (context) => CommonButtonCard(
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
                                          ((bk != null && bk.isEmpty))
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
                                    showAction: ((bk != null && bk.isEmpty))
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
                                        ((bk != null && bk.isEmpty))
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
                                      showDialog(
                                        context: context,
                                        builder: (context) => CommonButtonCard(
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
                                          ((bk != null && bk.isEmpty))
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
                                    showAction: ((bk != null && bk.isEmpty))
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
              appBar: customAppBar(),
              drawer: const MySideBar(),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 12.0,
                                  bottom: 8.0,
                                  top: 8.0,
                                  right: 8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BackNavigationButton(
                                      backNavigationButtonThemeData:
                                          const BackNavigationButtonThemeData()
                                              .copyWith(
                                        textColor: Theme.of(context)
                                            .colorTheme
                                            .primary
                                            .primary2,
                                        contentPadding: EdgeInsets.zero,
                                        context: context,
                                      ),
                                      backButtonText:
                                          AppLocalizations.of(context)
                                                  .translate(i18.common.back) ??
                                              'Back',
                                      handleBack: () {
                                        context.router.popUntilRouteWithPath(
                                          widget.type == MBScreen.update
                                              ? 'measurement-inbox'
                                              : 'workOrder-inbox',
                                        );
                                      },
                                    ),
                                  ]),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: TextChunk(
                                heading: t.translate(
                                    i18.measurementBook.measurementBookTitle),
                              ),
                            ),
                            DigitCard(
                              padding: EdgeInsets.zero,
                              child: ExpansionTile(
                                tilePadding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                // childrenPadding: EdgeInsets.zero,
                                expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                expandedAlignment: Alignment.topLeft,
                                title: TextChunk(
                                  subHeading: t.translate(
                                      i18.measurementBook.primaryDetails),
                                  subHeadingStyle: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                children: [
                                  ui_component.DigitCard(
                                      padding: const EdgeInsets.only(
                                          top: 0.0,
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 0.0),
                                      cardType: CardType.primary,
                                      children: [
                                        LabelValueList(
                                            maxLines: 3,
                                            labelFlex: 5,
                                            valueFlex: 5,
                                            items: primaryItems(
                                                    t, value.data, widget.type)
                                                .entries
                                                .map(
                                              (e) {
                                                return LabelValuePair(
                                                    label: e.key,
                                                    value: e.value);
                                              },
                                            ).toList()),
                                        value.data.length > 1
                                            ? Button(
                                                suffixIcon: Icons
                                                    .arrow_forward_outlined,
                                                label: t.translate(i18
                                                    .measurementBook
                                                    .mbShowHistory),
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
                                                type: ButtonType.link,
                                                size: ButtonSize.large)
                                            : const SizedBox.shrink(),
                                      ]),
                                ],
                              ),
                            ),

                            // tab
/////////////////////////
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 16.0,
                                  left: 8.0,
                                  right: 8.0,
                                  bottom: 0.0),
                              child: AnimatedBuilder(
                                animation: _tabController.animation!,
                                builder: (context, child) =>
                                    //Expanded(
                                      //child: 
                                      DigitTabBar(
                                        tabBarThemeData: const DigitTabBarThemeData().copyWith(
                                          tabWidth: 130,
                                          padding: const EdgeInsets.all(0)
                                        ),
                                        tabs: [t.translate(
                                            i18.measurementBook.mbSor), t.translate(
                                            i18.measurementBook.mbNonSor), t.translate(i18
                                             .measurementBook.mbWorksitePhotos)],
                                        onTabSelected: (index){
                                          _tabController.animateTo(index);
                                        },
                                        initialIndex: 0,
                                      ),

                                      // CustomTab(
                                      //   text: t.translate(
                                      //       i18.measurementBook.mbSor),
                                      //   isSelected: _tabController.index == 0,
                                      //   onTap: () {
                                      //     _tabController.animateTo(0);
                                      //   },
                                      //   firstTab: true,
                                      //   lastTap: false,
                                      // ),
                                    //),
                                    // Expanded(
                                    //   child: CustomTab(
                                    //     text: t.translate(
                                    //         i18.measurementBook.mbNonSor),
                                    //     isSelected: _tabController.index == 1,
                                    //     onTap: () {
                                    //       _tabController.animateTo(1);
                                    //     },
                                    //     firstTab: false,
                                    //     lastTap: false,
                                    //   ),
                                    // ),
                                    // Expanded(
                                    //   child: CustomTab(
                                    //     text: t.translate(i18
                                    //         .measurementBook.mbWorksitePhotos),
                                    //     isSelected: _tabController.index == 2,
                                    //     onTap: () {
                                    //       _tabController.animateTo(2);
                                    //     },
                                    //     firstTab: false,
                                    //     lastTap: true,
                                    //   ),
                                    // ),
                                
                              ),
                            ),

                            ///////////////////////// 
                            AnimatedBuilder(
                              animation: _tabController.animation!,
                              builder: (context, child) => SizedBox(
                                height: tabViewHeight(
                                  value.sor!.length,
                                  value.nonSor!.length,
                                  widget.type == MBScreen.create ||
                                          value.data.first.wfStatus == "DRAFTED"
                                      ? 0
                                      : value.data.first.documents != null &&
                                              value
                                                  .data.first.documents!.isEmpty
                                          ? 0
                                          : !value.viewStatus
                                              ? 0
                                              : value
                                                  .data.first.documents!.length,
                                ),
                                child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  controller: _tabController,
                                  children: [
                                    value.sor!.isEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 8.0,
                                              top: 0.0,
                                            ),
                                            child: ui_component.DigitCard(
                                              cardType: CardType.primary,
                                              children: [
                                                Center(
                                                    child: EmptyImage(
                                                  align: Alignment.center,
                                                  label: t.translate(
                                                      i18.common.notFound),
                                                ))
                                              ],
                                            ),
                                          )
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return SorCard(
                                                // consumedQty: consumedQty,
                                                // currentAmt: currentAmt,

                                                index: index,
                                                magic: value.sor![index]
                                                    .filteredMeasurementsMeasure,

                                                preSorNonSor: value.preSor ==
                                                        null
                                                    ? null
                                                    : value.preSor?.firstWhereOrNull(
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
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 8.0,
                                              top: 0.0,
                                            ),
                                            child: ui_component.DigitCard(
                                              cardType: CardType.primary,
                                              children: [
                                                Center(
                                                  child: EmptyImage(
                                                    align: Alignment.center,
                                                    label: t.translate(
                                                        i18.common.notFound),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return SorCard(
                                                // consumedQty: consumedQty,
                                                // currentAmt: currentAmt,

                                                index: index,
                                                magic: value.nonSor![index]
                                                    .filteredMeasurementsMeasure,
                                                preSorNonSor: value.preNonSor ==
                                                        null
                                                    ? null
                                                    : value.preNonSor?.firstWhereOrNull(
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
                                                cardLevel: t.translate(i18
                                                    .measurementBook.mbNonSor),
                                              );
                                            },
                                            itemCount: value.nonSor!.length,
                                          ),
                                    widget.type == MBScreen.create
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                bottom: 8.0,
                                                top: 0.0),
                                            child: ui_component.DigitCard(
                                                cardType: CardType.primary,
                                                children: [
                                                  Center(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      8.0),
                                                          // child: ImageUploader(onImagesSelected: (List<File> filenames ) {
                                                          //    print(filenames);
                                                          //  },
                                                          //     allowMultiples: true,),
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
                                                ]),
                                          )
                                        : value.data.first.documents != null &&
                                                value.data.first.documents!
                                                    .isEmpty
                                            ? !value.viewStatus
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8.0,
                                                            bottom: 8.0,
                                                            top: 0.0),
                                                    child:
                                                        ui_component.DigitCard(
                                                      cardType:
                                                          CardType.primary,
                                                      children: [
                                                        Center(
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        8.0),
                                                                child:
                                                                    FilePickerDemo(
                                                                  fromServerFile:
                                                                      value
                                                                          .data
                                                                          .first
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

                                                                // child: ImageUploader(onImagesSelected: (List<File> filenames ) {
                                                                //    print(filenames);
                                                                //  },
                                                                // allowMultiples: true,),
                                                              ),
                                                              // TODO:[text change]
                                                              Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(4),
                                                                child: Text(t
                                                                    .translate(i18
                                                                        .measurementBook
                                                                        .mbPhotoInfo)),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8.0,
                                                            bottom: 8.0,
                                                            top: 0.0),
                                                    child:
                                                        ui_component.DigitCard(
                                                            cardType: CardType
                                                                .primary,
                                                            children: [
                                                          Center(
                                                            child: EmptyImage(
                                                              align: Alignment
                                                                  .center,
                                                              label: t.translate(i18
                                                                  .measurementBook
                                                                  .noDocumentFound),
                                                            ),
                                                          )
                                                        ]),
                                                  )
                                            : !value.viewStatus
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8.0,
                                                            bottom: 8.0,
                                                            top: 0.0),
                                                    child:
                                                        ui_component.DigitCard(
                                                            cardType: CardType
                                                                .primary,
                                                            children: [
                                                          Center(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          8.0),
                                                                  //             child: ImageUploader(onImagesSelected: (List<File> filenames ) {
                                                                  //               print(filenames);
                                                                  //              },
                                                                  // allowMultiples: true,),
                                                                  child:
                                                                      FilePickerDemo(
                                                                    fromServerFile: value
                                                                        .data
                                                                        .first
                                                                        .documents,
                                                                    callBack: (List<FileStoreModel>?
                                                                            g,
                                                                        List<WorkflowDocument>?
                                                                            l) {
                                                                      context
                                                                          .read<
                                                                              MeasurementDetailBloc>()
                                                                          .add(
                                                                            MeasurementUploadDocumentBlocEvent(
                                                                              tenantId: '',
                                                                              workflowDocument: l!,
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
                                                                Container(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          4),
                                                                  child: Text(t
                                                                      .translate(i18
                                                                          .measurementBook
                                                                          .mbPhotoInfo)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ]),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8.0,
                                                            right: 8.0,
                                                            bottom: 8.0,
                                                            top: 0.0),
                                                    child:
                                                        ui_component.DigitCard(
                                                      cardType:
                                                          CardType.primary,
                                                      children: List.generate(
                                                          value
                                                              .data
                                                              .first
                                                              .documents!
                                                              .length, (index) {
                                                        if (index == 0) {
                                                          return Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        8.0),
                                                            child: Column(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .only(
                                                                      bottom:
                                                                          16.0),
                                                                  child:
                                                                      InfoCard(
                                                                    title: t.translate(i18
                                                                        .common
                                                                        .info),
                                                                    type: InfoType
                                                                        .info,
                                                                    description:
                                                                        t.translate(i18
                                                                            .measurementBook
                                                                            .infoImageTip),
                                                                  ),
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
                                                                        const EdgeInsets
                                                                            .all(
                                                                            10),
                                                                    label:
                                                                        SizedBox(
                                                                      width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width,
                                                                      height:
                                                                          25,
                                                                      child:
                                                                          Text(
                                                                        mm![index]
                                                                            .name
                                                                            .toString(),
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodyMedium,
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
                                                                        .all(
                                                                        10),
                                                                // padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                                                                label: SizedBox(
                                                                  width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width,
                                                                  height: 25,
                                                                  child: Text(
                                                                    mm![index]
                                                                        .name
                                                                        .toString(),
                                                                    maxLines: 1,
                                                                    softWrap:
                                                                        true,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodyMedium,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      }).toList(),
                                                    ),
                                                  ),
                                  ],
                                ),
                              ),
                            ),
                         
                         
                         


                         // ////////////////
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
                                                    isCurrentState:
                                                        e.action == "APPROVE"
                                                            ? false
                                                            : i == 0,
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
                                                        ? e.documents != null &&
                                                                e.documents!
                                                                    .isNotEmpty
                                                            ? e.documents
                                                                ?.map((d) => FileStoreModel(
                                                                    name: '',
                                                                    fileStoreId: d
                                                                        .documentUid))
                                                                .toList()
                                                            : null
                                                        : i != 0
                                                            ? e.documents != null &&
                                                                    e.documents!
                                                                        .isNotEmpty
                                                                ? e.documents
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
                                          timeLineAttributes =
                                              timeLineAttributes.reversed
                                                  .toList();

                                          return timeLineAttributes.isNotEmpty
                                              ? ui_component.DigitCard(
                                                  margin: const EdgeInsets
                                                      .symmetric(horizontal: 8),
                                                  cardType: CardType.secondary,
                                                  children: [
                                                    LabelValueList(
                                                      heading: t.translate(i18
                                                          .common
                                                          .workflowTimeline),
                                                      items: const [],
                                                    ),
                                                    Builder(
                                                      builder: (context) {
                                                        return TimelineMolecule(
                                                          steps: List.generate(
                                                            timeLineAttributes
                                                                .length,
                                                            (i) => TimelineStep(
                                                              additionalWidgets: timeLineAttributes[i]
                                                                              .documents !=
                                                                          null &&
                                                                      timeLineAttributes[
                                                                              i]
                                                                          .documents!
                                                                          .isNotEmpty
                                                                  ? List.generate(
                                                                      timeLineAttributes[i].documents!.length,
                                                                      (index) => InkWell(
                                                                            onTap: () => CommonMethods().onTapOfAttachment(
                                                                                timeLineAttributes[i].documents![index],
                                                                                timeLineAttributes[i].documents![index].tenantId == null
                                                                                    ? GlobalVariables.roleType == RoleType.employee
                                                                                        ? GlobalVariables.tenantId!
                                                                                        : GlobalVariables.stateInfoListModel!.code.toString()
                                                                                    : timeLineAttributes[i].documents![index].tenantId!,
                                                                                // "od.testing",
                                                                                context,
                                                                                roleType: GlobalVariables.roleType == RoleType.employee ? RoleType.employee : RoleType.cbo),
                                                                            child: Container(
                                                                                width: 50,
                                                                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                                                                child: Wrap(runSpacing: 5, spacing: 8, children: [
                                                                                  Image.asset('assets/png/attachment.png'),
                                                                                  Text(
                                                                                    AppLocalizations.of(context).translate(timeLineAttributes[i].documents![index].name.toString()),
                                                                                    maxLines: 2,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  )
                                                                                ])),
                                                                          )).toList()
                                                                  : [],
                                                              description: [
                                                                timeLineAttributes[
                                                                            i]
                                                                        .subTitle ??
                                                                    '',
                                                                timeLineAttributes[
                                                                            i]
                                                                        .assignee ??
                                                                    '',
                                                                timeLineAttributes[
                                                                            i]
                                                                        .mobileNumber ??
                                                                    '',
                                                              ],
                                                              label:
                                                                  timeLineAttributes[
                                                                          i]
                                                                      .title,
                                                              state: timeLineAttributes[
                                                                          i]
                                                                      .isCurrentState
                                                                  ? TimelineStepState
                                                                      .present
                                                                  : TimelineStepState
                                                                      .completed,
                                                            ),
                                                          ).toList(),
                                                        );
                                                      },
                                                    ),
                                                  ],
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
                      return Center(
                        child: shg_loader.Loaders.circularLoader(context),
                      );
                    },
                    error: (value) {
                      return Center(
                        child: EmptyImage(
                          align: Alignment.center,
                          label: t.translate(i18.common.wentWrong),
                        ),
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
        return sork == 0
            ? 300
            : sork == 1
                ? (sork * 500)
                : (sork * 500) + (sork * 20);
      case 1:
        return nonSork == 0
            ? 300
            : nonSork == 1
                ? (nonSork * 500)
                : (nonSork * 500) + (sork * 20);
      case 2:
        return photoSize(photo);
      default:
        return 350.0;
    }
  }

  double photoSize(int photok) {
    switch (photok) {
      case 1:
        return (photok * 115) + 132;
      case 2:
        return (photok * 100) + 120;
      case 3:
        return (photok * 100) + 90;
      case 4:
        return (photok * 90) + 100;
      case 5:
        return (photok * 86.2) + 100;

      default:
        return 350;
    }
  }

  Widget sorCard(
    AppLocalizations t,
    BuildContext ctx,
    int index, {
    List<FilteredMeasurementsMeasure>? magic,
    List<FilteredMeasurementsMeasure>? preSorNonSor,
    required String type,
    required String sorNonSorId,
    required String cardLevel,
    // required TextEditingController consumedQty,
    // required TextEditingController currentAmt,
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
        : preSorNonSor.fold("0.0000", (sum, obj) {
            double m = obj.contracts!.first.estimates!.first.isDeduction == true
                ? -(obj.cumulativeValue!)
                : (obj.cumulativeValue!);
            return double.parse((double.parse(sum) + m.toDouble()).toString())
                .toStringAsFixed(4);
          });

    return ui_component.DigitCard(
        margin: const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
        cardType: CardType.primary,
        children: [
          LabelValueList(
              heading: "$cardLevel ${index + 1}",
              maxLines: 3,
              labelFlex: 5,
              valueFlex: 5,
              items: [
                LabelValuePair(
                    label: t.translate(i18.measurementBook.description),
                    value: magic.first.contracts!.first.estimates!.first.name ??
                        ""),
                LabelValuePair(
                    label: t.translate(i18.measurementBook.unit),
                    value: line[0].uom ?? ''),
                LabelValuePair(
                    label: t.translate(i18.measurementBook.rate),
                    value: line[0].unitRate == null
                        ? 0.00.toString()
                        : double.parse(line[0].unitRate!.toString())
                            .toStringAsFixed(2)),
                LabelValuePair(
                    label: t.translate(i18.measurementBook.approvedQty),
                    value: noOfQty),
                LabelValuePair(
                    label:
                        "${t.translate(i18.measurementBook.preConsumedKey)}\n${t.translate(i18.measurementBook.preConsumedPre)}",
                    value: preSorNonSor == null ? "0.0000" : preConumed),
              ]),

          // ui_label.LabeledField(
          //   label: t.translate(i18.measurementBook.currentMBEntry),
          //   labelStyle: Theme.of(context).textTheme.labelLarge,
          //   child: InkWell(
          //     onTap: () {
          //       showDialog(
          //         context: ctx,
          //         builder: (_) {
          //           return HorizontalCardListDialog(
          //             lineItems: magic,
          //             index: index,
          //             type: type,
          //             noOfUnit: noOfQty,
          //             cummulativePrevQty: preSorNonSor == null
          //                 ? 0.0000
          //                 : preSorNonSor.fold(0.0000, (sum, obj) {
          //                     double m = obj.contracts!.first.estimates!.first
          //                                 .isDeduction ==
          //                             true
          //                         ? -(obj.cumulativeValue!)
          //                         : (obj.cumulativeValue!);
          //                     return sum + m.toDouble();
          //                   }),
          //             sorId: sorNonSorId,
          //           );
          //         },
          //       );
          //     },
          //     child: IgnorePointer(
          //       child: DigitSearchFormInput(
          //         controller: consumedQty
          //           ..text = (magic.fold(0.0, (sum, obj) {
          //             double m;
          //             if (obj.contracts?.first.estimates?.first.isDeduction ==
          //                 false) {
          //               m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
          //                 double mk = double.parse(ob.quantity!.toString());
          //                 return subSum + mk;
          //               });
          //             } else {
          //               m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
          //                 double mr = double.parse(ob.quantity!.toString());
          //                 return subSum + mr;
          //               });
          //               m = -m;
          //             }
          //             return sum + m;
          //           })).toStringAsFixed(4),
          //         readOnly: true,
          //         suffixIcon: Icons.add_circle,
          //         iconColor: Theme.of(context).colorTheme.primary.primary1,
          //         onSuffixTap: (p0) {},
          //       ),
          //     ),
          //   ),
          // ),
          // ui_label.LabeledField(
          //   label: t.translate(i18.measurementBook.mbAmtCurrentEntry),
          //   labelStyle: Theme.of(context).textTheme.labelLarge,
          //   child: DigitTextFormInput(
          //     controller: currentAmt
          //       ..text = (magic.fold(0.0, (sum, obj) {
          //         double m = obj.mbAmount != null
          //             ? (obj.mbAmount != null && obj.mbAmount! < 0)
          //                 ? (obj.mbAmount! * (-1))
          //                 : obj.mbAmount!
          //             : 0.00;
          //         if (obj.contracts?.first.estimates?.first.isDeduction ==
          //             true) {
          //           m = -(m); // Negate the amount for deductions
          //         } else {
          //           m = (m);
          //         }
          //         return sum + m;
          //       })).toStringAsFixed(2),
          //     readOnly: true,
          //   ),
          // ),

// old

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(t.translate(i18.measurementBook.currentMBEntry),
                    style: Theme.of(context).textTheme.headlineSmall),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 50,
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
                            m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
                              double mk = double.parse(ob.quantity!.toString());
                              return subSum + mk;
                            });
                          } else {
                            m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
                              double mr = double.parse(ob.quantity!.toString());
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
                              noOfUnit: noOfQty,
                              cummulativePrevQty: preSorNonSor == null
                                  ? 0.0000
                                  : preSorNonSor.fold(0.0000, (sum, obj) {
                                      double m = obj.contracts!.first.estimates!
                                                  .first.isDeduction ==
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

          // // end
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                child: Text(
                  t.translate(i18.measurementBook.mbAmtCurrentEntry),
                  style: Theme.of(context).textTheme.headlineSmall,
                  textScaler: const TextScaler.linear(0.99),
                ),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: 50,
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
                      if (obj.contracts?.first.estimates?.first.isDeduction ==
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
        ]);
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
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: SizedBox(
                  width: 100,
                  child: DigitDivider(
                    dividerType: DividerType.large,
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
                      t.translate(i18.measurementBook.totalSorAmount),
                      maxLines: 1,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      t.translate(i18.measurementBook.forCurrentEntry),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Text(
                      totalSorAmount.toDouble().toStringAsFixed(2),
                      style: Theme.of(context).textTheme.headlineMedium,
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
                      t.translate(i18.measurementBook.totalNonSorAmount),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      t.translate(i18.measurementBook.forCurrentEntry),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    trailing: Text(
                      totalNonSorAmount.toDouble().toStringAsFixed(2),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                //height: 80,
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
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            // "(for current entry)",
                            t.translate(i18.measurementBook.forCurrentEntry),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                mbAmount.roundToDouble().toStringAsFixed(2),
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
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
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Button(
                        mainAxisSize: MainAxisSize.max,
                        label: t.translate(i18.measurementBook.mbAction),
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (widget.type == MBScreen.update) {
                            showDialog(
                              context: context,
                              builder: (context) => CommonButtonCard(
                                g: processInstances,
                                contractNumber: contractNumber,
                                mbNumber: mbNumber,
                                type: widget.type,
                                bs: bs,
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => CommonButtonCard(
                                g: processInstances,
                                contractNumber: contractNumber,
                                mbNumber: mbNumber,
                                type: widget.type,
                                bs: bs,
                              ),
                            );
                          }
                        },
                        type: ButtonType.primary,
                        size: ButtonSize.large,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
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
      padding: const EdgeInsets.only(top: 10),
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
                            padding: const EdgeInsets.only(top: 1),
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

//

class SorCard extends StatefulWidget {
  final int index;
  final List<FilteredMeasurementsMeasure>? magic;
  final List<FilteredMeasurementsMeasure>? preSorNonSor;
  final String type;
  final String sorNonSorId;
  final String cardLevel;

  const SorCard(
      {super.key,
      required this.index,
      this.magic,
      this.preSorNonSor,
      required this.type,
      required this.sorNonSorId,
      required this.cardLevel});

  @override
  State<SorCard> createState() => _SorCardState();
}

class _SorCardState extends State<SorCard> {
  List<FilteredMeasurementsEstimate> line = [];
  String noOfQty = '';
  String preConumed = '';
  late TextEditingController consumedQtyController;
  late TextEditingController currentAmtController;
  @override
  void initState() {
    // TODO: implement initState
    consumedQtyController = TextEditingController();
    currentAmtController = TextEditingController();

    line = widget.magic!.map(
      (e) {
        return e.contracts!.first.estimates!.first;
      },
    ).toList();
    noOfQty = line.fold("0.0000", (sum, obj) {
      double m = double.parse(obj.noOfunit!.toString()).toDouble();
      return double.parse((double.parse(sum) + m.toDouble()).toString())
          .toStringAsFixed(4);
    });

    preConumed = widget.preSorNonSor == null
        ? "0.0000"
        : widget.preSorNonSor!.fold("0.0000", (sum, obj) {
            double m = obj.contracts!.first.estimates!.first.isDeduction == true
                ? -(obj.cumulativeValue!)
                : (obj.cumulativeValue!);
            return double.parse((double.parse(sum) + m.toDouble()).toString())
                .toStringAsFixed(4);
          });

    consumedQtyController.text = (widget.magic!.fold(0.0, (sum, obj) {
      double m;
      if (obj.contracts?.first.estimates?.first.isDeduction == false) {
        m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
          double mk = double.parse(ob.quantity!.toString());
          return subSum + mk;
        });
      } else {
        m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
          double mr = double.parse(ob.quantity!.toString());
          return subSum + mr;
        });
        m = -m;
      }
      return sum + m;
    })).toStringAsFixed(4);

    currentAmtController.text = (widget.magic!.fold(0.0, (sum, obj) {
      double m = obj.mbAmount != null
          ? (obj.mbAmount != null && obj.mbAmount! < 0)
              ? (obj.mbAmount! * (-1))
              : obj.mbAmount!
          : 0.00;
      if (obj.contracts?.first.estimates?.first.isDeduction == true) {
        m = -(m); // Negate the amount for deductions
      } else {
        m = (m);
      }
      return sum + m;
    })).toStringAsFixed(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final tk = AppLocalizations.of(context);
    return BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
        builder: (context, state) {
      return state.maybeMap(
        orElse: () => const SizedBox.shrink(),
        loaded: (value) {
          line = widget.magic!.map(
            (e) {
              return e.contracts!.first.estimates!.first;
            },
          ).toList();
          noOfQty = line.fold("0.0000", (sum, obj) {
            double m = double.parse(obj.noOfunit!.toString()).toDouble();
            return double.parse((double.parse(sum) + m.toDouble()).toString())
                .toStringAsFixed(4);
          });

          preConumed = widget.preSorNonSor == null
              ? "0.0000"
              : widget.preSorNonSor!.fold("0.0000", (sum, obj) {
                  double m =
                      obj.contracts!.first.estimates!.first.isDeduction == true
                          ? -(obj.cumulativeValue!)
                          : (obj.cumulativeValue!);
                  return double.parse(
                          (double.parse(sum) + m.toDouble()).toString())
                      .toStringAsFixed(4);
                });

          consumedQtyController.text = (widget.magic!.fold(0.0, (sum, obj) {
            double m;
            if (obj.contracts?.first.estimates?.first.isDeduction == false) {
              m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
                double mk = double.parse(ob.quantity!.toString());
                return subSum + mk;
              });
            } else {
              m = obj.measureLineItems!.fold(0.0, (subSum, ob) {
                double mr = double.parse(ob.quantity!.toString());
                return subSum + mr;
              });
              m = -m;
            }
            return sum + m;
          })).toStringAsFixed(4);

          currentAmtController.text = (widget.magic!.fold(0.0, (sum, obj) {
            double m = obj.mbAmount != null
                ? (obj.mbAmount != null && obj.mbAmount! < 0)
                    ? (obj.mbAmount! * (-1))
                    : obj.mbAmount!
                : 0.00;
            if (obj.contracts?.first.estimates?.first.isDeduction == true) {
              m = -(m); // Negate the amount for deductions
            } else {
              m = (m);
            }
            return sum + m;
          })).toStringAsFixed(2);
          return ui_component.DigitCard(
              margin:
                  const EdgeInsets.only(top: 0, bottom: 8, left: 8, right: 8),
              cardType: CardType.primary,
              children: [
                LabelValueList(
                    heading: "${widget.cardLevel} ${widget.index + 1}",
                    maxLines: 3,
                    labelFlex: 5,
                    valueFlex: 5,
                    items: [
                      LabelValuePair(
                          label: tk.translate(i18.measurementBook.description),
                          value: widget.magic!.first.contracts!.first.estimates!
                                  .first.name ??
                              ""),
                      LabelValuePair(
                          label: tk.translate(i18.measurementBook.unit),
                          value: line[0].uom ?? ''),
                      LabelValuePair(
                          label: tk.translate(i18.measurementBook.rate),
                          value: line[0].unitRate == null
                              ? 0.00.toString()
                              : double.parse(line[0].unitRate!.toString())
                                  .toStringAsFixed(2)),
                      LabelValuePair(
                          label: tk.translate(i18.measurementBook.approvedQty),
                          value: noOfQty),
                      LabelValuePair(
                          label:
                              "${tk.translate(i18.measurementBook.preConsumedKey)}\n${tk.translate(i18.measurementBook.preConsumedPre)}",
                          value: widget.preSorNonSor == null
                              ? "0.0000"
                              : preConumed),
                    ]),
                ui_label.LabeledField(
                  label: tk.translate(i18.measurementBook.currentMBEntry),
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return HorizontalCardListDialog(
                            lineItems: widget.magic,
                            index: widget.index,
                            type: widget.type,
                            noOfUnit: noOfQty,
                            cummulativePrevQty: widget.preSorNonSor == null
                                ? 0.0000
                                : widget.preSorNonSor!.fold(0.0000, (sum, obj) {
                                    double m = obj.contracts!.first.estimates!
                                                .first.isDeduction ==
                                            true
                                        ? -(obj.cumulativeValue!)
                                        : (obj.cumulativeValue!);
                                    return sum + m.toDouble();
                                  }),
                            sorId: widget.sorNonSorId,
                          );
                        },
                      );
                    },
                    child: IgnorePointer(
                      child: DigitSearchFormInput(
                        controller: consumedQtyController,
                        readOnly: true,
                        suffixIcon: Icons.add_circle,
                        iconColor:
                            Theme.of(context).colorTheme.primary.primary1,
                        onSuffixTap: (p0) {},
                      ),
                    ),
                  ),
                ),
                ui_label.LabeledField(
                  label: tk.translate(i18.measurementBook.mbAmtCurrentEntry),
                  labelStyle: Theme.of(context).textTheme.labelLarge,
                  child: DigitTextFormInput(
                    controller: currentAmtController,
                    readOnly: true,
                  ),
                ),
              ]);
        },
      );
    });
  }
}
