import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:works_shg_app/blocs/employee/mb/project_type.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/constants.dart';
import 'package:works_shg_app/utils/employee/mb/mb_logic.dart';
import 'package:works_shg_app/utils/employee/support_services.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/widgets/atoms/app_bar_logo.dart';
import 'package:works_shg_app/widgets/atoms/empty_image.dart';
import 'package:works_shg_app/widgets/drawer_wrapper.dart';

import '../../blocs/employee/mb/measurement_book.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/wage_seeker_registration/wage_seeker_location_bloc.dart';
import '../../utils/common_methods.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/mb/mb_detail_card.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class MeasurementBookInboxPage extends StatefulWidget {
  const MeasurementBookInboxPage({super.key});

  @override
  State<MeasurementBookInboxPage> createState() =>
      _MeasurementBookInboxPageState();
}

class _MeasurementBookInboxPageState extends State<MeasurementBookInboxPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = []; // List to hold items
  int pageCount = 0; // Initial page count
  bool isLoading = false; // Loading indicator

  @override
  void initState() {
     context
        .read<ProjectTypeBloc>()
        .add(ProjectTypeEvent(tenantId: GlobalVariables.tenantId!));
        
    context.read<MeasurementInboxBloc>().add(
          MeasurementBookInboxBlocEvent(
            businessService: "MB",
            limit: 10,
            moduleName: 'measurement-module',
            offset: pageCount,
            tenantId: GlobalVariables.tenantId!,
          ),
        );

        

    context.read<WageSeekerLocationBloc>().add(
          LocationEventWageSeeker(tenantId: GlobalVariables.tenantId!),
        );
    _scrollController.addListener(_scrollListener);

    super.initState();
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
    final state = context.read<MeasurementInboxBloc>().state;
    state.maybeMap(
      orElse: () => {},
      loaded: (value) {
        if (value.search && value.data.length==1) {
          context.read<MeasurementInboxBloc>().add(
                MeasurementBookInboxSearchRepeatBlocEvent(
                  businessService: "MB",
                  limit: 10,
                  moduleName: 'measurement-module',
                  offset: value.data['inbox']!['offset']+10,
                  tenantId: GlobalVariables.tenantId!,
                ),
              );
        } else {
          context.read<MeasurementInboxBloc>().add(
                MeasurementBookInboxBlocEvent(
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

    setState(() {
      pageCount = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, localizationState) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          backgroundColor: const DigitColors().seaShellGray,
          floatingActionButton:
              BlocBuilder<MeasurementInboxBloc, MeasurementInboxState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox.shrink();
                },
                loaded: (value) {
                  if (value.mbInboxResponse.items!.length > 19) {
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
          body: BlocBuilder<MeasurementInboxBloc, MeasurementInboxState>(
            builder: (context, state) {
              return state.maybeMap(
                orElse: () {
                  return const SizedBox.shrink();
                },
                loaded: (mbInboxResponse) {
                  return CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverPersistentHeader(
                        floating: true,
                        pinned: true,
                        delegate: MyHeaderDelegate(
                          child: Container(
                            color: const DigitColors().seaShellGray,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Back(
                                  // widget: null,
                                  callback: () {
                                    context.router.pop();
                                    // Navigator.of(context).pop();
                                    //context.router.push(const HomeRoute());
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 17.0),
                                  child: Text(
                                    "${t.translate(i18.measurementBook.mbInbox)} (${mbInboxResponse.mbInboxResponse.totalCount ?? 0})",
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineLarge,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0, right: 8.0, top: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            pageCount = 0;
                                          });
                                          context.router
                                              .push(const MBFilterRoute());
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextButton.icon(
                                                label: Text(
                                                  t.translate(
                                                      i18.common.filter),
                                                  style: DigitTheme
                                                      .instance
                                                      .mobileTheme
                                                      .textTheme
                                                      .labelLarge!
                                                      .copyWith(
                                                    color: const DigitColors()
                                                        .burningOrange,
                                                  ),
                                                  textDirection:
                                                      TextDirection.ltr,
                                                ),
                                                onPressed: () {
                                                  context.router.push(
                                                      const MBFilterRoute());
                                                },
                                                icon: const Icon(
                                                  Icons.filter_alt,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                )),
                                            mbInboxResponse.search
                                                ? IconButton(
                                                    onPressed: () {
                                                      pageCount = 0;
                                                      context
                                                          .read<
                                                              MeasurementInboxBloc>()
                                                          .add(
                                                            MeasurementBookInboxBlocEvent(
                                                              businessService:
                                                                  "MB",
                                                              limit: 10,
                                                              moduleName:
                                                                  'measurement-module',
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
                                          ],
                                        ),
                                      ),
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
                                            Conversion.openSortingModal(context,
                                                listData: Conversion.sortMB,
                                                sortType: SortType.mbSort);
                                          },
                                          icon:
                                              SvgPicture.asset(Constants.sort)),

                                      // Row(
                                      //   children: [
                                      //     IconButton(
                                      //         color: const DigitColors()
                                      //             .burningOrange,
                                      //         onPressed: () {
                                      //           _openSortingModal();
                                      //         },
                                      //         icon: SvgPicture.asset(Constants.sort)),
                                      //     Text(
                                      //       "Sort",
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
                      mbInboxResponse!.mbInboxResponse.items!.isEmpty
                          ? SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  // Display items

                                  return  Center(
                                    child: EmptyImage(
                                      align: Alignment.center,
                                      label: t.translate(i18.measurementBook.mbNotFound),
                                    ),
                                  );
                                },
                                childCount: 1,
                              ),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  // Display items
                                  if (index ==
                                          (mbInboxResponse.isLoading
                                              ? mbInboxResponse.mbInboxResponse!
                                                  .items!.length
                                              : mbInboxResponse.mbInboxResponse!
                                                      .items!.length -
                                                  1) &&
                                      mbInboxResponse.isLoading) {
                                    // Display loading indicator
                                    return Container(
                                      padding: const EdgeInsets.all(16.0),
                                      alignment: Alignment.center,
                                      child: const CircularProgressIndicator(),
                                    );
                                  }

                                  return CommonMBCard(
                                    widget: Center(
                                      child: SizedBox(
                                        width: MediaQuery.sizeOf(context).width,
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                              width: 1.0,
                                              color: const DigitColors()
                                                  .burningOrange,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          child: Text(t.translate(
                                              i18.measurementBook.openMbBook)),
                                          onPressed: () {
                                            final contract = mbInboxResponse
                                                    .mbInboxResponse
                                                    .items?[index]
                                                    .businessObject
                                                    ?.contract
                                                    ?.contractNumber ??
                                                "";
                                            final mbNumber = mbInboxResponse
                                                    .mbInboxResponse
                                                    .items?[index]
                                                    .businessObject
                                                    ?.measurementNumber ??
                                                "";
                                            context.router.push(MBDetailRoute(
                                              contractNumber: contract,
                                              mbNumber: mbNumber,
                                              tenantId:
                                                  GlobalVariables.tenantId,
                                              type: MBScreen.update,
                                            ));
                                          },
                                        ),
                                      ),
                                    ),
                                    items: {
                                      t.translate(i18.measurementBook.mbNumber):
                                          mbInboxResponse
                                                  .mbInboxResponse
                                                  .items?[index]
                                                  .businessObject
                                                  ?.measurementNumber ??
                                              "",
                                      t.translate(i18.measurementBook
                                          .projectDescription): mbInboxResponse
                                              .mbInboxResponse
                                              .items?[index]
                                              .businessObject
                                              ?.contract
                                              ?.additionalDetails
                                              ?.projectDesc ??
                                          "",
                                      t.translate(i18.common.assignee):
                                          mbInboxResponse
                                                  .mbInboxResponse
                                                  .items?[index]
                                                  .processInstance
                                                  ?.assignes
                                                  ?.first
                                                  .name ??
                                              "NA",
                                      t.translate(i18.measurementBook
                                          .workflowState): mbInboxResponse
                                                  .mbInboxResponse
                                                  .items?[index]
                                                  .processInstance
                                                  ?.state
                                                  ?.state !=
                                              null
                                          ? t.translate(
                                              "MB_WFMB_STATE_${mbInboxResponse.mbInboxResponse.items![index].processInstance!.state!.state!}")
                                          : "",
                                      t.translate(i18.measurementBook.mbAmount):
                                          mbInboxResponse
                                                  .mbInboxResponse
                                                  .items?[index]
                                                  .businessObject
                                                  ?.measurementAdditionalDetail
                                                  ?.totalAmount
                                                  ?.roundToDouble()
                                                  .toStringAsFixed(2) ??
                                              "0.00"
                                    },
                                    show: true,
                                    sla: mbInboxResponse
                                            .mbInboxResponse
                                            .items?[index]
                                            .businessObject
                                            ?.serviceSla ??
                                        0,
                                  );
                                },
                                childCount: mbInboxResponse.isLoading
                                    ? mbInboxResponse!
                                            .mbInboxResponse.items!.length +
                                        1
                                    : mbInboxResponse!
                                        .mbInboxResponse.items!.length,
                              ),
                            ),
                    ],
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
    );
  }

  // TODO:[unused code]

  // Future<dynamic> filterDialog(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         titlePadding: EdgeInsets.zero,
  //         insetPadding: EdgeInsets.only(top: AppBar().preferredSize.height),
  //         title: const Text("sd"),
  //         contentPadding: EdgeInsets.zero,
  //         content: Card(
  //           child: SizedBox(
  //             height: double.maxFinite,
  //             width: MediaQuery.of(context).size.width,
  //             child: const Center(
  //               child: Text("Loading"),
  //             ),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
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
    return true;
  }
}
