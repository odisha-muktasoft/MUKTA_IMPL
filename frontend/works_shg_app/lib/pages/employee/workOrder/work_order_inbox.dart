import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/widgets/atoms/app_bar_logo.dart';
import 'package:works_shg_app/widgets/drawer_wrapper.dart';

import '../../../blocs/localization/app_localization.dart';
import '../../../utils/common_methods.dart';
import '../../../widgets/Back.dart';
import '../../../widgets/SideBar.dart';
import '../../../widgets/mb/mb_detail_card.dart';

class WorkOderInboxPage extends StatefulWidget {
  const WorkOderInboxPage({super.key});

  @override
  State<WorkOderInboxPage> createState() => _WorkOderInboxPageState();
}

class _WorkOderInboxPageState extends State<WorkOderInboxPage> {
  final ScrollController _scrollController = ScrollController();
  List<String> items = []; // List to hold items
  int pageCount = 1; // Initial page count
  bool isLoading = false; // Loading indicator

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    // Initial data
    _addInitialData();
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
      // Reach the end of the list
      _addRandomData();
    }
  }

  void _addInitialData() {
    // Generate initial data
    List<String> initialData =
        List.generate(20, (index) => "Initial Item ${index + 1}");
    setState(() {
      items.addAll(initialData); // Add initial data to the list
    });
  }

  void _addRandomData() {
    // Simulate loading
    setState(() {
      isLoading = true;
    });

    // Simulate delay
    Future.delayed(const Duration(seconds: 2), () {
      if (items.length>=27) {
         isLoading = false;
        return;
        
      }
      // Generate random data
      List<String> newData =
          List.generate(items.length==20?7:10, (index) => "Item ${items.length + index + 1}");
      setState(() {
        items.addAll(newData); // Add generated data to the list
        isLoading = false;
        pageCount++; // Increment page count
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return Scaffold(
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
          body: false
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverPersistentHeader(
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
                                  context.router.navigateBack();
                                  // Navigator.of(context).pop();
                                  //context.router.push(const HomeRoute());
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "WorkOrder Inbox(2)",
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
                                        icon: const Icon(Icons.sort_outlined)),
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
                          // Display items
                          if (index == items.length && index<27) {
                            // Display loading indicator
                            return Container(
                              padding: const EdgeInsets.all(16.0),
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            );
                          }

                          return CommonMBCard(
                            widget: DigitOutLineButton(
                              label: "Open Measurement Book",
                              onPressed: () {
                                context.router.push(const MBDetailRoute());
                              },
                            ),
                            items: {
                              "MB number": "MB-233",
                              "Project Description": "Wall Painting in Ward 1",
                              "Assignee": "SHG group-C#1",
                              "Workflow State": "Pending for verification",
                              "MB Account": "240000",
                              "SLA Days remaining": index + 1
                            },
                          );
                        },
                        childCount: items.length +
                            1, // Number of items in the list + 1 for loading indicator
                      ),
                    ),
                  ],
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
