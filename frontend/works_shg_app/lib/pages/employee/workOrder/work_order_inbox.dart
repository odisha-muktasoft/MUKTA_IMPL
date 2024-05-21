import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/blocs/organisation/org_search_bloc.dart';
import 'package:works_shg_app/blocs/wage_seeker_registration/wage_seeker_location_bloc.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/employee/mb/mb_logic.dart';
import 'package:works_shg_app/utils/employee/support_services.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/widgets/atoms/app_bar_logo.dart';
import 'package:works_shg_app/widgets/atoms/empty_image.dart';
import 'package:works_shg_app/widgets/drawer_wrapper.dart';

import '../../../blocs/employee/work_order/workorder_book.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../utils/common_methods.dart';
import '../../../utils/constants.dart';
import '../../../widgets/Back.dart';
import '../../../widgets/SideBar.dart';
import '../../../widgets/mb/text_button_underline.dart';
import '../../../widgets/work_order/work_order_card.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

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
         context.read<WageSeekerLocationBloc>().add(
          LocationEventWageSeeker(tenantId: GlobalVariables.tenantId!),
        );
    context.read<ORGSearchBloc>().add(
          SearchMbORGEvent(tenantId: GlobalVariables.tenantId!),
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

    final state = context.read<WorkOrderInboxBloc>().state;

    state.maybeMap(
      orElse: () => {},
      loaded: (value) {
        if (value.search) {
          context.read<WorkOrderInboxBloc>().add(
                WorkOrderInboxSearchRepeatBlocEvent(
                  businessService: "Contract",
                  limit: 10,
                  moduleName: 'contract-module',
                  offset: s,
                  tenantId: GlobalVariables.tenantId!,
                ),
              );
        } else {
          context.read<WorkOrderInboxBloc>().add(
                WorkOrderInboxBlocCreateEvent(
                  businessService: "MB",
                  limit: 10,
                  moduleName: 'measurement-module',
                  offset: s,
                  tenantId: GlobalVariables.tenantId!,
                ),
              );
        }
      },
    );

    // context.read<WorkOrderInboxBloc>().add(
    //       WorkOrderInboxBlocCreateEvent(
    //         businessService: "MB",
    //         limit: 10,
    //         moduleName: 'measurement-module',
    //         offset: s,
    //         tenantId: GlobalVariables.tenantId!,
    //       ),
    //     );

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
                  if (value.contracts!.length > 19) {
                    return TextButton.icon(
                      style: TextButton.styleFrom(
                        backgroundColor: const DigitColors().white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              color: const DigitColors().burningOrange),
                        ),
                      ),
                      label: Text(t.translate(i18.measurementBook.backToTop)),
                      onPressed: () {
                        _scrollController.animateTo(
                          0.0,
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: SvgPicture.asset(Constants.doubleArrow),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
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
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "${t.translate(i18.measurementBook.workOrderInbox)} (${value.contracts?.length ?? 0})",
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineLarge,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 8.0, top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton.icon(
                                          label: Text(
                                            t.translate(i18.common.filter),
                                            style: DigitTheme
                                                .instance
                                                .mobileTheme
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                              color: const DigitColors()
                                                  .burningOrange,
                                            ),
                                          ),

                                          
                                          onPressed: () {
                                          
                                            context.router
                                                .push(const WOFilterRoute());
                                            
                                          },
                                          icon: const Icon(
                                            Icons.filter_alt,
                                          )),
                                      // reset
                                      value.search
                                          ? IconButton(
                                              onPressed: () {
                                                pageCount = 0;
                                                context
                                                    .read<WorkOrderInboxBloc>()
                                                    .add(
                                                      WorkOrderInboxBlocCreateEvent(
                                                        businessService: "MB",
                                                        limit: 10,
                                                        moduleName:
                                                            'contract-service',
                                                        offset: pageCount,
                                                        tenantId:
                                                            GlobalVariables
                                                                .tenantId!,
                                                      ),
                                                    );
                                              },
                                              icon: Icon(
                                                Icons.restore_outlined,
                                                color: const DigitColors()
                                                    .burningOrange,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                      //
                                      TextButton.icon(
                                          label: Text(
                                            t.translate(
                                                i18.measurementBook.sort),
                                            style: DigitTheme
                                                .instance
                                                .mobileTheme
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                              color: const DigitColors()
                                                  .burningOrange,
                                            ),
                                          ),

                                          // color: const DigitColors()
                                          //     .burningOrange,
                                          onPressed: () {
                                            Conversion.openSortingModal(
                                              context,
                                              listData:
                                                  Conversion.sortWorkOrder,
                                              sortType: SortType.woSort,
                                            );
                                          },
                                          icon:
                                              SvgPicture.asset(Constants.sort)),

                                      // Row(
                                      //   children: [
                                      //     IconButton(
                                      //         color: const DigitColors()
                                      //             .burningOrange,
                                      //         onPressed: () {
                                      //           Conversion.openSortingModal(
                                      //             context,
                                      //             listData:
                                      //                 Conversion.sortWorkOrder,
                                      //             sortType: SortType.woSort,
                                      //           );
                                      //         },
                                      //         icon: SvgPicture.asset(
                                      //             Constants.sort)),
                                      //     Text(
                                      //       t.translate(
                                      //           i18.measurementBook.sort),
                                      //       style: DigitTheme
                                      //           .instance
                                      //           .mobileTheme
                                      //           .textTheme
                                      //           .labelLarge!
                                      //           .copyWith(
                                      //         color: const DigitColors()
                                      //             .burningOrange,
                                      //       ),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 150,
                        ),
                      ),
                      value.contracts!.isEmpty
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Center(
                                    child: EmptyImage(
                                      align: Alignment.center,
                                      label: t.translate(
                                          i18.common.workOrderNotFound),
                                    ),
                                  );
                                },
                                childCount: 1,
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  // if (index ==
                                  //         (mbInboxResponse.isLoading
                                  //             ? mbInboxResponse
                                  //                 .mbInboxResponse!.items!.length
                                  //             : mbInboxResponse.mbInboxResponse!
                                  //                     .items!.length -
                                  //                 1) &&
                                  //     mbInboxResponse.isLoading) {
                                  //   // Display loading indicator
                                  //   return Container(
                                  //     padding: const EdgeInsets.all(16.0),
                                  //     alignment: Alignment.center,
                                  //     child: const CircularProgressIndicator(),
                                  //   );
                                  // }

                                  //
                                  if (index ==
                                          (value.isLoading
                                              ? value.contracts!.length
                                              : value.contracts!.length - 1) &&
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
                                        // context.router
                                        //     .push(const WorkOrderDetailRoute());
                                        context.router
                                            .push(ViewWorkDetailsRoute(
                                          contractNumber: value
                                                  .contracts![index]
                                                  ?.contractNumber ??
                                              "",
                                          wfStatus: "ACCEPTED",
                                        ));
                                      },
                                    ),
                                    widget2: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: DigitElevatedButton(
                                        child: Text(t.translate(
                                            i18.measurementBook.createMb)),
                                        onPressed: () {
                                          // DigitActionDialog.show(context,
                                          //     widget: Center(
                                          //       child: Column(
                                          //         mainAxisSize: MainAxisSize.min,
                                          //         children: [
                                          //           Padding(
                                          //             padding: const EdgeInsets.only(
                                          //                 bottom: 8.0),
                                          //             child: DigitOutlineIconButton(
                                          //               buttonStyle: OutlinedButton.styleFrom(
                                          //                   minimumSize: Size(
                                          //                       MediaQuery.of(context)
                                          //                               .size
                                          //                               .width /
                                          //                           2.8,
                                          //                       50),
                                          //                   shape:
                                          //                       const RoundedRectangleBorder(),
                                          //                   side: BorderSide(
                                          //                       color:
                                          //                           const DigitColors()
                                          //                               .burningOrange,
                                          //                       width: 1)),
                                          //               onPressed: () {
                                          //                 Navigator.of(context,
                                          //                         rootNavigator: true)
                                          //                     .pop();
                                          //               },
                                          //               label: AppLocalizations.of(
                                          //                       context)
                                          //                   .translate(i18.home
                                          //                       .manageWageSeekers),
                                          //               icon: Icons.fingerprint,
                                          //               textStyle: const TextStyle(
                                          //                   fontWeight:
                                          //                       FontWeight.w700,
                                          //                   fontSize: 18),
                                          //             ),
                                          //           ),
                                          //           DigitOutlineIconButton(
                                          //             label: AppLocalizations.of(
                                          //                     context)
                                          //                 .translate(i18.workOrder
                                          //                     .requestTimeExtension),
                                          //             icon: Icons
                                          //                 .calendar_today_rounded,
                                          //             buttonStyle: OutlinedButton.styleFrom(
                                          //                 minimumSize: Size(
                                          //                     MediaQuery.of(context)
                                          //                             .size
                                          //                             .width /
                                          //                         2.8,
                                          //                     50),
                                          //                 shape:
                                          //                     const RoundedRectangleBorder(),
                                          //                 side: BorderSide(
                                          //                     color:
                                          //                         const DigitColors()
                                          //                             .burningOrange,
                                          //                     width: 1)),
                                          //             onPressed: () {
                                          //               Navigator.of(context,
                                          //                       rootNavigator: true)
                                          //                   .pop();
                                          //             },
                                          //             textStyle: const TextStyle(
                                          //                 fontWeight: FontWeight.w700,
                                          //                 fontSize: 18),
                                          //           )
                                          //         ],
                                          //       ),
                                          //     ));

                                          final contract = value
                                                  .contracts?[index]
                                                  .contractNumber ??
                                              "";

                                          context.router.push(MBDetailRoute(
                                            contractNumber: contract,
                                            mbNumber: "",
                                            tenantId: GlobalVariables.tenantId,
                                            type: MBScreen.create,
                                          ));
                                        },
                                      ),
                                    ),
                                    items: {
                                      t.translate(i18.measurementBook.workOrderNumberInbox): value
                                              .contracts?[index]
                                              .contractNumber ??
                                          "",
                                     t.translate(i18.measurementBook.projectDescription): value
                                              .contracts?[index]
                                              .additionalDetails
                                              ?.projectDesc ??
                                          "",
                                      t.translate(i18.measurementBook.cboName): value.contracts?[index]
                                              ?.additionalDetails?.cboName ??
                                          "",
                                      t.translate(i18.measurementBook.cboRole): value
                                              .contracts?[index]
                                              ?.additionalDetails
                                              ?.cboOrgNumber ??
                                          "",
                                      t.translate(i18.measurementBook.officerInChargeName): value
                                              .contracts?[index]
                                              .additionalDetails
                                              ?.officerInChargeName
                                              ?.name ??
                                          "NA",
                                      t.translate(i18.common.startDate): value.contracts?[index]
                                                  .startDate !=
                                              null
                                          ? DateFormat('dd/MM/yyyy').format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      value.contracts?[index]
                                                              .startDate! ??
                                                          0))
                                          : "NA",
                                      t.translate(i18.common.endDate): value
                                                  .contracts?[index].endDate !=
                                              null
                                          ? DateFormat('dd/MM/yyyy').format(
                                              DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      value.contracts?[index]
                                                              .endDate! ??
                                                          0))
                                          : "NA",
                                       t.translate(i18.measurementBook.workValue):
                                          NumberFormat('##,##,##,##,###')
                                              .format(value.contracts?[index]
                                                      ?.totalContractedAmount ??
                                                  0),
                                      t.translate(i18.common.status): t.translate(
                                          "WF_WORK_ORDER_STATE_${value.contracts?[index].wfStatus}")
                                    },
                                  );
                                },
                                childCount: value.isLoading
                                    ? value!.contracts!.length + 1
                                    : value!.contracts!.length,
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
