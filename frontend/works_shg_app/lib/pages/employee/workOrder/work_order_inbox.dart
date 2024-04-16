import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/widgets/atoms/app_bar_logo.dart';
import 'package:works_shg_app/widgets/drawer_wrapper.dart';

import '../../../blocs/employee/work_order/workorder_book.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../utils/common_methods.dart';
import '../../../widgets/Back.dart';
import '../../../widgets/SideBar.dart';
import '../../../widgets/mb/text_button_underline.dart';
import '../../../widgets/work_order/work_order_card.dart';

class WorkOderInboxPage extends StatefulWidget {
  const WorkOderInboxPage({super.key});

  @override
  State<WorkOderInboxPage> createState() => _WorkOderInboxPageState();
}

class _WorkOderInboxPageState extends State<WorkOderInboxPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = []; // List to hold items
  int pageCount = 0; // Initial page count
  bool isLoading = false; // Loading indicator

  @override
  void initState() {
    context.read<WorkOrderInboxBloc>().add(
          WorkOrderInboxBlocCreateEvent(
            businessService: "MB",
            limit: 10,
            moduleName: 'contract-service',
            offset: pageCount,
            tenantId: GlobalVariables.tenantId!,
          ),
        );
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _addRandomData();
    }
  }

  void _addRandomData() {
    int s = pageCount + 10;
    context.read<WorkOrderInboxBloc>().add(
          WorkOrderInboxBlocCreateEvent(
            businessService: "MB",
            limit: 10,
            moduleName: 'measurement-module',
            offset: s,
            tenantId: GlobalVariables.tenantId!,
          ),
        );

    setState(() {
      pageCount = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:
              BlocBuilder<WorkOrderInboxBloc, WorkOrderInboxState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox.shrink();
                },
                loaded: (value) {
                  if (value.mbInboxResponse.items!.length > 19) {
                    return DigitIconButton(
                      iconText: "Back to top",
                      onPressed: () {
                        _scrollController.animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        );
                      },
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
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
          body: BlocBuilder<WorkOrderInboxBloc, WorkOrderInboxState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () => const SizedBox.shrink(),
                loaded: (value) {
                  return CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverPersistentHeader(
                        pinned: true,
                        floating: true,
                        delegate: MyHeaderDelegate(
                          child: Container(
                            color: const DigitColors().seaShellGray,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Back(
                                  callback: () {
                                    context.router.pop();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Work Order Inbox (${value.mbInboxResponse.items?.length ?? 0})",
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineLarge,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.filter_alt,
                                          )),
                                      IconButton(
                                          onPressed: () {},
                                          icon:
                                              const Icon(Icons.sort_outlined)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 150,
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            if (index ==
                                    (value.isLoading
                                        ? value.mbInboxResponse!.items!.length
                                        : value.mbInboxResponse!.items!.length -
                                            1) &&
                                value.isLoading) {
                              return Container(
                                padding: const EdgeInsets.all(16.0),
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator(),
                              );
                            }

                            return WorkOrderCard(
                              widget1: CommonTextButtonUnderline(
                                label: 'View Details',
                                onPressed: () {
                                  context.router
                                      .push(const WorkOrderDetailRoute());
                                  // final contract = value
                                  //         .mbInboxResponse
                                  //         .items?[index]
                                  //         .woBusinessObject
                                  //         ?.contractNumber ??
                                  //     "";
                                  // context.router.push(ViewWorkDetailsRoute(
                                  //     contractNumber: contract!));
                                },
                              ),
                              widget2: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: DigitElevatedButton(
                                  child: const Text("Create Measurement Book"),
                                  onPressed: () {
                                    final contract = value
                                            .mbInboxResponse
                                            .items?[index]
                                            .woBusinessObject
                                            ?.contractNumber ??
                                        "";

                                    context.router.push(MBDetailRoute(
                                        contractNumber: contract,
                                        mbNumber: "",
                                        tenantId: GlobalVariables.tenantId));
                                  },
                                ),
                              ),
                              items: {
                                "Work Order Number": value
                                        .mbInboxResponse
                                        .items?[index]
                                        .woBusinessObject
                                        ?.contractNumber ??
                                    "",
                                "Project Description": value
                                        .mbInboxResponse
                                        .items?[index]
                                        .woBusinessObject
                                        ?.woAdditionalDetails
                                        ?.projectName ??
                                    "",
                                "CBO Name": value
                                        .mbInboxResponse
                                        .items?[index]
                                        .woBusinessObject
                                        ?.woAdditionalDetails
                                        ?.orgName ??
                                    "",
                                // "CBO Role": "Pending for verification",
                                // "Officer In-charge name": "240000",
                                // "Start Date": value.mbInboxResponse
                                //         .items?[index]
                                //         .woBusinessObject?. != null
                                //           ?DateFormat('dd/MM/yyyy').format(
                                //           DateTime.fromMillisecondsSinceEpoch(
                                //               value.mbInboxResponse
                                //         .items?[index]
                                //         .woBusinessObject?))
                                //           : "NA",
                                //"End Date": index + 1,
                                "Work value (Rs)":
                                    NumberFormat('##,##,##,##,###').format(value
                                            .mbInboxResponse
                                            .items?[index]
                                            .woBusinessObject
                                            ?.totalContractedAmount ??
                                        0),
                                "Status": t.translate(
                                    "MB_WFMB_STATE_${value.mbInboxResponse.items?[index].processInstance?.state?.state.toString()}")
                              },
                            );
                          },
                          childCount: value.isLoading
                              ? value!.mbInboxResponse.items!.length + 1
                              : value!.mbInboxResponse.items!.length,
                        ),
                      ),
                    ],
                  );
                },
                loading: (value) =>
                    const Center(child: CircularProgressIndicator.adaptive()),
              );
            },
          ),
        );
      },
    );
  }

  Future<dynamic> filterDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.only(top: AppBar().preferredSize.height),
          title: const Text("sd"),
          contentPadding: EdgeInsets.zero,
          content: Card(
            child: SizedBox(
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              child: const Center(
                child: Text("Loading"),
              ),
            ),
          ),
        );
      },
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double height;
  final Widget child;

  MyHeaderDelegate({required this.child, required this.height});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
