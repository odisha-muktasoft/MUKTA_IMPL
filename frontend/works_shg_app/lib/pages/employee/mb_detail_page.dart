import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/widgets/mb/mb_detail_card.dart';

import '../../utils/common_methods.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';
import '../../widgets/mb/float_action_card.dart';
import '../../widgets/mb/sor_item_add_mb.dart';
import '../../widgets/mb/text_button_underline.dart';

class MBDetailPage extends StatefulWidget {
  const MBDetailPage({super.key});

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
  @override
  void initState() {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: FloatActionCard(actions: () { 
           context.router.push(const MBTypeConfirmationRoute());
         }, amount: '10000000', openButtonSheet: () {
          _openBottomSheet(context);
          }, totalAmountText: 'Total MB Amount',subtext: '(For Current Entry)',),
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
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Back(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Measurement Book",
                  style:
                      DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
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
                    style:
                        DigitTheme.instance.mobileTheme.textTheme.headlineSmall,
                  ),
                  children: [
                    CommonMBCard(
                      items: const {
                        "MB number": "MB-233",
                        "Project Description": "Wall Painting in Ward 1",
                        "Assignee": "SHG group-C#1",
                        "Workflow State": "Pending for verification",
                        "MB Account": "240000",
                        "SLA Days remaining": 2,
                      },
                      widget: CommonTextButtonUnderline(
                        label: 'View MB History',
                        onPressed: () {
                          context.router.push(const MBHistoryBookRoute());
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
                height: tabViewHeight(),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    sor == 0
                        ? const Card(
                            child: Center(child: Text("No Data Found")),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return sorCard(index);
                            },
                            itemCount: sor,
                          ),
                    nsor == 0
                        ? const Card(
                            child: Center(child: Text("No Data Found")),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return sorCard(index);
                            },
                            itemCount: nsor,
                          ),
                    phots == 0
                        ? const Card(
                            child: Center(child: Text("No Data Found")),
                          )
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return sorCard(index);
                            },
                            itemCount: phots,
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double tabViewHeight() {
    switch (_tabController.index) {
      case 0:
        return sor == 0 ? 300 : sor * 500;
      case 1:
        return nsor == 0 ? 300 : nsor * 500;
      case 2:
        return phots == 0 ? 300 : phots * 500;
      default:
        return 300.0;
    }
  }

  Card sorCard(int index) {
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
              const SORTableCard(
                element: {
                  "Description":
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                  "Unit": "10",
                  "Rate(rs)": "2400000",
                  "Approved Quantity": "240",
                  "Consumed Quantity\n(Upto previous entry)": "20",
                },
              ),
              DigitTextField(
                label: "Current Measurement Book Entry",
                suffixIcon: GestureDetector(
                  onTap: () {
                    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("data")));

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const HorizontalCardListDialog();
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
              const DigitTextField(
                label: "Amount for Current Entry",
                isDisabled: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card floatActionMethod(BuildContext context) {
  //   return Card(
  //       // color: Colors.grey,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(20),
  //           topRight: Radius.circular(20),
  //         ),
  //       ),

  //       //  margin: const EdgeInsets.symmetric(horizontal: 8),
  //       child: SizedBox(
  //           height: 160,
  //           child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Center(
  //                   child: SizedBox(
  //                     width: 100,
  //                     child: Divider(
  //                       thickness: 5,
  //                     ),
  //                   ),
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     _openBottomSheet(context);
  //                   },
  //                   child: Container(
  //                     height: 80,
  //                     width: MediaQuery.sizeOf(context).width,
  //                     padding: const EdgeInsets.symmetric(
  //                         horizontal: 16, vertical: 0.0),
  //                     // decoration: BoxDecoration(
  //                     //   border: Border.all(color: Colors.grey),
  //                     //   borderRadius: BorderRadius.circular(8),
  //                     // ),
  //                     child: Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         RichText(
  //                           text: TextSpan(
  //                               text: 'Total MB Amount \n',
  //                               style: DigitTheme.instance.mobileTheme.textTheme
  //                                   .headlineMedium,
  //                               children: <TextSpan>[
  //                                 TextSpan(
  //                                   text: '(For current entry)',
  //                                   style: DigitTheme.instance.mobileTheme
  //                                       .textTheme.bodySmall,
  //                                 )
  //                               ]),
  //                         ),
  //                         Text(
  //                           '10000000.00',
  //                           style: DigitTheme
  //                               .instance.mobileTheme.textTheme.headlineMedium,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 DigitElevatedButton(
  //                     child: const Text("Actions"), onPressed: () {}),
  //               ],
  //             ),
  //           )));
  // }

  void _openBottomSheet(BuildContext context) {
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
                      "78765873456",
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
                      "78765873456",
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
                                "1232445777",
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
