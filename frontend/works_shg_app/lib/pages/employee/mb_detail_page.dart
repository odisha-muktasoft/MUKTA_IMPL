import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/widgets/mb/mb_detail_card.dart';

import '../../utils/common_methods.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';

class MBDetailPage extends StatefulWidget {
  const MBDetailPage({super.key});

  @override
  State<MBDetailPage> createState() => _MBDetailPageState();
}

class _MBDetailPageState extends State<MBDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

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
        
        bottomNavigationBar: floatActionMethod(context),
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
              Back(
                widget: null,
                callback: () {
                  context.router.navigateBack();
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Measurement Book",
                  style:
                      DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
                ),
              ),
              const DigitCard(
                padding: EdgeInsets.zero,
                child: ExpansionTile(
                  title: Text("Primary Details"),
                  children: [
                    CommonMBCard(items: {
                      "MB number": "MB-233",
                      "Project Description": "Wall Painting in Ward 1",
                      "Assignee": "SHG group-C#1",
                      "Workflow State": "Pending for verification",
                      "MB Account": "240000",
                      "SLA Days remaining": 2,
                    }),
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
              Card(
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.6,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      Center(child: Text('Screen for Tab 1')),
                      Center(child: Text('Screen for Tab 2')),
                      Center(child: Text('Screen for Tab 3')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card floatActionMethod(BuildContext context) {
    return Card(
        // color: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        //  margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                    child: SizedBox(
                      width: 100,
                      child:  Divider(
                        thickness: 5,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _openBottomSheet(context);
                    },
                    child: Container(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 0.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text:  TextSpan(
                                text: 'Total MB Amount \n',
                                
                                    style: DigitTheme
                            .instance.mobileTheme.textTheme.headlineMedium,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(For current entry)',
                                    style: DigitTheme.instance.mobileTheme.textTheme.bodySmall,
                                  )
                                ]),
                          ),
                          
                           Text('10000000.00',
                          style: DigitTheme
                            .instance.mobileTheme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DigitElevatedButton(
                      child: const Text("Actions"), onPressed: () {}),
                ],
              ),
            )));
  }

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
        height: 40,
        width: MediaQuery.sizeOf(context).width / 3,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.blue : Colors.black),
          borderRadius: BorderRadius.circular(1),
          color: isSelected ? Colors.blue.withOpacity(0.2) : Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
