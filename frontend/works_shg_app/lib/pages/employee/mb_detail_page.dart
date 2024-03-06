import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/widgets/mb/mb_detail_card.dart';

import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/muster_rolls/get_muster_workflow.dart';
import '../../models/employee/mb/filtered_Measures.dart';
import '../../models/file_store/file_store_model.dart';
import '../../utils/common_methods.dart';
import '../../utils/date_formats.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/atoms/digit_timeline.dart';
import '../../widgets/drawer_wrapper.dart';
import '../../widgets/mb/float_action_card.dart';
import '../../widgets/mb/workFlowButtonList.dart';
import '../../widgets/mb/sor_item_add_mb.dart';
import '../../widgets/mb/text_button_underline.dart';

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
  int sor = 5;
  int nsor = 20;
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

    return DefaultTabController(
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

                // for (int i = 0; i < value.data.length; i++) {
                //   final key = value.data.keys.elementAt(i);
                //   List<dynamic> line = value.data[key]!.map(
                //     (e) {
                //       return e['contract'][0]['estimate'][0];
                //     },
                //   ).toList();
                //   int consumed = value.data[key]!.fold(0, (sum, obj) {
                //     double m = obj['currentValue'];
                //     return sum + m.toInt();
                //   });
                //   sorprice += (line[0]['unitRate'] * consumed);
                // }
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
                              widget: CommonButtonCard(g: g),
                            );
                          },
                          // amount: sorprice.toString(),
                          amount: value.data.first.totalAmount!
                              .toDouble()
                              .roundToDouble()
                              .toString(),
                          openButtonSheet: () {
                            _openBottomSheet(
                              context,
                              value.data.first.totalSorAmount!,
                              value.data.first.totalNorSorAmount!,
                              value.data.first.totalAmount!,
                            );
                          },
                          totalAmountText: 'Total MB Amount',
                          subtext: '(For Current Entry)',
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
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Back(),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Measurement Book",
                          style: DigitTheme
                              .instance.mobileTheme.textTheme.headlineLarge,
                        ),
                      ),
                      DigitCard(
                        // margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        child: ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          expandedAlignment: Alignment.topLeft,
                          title: Text(
                            "Primary Details",
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineSmall,
                          ),
                          children: [
                            CommonMBCard(
                              items: const {
                                "MB number": "MB-233",
                                "Project Description":
                                    "Wall Painting in Ward 1",
                                "Assignee": "SHG group-C#1",
                                "Workflow State": "Pending for verification",
                                "MB Account": "240000",
                                "SLA Days remaining": 2,
                              },
                              widget: CommonTextButtonUnderline(
                                label: 'View MB History',
                                onPressed: () {
                                  context.router
                                      .push(const MBHistoryBookRoute());
                                },
                              ),
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
                                text: 'SORs',
                                isSelected: _selectedIndex == 0,
                                onTap: () {
                                  _tabController.animateTo(0);
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomTab(
                                text: 'Non SORs',
                                isSelected: _selectedIndex == 1,
                                onTap: () {
                                  _tabController.animateTo(1);
                                },
                              ),
                            ),
                            Expanded(
                              child: CustomTab(
                                text: 'Site Photos',
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
                            value.sor!.length, value.nonSor!.length, 0),
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            value.sor!.isEmpty
                                ? const Card(
                                    child: Center(child: Text("No Data Found")),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      // final key =
                                      //     value.data.keys.elementAt(index);
                                      // final valuel = value.data[key]!;
                                      return sorCard(index,
                                          magic: value.sor![index]
                                              .filteredMeasurementsMeasure);
                                    },
                                    itemCount: value.sor!.length,
                                  ),
                            value.nonSor!.isEmpty
                                ? const Card(
                                    child: Center(child: Text("No Data Found")),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return sorCard(index,
                                          magic: value.nonSor![index]
                                              .filteredMeasurementsMeasure);
                                    },
                                    itemCount: value.nonSor!.length,
                                  ),
                            phots == 0
                                ? const Card(
                                    child: Center(child: Text("No Data Found")),
                                  )
                                : ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return sorCard(index);
                                    },
                                    itemCount: phots,
                                  ),
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
                                       title: t.translate('CBO_MUSTER_${e.workflowState?.state}'),
                                        subTitle: DateFormats.getTimeLineDate(
                                            e.auditDetails?.lastModifiedTime ??
                                                0),
                                        isCurrentState: i == 0,
                                        comments: e.comment,
                                        documents: e.documents != null
                                            ? e.documents
                                                ?.map((d) => FileStoreModel(
                                                    name: '',
                                                    fileStoreId: d.documentUid))
                                                .toList()
                                            : null,
                                        assignee: e.assignes?.first.name,
                                        mobileNumber: e.assignes != null
                                            ? '+91-${e.assignes?.first.mobileNumber}'
                                            : null,
                                      ))
                                  .toList();
                              return DigitCard(
                                child: DigitTimeline(
                                  timelineOptions: timeLineAttributes,
                                ),
                              );
                              //
                            },
                          );
                        },
                      ),
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
    );
  }

  // DefaultTabController testing(BuildContext context) {
  //   return DefaultTabController(
  //     length: 3,
  //     child: Scaffold(
  //       bottomNavigationBar: FloatActionCard(
  //         actions: () {
  //           context.router.push(const MBTypeConfirmationRoute());
  //         },
  //         amount: '10000000',
  //         openButtonSheet: () {
  //           _openBottomSheet(context);
  //         },
  //         totalAmountText: 'Total MB Amount',
  //         subtext: '(For Current Entry)',
  //       ),
  //       backgroundColor: const DigitColors().seaShellGray,
  //       appBar: AppBar(
  //         titleSpacing: 0,
  //         title: const AppBarLogo(),
  //       ),
  //       drawer: DrawerWrapper(
  //         Drawer(
  //           child: SideBar(
  //             module: CommonMethods.getLocaleModules(),
  //           ),
  //         ),
  //       ),
  //       body: SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             const Back(),
  //             Padding(
  //               padding: const EdgeInsets.only(left: 20.0),
  //               child: Text(
  //                 "Measurement Book",
  //                 style:
  //                     DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
  //               ),
  //             ),
  //             DigitCard(
  //               // margin: EdgeInsets.zero,
  //               padding: EdgeInsets.zero,
  //               child: ExpansionTile(
  //                 expandedCrossAxisAlignment: CrossAxisAlignment.start,
  //                 expandedAlignment: Alignment.topLeft,
  //                 title: Text(
  //                   "Primary Details",
  //                   style:
  //                       DigitTheme.instance.mobileTheme.textTheme.headlineSmall,
  //                 ),
  //                 children: [
  //                   CommonMBCard(
  //                     items: const {
  //                       "MB number": "MB-233",
  //                       "Project Description": "Wall Painting in Ward 1",
  //                       "Assignee": "SHG group-C#1",
  //                       "Workflow State": "Pending for verification",
  //                       "MB Account": "240000",
  //                       "SLA Days remaining": 2,
  //                     },
  //                     widget: CommonTextButtonUnderline(
  //                       label: 'View MB History',
  //                       onPressed: () {
  //                         context.router.push(const MBHistoryBookRoute());
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),

  //             // tab

  //             Padding(
  //               padding: const EdgeInsets.only(
  //                   top: 8.0, left: 8.0, right: 8.0, bottom: 0.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 // padding: EdgeInsets.zero,
  //                 // controller: _tabController,
  //                 children: [
  //                   Expanded(
  //                     child: CustomTab(
  //                       text: 'SORs',
  //                       isSelected: _selectedIndex == 0,
  //                       onTap: () {
  //                         _tabController.animateTo(0);
  //                       },
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: CustomTab(
  //                       text: 'Non SORs',
  //                       isSelected: _selectedIndex == 1,
  //                       onTap: () {
  //                         _tabController.animateTo(1);
  //                       },
  //                     ),
  //                   ),
  //                   Expanded(
  //                     child: CustomTab(
  //                       text: 'Site Photos',
  //                       isSelected: _selectedIndex == 2,
  //                       onTap: () {
  //                         _tabController.animateTo(2);
  //                       },
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               height: tabViewHeight(value.data.length, value.data.length, 0),
  //               child: TabBarView(
  //                 controller: _tabController,
  //                 children: [
  //                   sor == 0
  //                       ? const Card(
  //                           child: Center(child: Text("No Data Found")),
  //                         )
  //                       : ListView.builder(
  //                           physics: const NeverScrollableScrollPhysics(),
  //                           itemBuilder: (BuildContext context, int index) {
  //                             final key = value.data.keys.elementAt(index);
  //                             final valuel = value.data[key]!;
  //                             return sorCard(index);
  //                           },
  //                           itemCount: value.data.length,
  //                         ),
  //                   nsor == 0
  //                       ? const Card(
  //                           child: Center(child: Text("No Data Found")),
  //                         )
  //                       : ListView.builder(
  //                           physics: const NeverScrollableScrollPhysics(),
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return sorCard(index);
  //                           },
  //                           itemCount: nsor,
  //                         ),
  //                   phots == 0
  //                       ? const Card(
  //                           child: Center(child: Text("No Data Found")),
  //                         )
  //                       : ListView.builder(
  //                           physics: const NeverScrollableScrollPhysics(),
  //                           itemBuilder: (BuildContext context, int index) {
  //                             return sorCard(index);
  //                           },
  //                           itemCount: phots,
  //                         ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  double tabViewHeight(int sork, int nonSork, int photo) {
    switch (_tabController.index) {
      case 0:
        return sork == 0 ? 300 : sork * 500;
      case 1:
        return nonSork == 0 ? 300 : nonSork * 500;
      case 2:
        return photo == 0 ? 300 : photo * 500;
      default:
        return 300.0;
    }
  }

  Card sorCard(int index, {List<FilteredMeasurementsMeasure>? magic}) {
    List<FilteredMeasurementsEstimate> line = magic!.map(
      (e) {
        return e.contracts!.first.estimates!.first;
      },
    ).toList();

    int consumed = magic.fold(0, (sum, obj) {
      double m = obj.currentValue!;
      return sum + m.toInt();
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
                  "Description":
                      magic.first.contracts!.first.estimates!.first.name,
                  "Unit": line[0].uom,
                  "Rate(rs)": line[0].unitRate,
                  "Approved Quantity": line.fold(0, (sum, obj) {
                    int m = obj.quantity!;
                    return sum + m;
                  }),
                  "Consumed Quantity\n(Upto previous entry)": consumed,
                },
              ),
              DigitTextField(
                label: "Current Measurement Book Entry",
                suffixIcon: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return HorizontalCardListDialog(
                          lineItems: magic,
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
                  ..text = (magic[0].mbAmount).toString(),
                label: "Amount for Current Entry",
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context, double totalSorAmount,
      double totalNonSorAmount, double mbAmount) {
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
                      "Total SOR Amount",
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      "(for current entry)",
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
                      "Total Non SOR Amount",
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      "(for current entry)",
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
                            "Total MB Amount",
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineMedium,
                          ),
                          subtitle: Text(
                            "(for current entry)",
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
                  child: const Text("Actions"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.router.push(const MBTypeConfirmationRoute());
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
