import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/widgets/mb/mb_detail_card.dart';

import '../../blocs/employee/emp_hrms/emp_hrms.dart';
import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/muster_rolls/get_muster_workflow.dart';
import '../../models/employee/mb/filtered_Measures.dart';
import '../../models/employee/mb/mb_detail_response.dart';
import '../../models/file_store/file_store_model.dart';
import '../../utils/common_methods.dart';
import '../../utils/date_formats.dart';
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
  const MBDetailPage(
      {super.key,
      required this.contractNumber,
      required this.mbNumber,
      this.tenantId});

  @override
  State<MBDetailPage> createState() => _MBDetailPageState();
}

class _MBDetailPageState extends State<MBDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  int phots = 0;
  List<DigitTimelineOptions> timeLineAttributes = [];
  @override
  void initState() {
    context.read<MusterGetWorkflowBloc>().add(
          //hard coded
          FetchMBWorkFlowEvent(
              tenantId: 'od.testing', mbNumber: widget.mbNumber),
        );

    context.read<MeasurementDetailBloc>().add(
          MeasurementDetailBookBlocEvent(
            tenantId: '',
            contractNumber: widget.contractNumber,
            measurementNumber: widget.mbNumber,
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
    // return BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
    //   builder: (context, state) {
    //     return state.maybeMap(
    //       orElse: () {
    //         return const SizedBox.shrink();
    //       },
    //       loaded: (value) {
    //         return testing(context);
    //       },
    //     );
    //   },
    // );

    return BlocListener<MusterGetWorkflowBloc, MusterGetWorkflowState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loaded: (mbWorkFlow) {
            final g = mbWorkFlow.musterWorkFlowModel?.processInstances;

            final data = g?.first.nextActions!.first.roles?.join(',');

            context.read<EmpHRMSBloc>().add(
                  EmpHRMSLoadBlocEvent(
                    isActive: true,
                    roles: data ?? "",
                    tenantId: 'od.testing',
                  ),
                );
          },
        );
      },
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar:
              BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox.shrink();
                },
                loaded: (value) {
                  double sorprice = 0.0;

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

                  return BlocBuilder<MusterGetWorkflowBloc,
                      MusterGetWorkflowState>(
                    builder: (context, state) {
                      return state.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        loaded: (mbWorkFlow) {
                          final g =
                              mbWorkFlow.musterWorkFlowModel?.processInstances;

                          return FloatActionCard(
                            actions: () {
                              DigitActionDialog.show(
                                context,
                                widget: CommonButtonCard(
                                  g: g,
                                  contractNumber: widget.contractNumber,
                                  mbNumber: widget.mbNumber,
                                ),
                              );
                            },
                            // amount: sorprice.toString(),
                            amount: value.data.first.totalAmount!
                                .toDouble()
                                .roundToDouble()
                                .toString(),
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
                              );
                            },
                            totalAmountText: t.translate(i18.measurementBook.totalMbAmount),
                            subtext: t.translate(i18.measurementBook.forCurrentEntry),
                          );
                        },
                      );
                    },
                  );
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
                  final mm = value.rawData.documents
                      ?.map((d) => FileStoreModel(
                            name: d.documentAdditionalDetails?.fileName,
                            fileStoreId: d.fileStore,
                            id: d.id,
                            tenantId: d.documentAdditionalDetails?.tenantId,
                          ))
                      .toList();
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Back(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                            t.translate(
                                i18.measurementBook.measurementBookTitle),
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineLarge,
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
                              t.translate(i18.measurementBook.primaryDetails),
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.headlineSmall,
                            ),
                            children: [
                              CommonMBCard(
                                items: {
                                  t.translate(i18.measurementBook.mbNumber):
                                      value.data.first.mbNumber,
                                  t.translate(i18.attendanceMgmt.projectDesc):
                                      value
                                              .data
                                              .first
                                              .measures!
                                              .first
                                              .contracts!
                                              .first
                                              .contractAdditionalDetails
                                              ?.projectDesc ??
                                          "NA",
                                  // t.translate(i18.common.assignee): value
                                  //         .data
                                  //         .first
                                  //         .measures!
                                  //         .first
                                  //         .contracts!
                                  //         .first
                                  //         .contractAdditionalDetails
                                  //         ?.officerInChargeDesgn ??
                                  //     "NA",
                                  t.translate(
                                      i18.common
                                          .commonWorkflowStates): t.translate(
                                      "MB_WFMB_STATE_${value.data.first.wfStatus!}"),
                                  t.translate(i18.measurementBook.mbAmount):
                                      value.data.first.totalAmount != null
                                          ? double.parse((value
                                                  .data.first.totalAmount!
                                                  .toDouble())
                                              .toStringAsFixed(2))
                                          : 0.0,
                                          t.translate(i18.common.musterRollId):value.data.first.musterRollNumber,
                                  // "SLA Days remaining": 2,
                                },
                                widget: CommonTextButtonUnderline(
                                  label: t.translate(
                                      i18.measurementBook.mbShowHistory),
                                  onPressed: () {
                                    context.router.push(
                                      MBHistoryBookRoute(
                                        contractNumber: widget.contractNumber,
                                        mbNumber: widget.mbNumber,
                                        tenantId: widget.tenantId,
                                      ),
                                    );
                                  },
                                ),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // padding: EdgeInsets.zero,
                            // controller: _tabController,
                            children: [
                              Expanded(
                                child: CustomTab(
                                  text: t.translate(i18.measurementBook.mbSor),
                                  isSelected: _selectedIndex == 0,
                                  onTap: () {
                                    _tabController.animateTo(0);
                                  },
                                ),
                              ),
                              Expanded(
                                child: CustomTab(
                                  text:
                                      t.translate(i18.measurementBook.mbNonSor),
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
                            value.rawData.documents != null &&
                                    value.rawData.documents!.isEmpty
                                ? 0
                                : value.rawData.documents!.length,
                          ),
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              value.sor!.isEmpty
                                  ? const Card(
                                      child:
                                          Center(child: Text("No Data Found")),
                                    )
                                  : ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return sorCard(
                                          t,
                                          context,
                                          index,
                                          magic: value.sor![index]
                                              .filteredMeasurementsMeasure,
                                          // preSor_NonSor: value.preSor![index]
                                          // .filteredMeasurementsMeasure,

                                          preSor_NonSor: value.preSor == null
                                              ? null
                                              : value.preSor![index]
                                                  .filteredMeasurementsMeasure,
                                          type: "sor",
                                          sorNonSorId: value.sor![index].sorId!,
                                        );
                                      },
                                      itemCount: value.sor!.length,
                                    ),
                              value.nonSor!.isEmpty
                                  ? const Card(
                                      child:
                                          Center(child: Text("No Data Found")),
                                    )
                                  : ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return sorCard(
                                          t,
                                          context, index,
                                          magic: value.nonSor![index]
                                              .filteredMeasurementsMeasure,

                                          // preSor_NonSor: value.preNonSor![index]
                                          // .filteredMeasurementsMeasure,

                                          preSor_NonSor: value.preNonSor == null
                                              ? null
                                              : value.preNonSor![index]
                                                  .filteredMeasurementsMeasure,
                                          type: "NonSor",
                                          sorNonSorId:
                                              value.nonSor![index].sorId!,
                                        );
                                      },
                                      itemCount: value.nonSor!.length,
                                    ),
                              value.rawData.documents != null &&
                                      value.rawData.documents!.isEmpty
                                  ? !value.viewStatus
                                      ? Card(
                                          child: Center(
                                            child: FilePickerDemo(
                                              callBack: (List<FileStoreModel>?
                                                      g,
                                                  List<WorkflowDocument>? l) {
                                                context
                                                    .read<
                                                        MeasurementDetailBloc>()
                                                    .add(
                                                      MeasurementUploadDocumentBlocEvent(
                                                        tenantId: '',
                                                        workflowDocument: l!,
                                                      ),
                                                    );
                                                print(g);
                                              },
                                              extensions: const [
                                                'jpg',
                                                'png',
                                                'jpeg'
                                              ],
                                              moduleName: 'works', headerType: MediaType.mbDetail,
                                            ),
                                          ),
                                        )
                                      : const Card(
                                          child: Center(
                                            child: Text("No Data Found"),
                                          ),
                                        )
                                  : ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return InkWell(
                                          onTap: () =>
                                              CommonMethods().onTapOfAttachment(
                                            mm![index],
                                            mm![index].tenantId!,
                                            context,
                                            roleType: RoleType.employee,
                                          ),
                                          child: Container(
                                              //width: 50,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 5),
                                              child: Wrap(
                                                  runSpacing: 8,
                                                  spacing: 5,
                                                  children: [
                                                    Image.asset(
                                                      'assets/png/attachment.png',
                                                      height: 200,
                                                      width: MediaQuery.sizeOf(
                                                              context)
                                                          .width,
                                                    ),
                                                    //         Image.network( CommonMethods().loadImg(mm![index].fileStoreId!,
                                                    // mm![index].tenantId!,

                                                    // roleType: RoleType.employee,),),
                                                    Text(
                                                      AppLocalizations.of(
                                                              context)
                                                          .translate(mm![index]
                                                              .name
                                                              .toString()),
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ])),
                                        );
                                      },
                                      itemCount:
                                          value.rawData.documents!.length),
                            ],
                          ),
                        ),

                        //workflow
                        BlocBuilder<MusterGetWorkflowBloc,
                            MusterGetWorkflowState>(
                          builder: (context, state) {
                            return state.maybeMap(
                              orElse: SizedBox.shrink,
                              loaded: (value) {
                                final timeLineAttributes = value
                                    .musterWorkFlowModel!.processInstances!
                                    .mapIndexed((i, e) => DigitTimelineOptions(
                                          title: t.translate(
                                              '${e.workflowState?.state}'),
                                          subTitle: DateFormats.getTimeLineDate(
                                              e.auditDetails
                                                      ?.lastModifiedTime ??
                                                  0),
                                          isCurrentState: i == 0,
                                          comments: e.comment,
                                          documents: e.documents != null
                                              ? e.documents
                                                  ?.map((d) => FileStoreModel(
                                                      name: '',
                                                      fileStoreId:
                                                          d.documentUid))
                                                  .toList()
                                              : null,
                                          assignee: e.assignes?.first.name,
                                          mobileNumber: e.assignes != null
                                              ? '+91-${e.assignes?.first.mobileNumber}'
                                              : null,
                                        ))
                                    .toList();
                                return DigitCard(
                                  child: ExpansionTile(
                                    title: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: Text(
                                        t.translate(
                                            i18.common.workflowTimeline),
                                        style: DigitTheme.instance.mobileTheme
                                            .textTheme.headlineMedium,
                                      ),
                                    ),
                                    children: [
                                      DigitTimeline(
                                        timelineOptions: timeLineAttributes,
                                      ),
                                    ],
                                  ),
                                );
                                //
                              },
                            );
                          },
                        ),
                        // image

                        // FilePickerDemo(
                        //   callBack: (List<FileStoreModel>? g,
                        //       List<WorkflowDocument>? l) {
                        //     context.read<MeasurementDetailBloc>().add(
                        //           MeasurementUploadDocumentBlocEvent(
                        //             tenantId: '',
                        //             workflowDocument: l!,
                        //           ),
                        //         );
                        //     print(g);
                        //   },
                        //   extensions: const ['jpg', 'png', 'jpeg'],
                        //   moduleName: 'works',
                        // ),
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
        ),
      ),
    );
  }

  double tabViewHeight(int sork, int nonSork, int photo) {
    switch (_tabController.index) {
      case 0:
        return sork == 0 ? 300 : sork * 500;
      case 1:
        return nonSork == 0 ? 300 : nonSork * 500;
      case 2:
        return photo == 0 ? 300 : photo * 240;
      default:
        return 300.0;
    }
  }

  Card sorCard(
    AppLocalizations t,
    BuildContext ctx,
    int index, {
    List<FilteredMeasurementsMeasure>? magic,
    List<FilteredMeasurementsMeasure>? preSor_NonSor,
    required String type,
    required String sorNonSorId,
  }) {
    List<FilteredMeasurementsEstimate> line = magic!.map(
      (e) {
        return e.contracts!.first.estimates!.first;
      },
    ).toList();

    double consumed = magic.fold(0, (sum, obj) {
      double m = obj.cumulativeValue!;
      return sum + m.toDouble();
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
                  "SOR${index + 1}",
                  style:
                      DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
                ),
              ),
              SORTableCard(
                element: {
                  t.translate(i18.measurementBook.description):
                      magic.first.contracts!.first.estimates!.first.name,
                  t.translate(i18.measurementBook.unit): line[0].uom,
                  t.translate(i18.measurementBook.rate): line[0].unitRate,
                  // "Approved Quantity": line.fold(0, (sum, obj) {
                  //   int m = obj.quantity!;
                  //   return sum + m;
                  // }),
                  t.translate(i18.measurementBook.approvedQty): line[0].noOfunit,
                  "Consumed Quantity\n(Upto previous entry)":
                  //  t.translate(i18.measurementBook.consumedQty):
                      preSor_NonSor == null
                          ? 0
                          : preSor_NonSor!.first.cumulativeValue,
                  // "Consumed Quantity\n(current entry)": magic[0].currentValue!.toDouble(),
                },
              ),
              DigitTextField(
                label: t.translate(i18.measurementBook.currentMBEntry),
                controller: TextEditingController()
                  ..value
                  ..text = magic[0].numItems.toString(),
                suffixIcon: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: ctx,
                      builder: (BuildContext ctx) {
                        return HorizontalCardListDialog(
                          lineItems: magic,
                          index: index,
                          type: type,
                          noOfUnit: line[0].noOfunit,
                          cummulativePrevQty: preSor_NonSor == null
                              ? 0
                              : preSor_NonSor!.first.cumulativeValue,
                          sorId: sorNonSorId,
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.add_circle,
                      size: 30,
                      color: const DigitColors().burningOrange,
                    ),
                  ),
                ),
              ),
              DigitTextField(
                controller: TextEditingController()
                  ..value
                  ..text = double.parse(
                          (magic[0].mbAmount!.toDouble()).toStringAsFixed(2))
                      .toString(),
                // (magic[0].mbAmount).toString(),
                label: t.translate(i18.measurementBook.mbAmtCurrentEntry),
                isDisabled: true,
              ),
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
  ) {
    showModalBottomSheet(
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
                      totalSorAmount!.toDouble().roundToDouble().toString(),
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
                      totalNonSorAmount!.toDouble().roundToDouble().toString(),
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
                                mbAmount!.toDouble().roundToDouble().toString(),
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
              DigitElevatedButton(
                  child:  Text(t.translate(i18.measurementBook.mbAction)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    DigitActionDialog.show(
                      context,
                      widget: CommonButtonCard(
                        g: processInstances,
                        contractNumber: contractNumber,
                        mbNumber: mbNumber,
                      ),
                    );
                  }),
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
                              style: theme.textTheme.headline5,
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
