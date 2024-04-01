import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/employee/mb/measurement_book.dart';
import 'package:works_shg_app/models/employee/mb/mb_inbox_response.dart'as statusMap;
import 'package:works_shg_app/router/app_router.dart';

import '../../blocs/wage_seeker_registration/wage_seeker_location_bloc.dart';
import '../../utils/common_methods.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';

class MBFilterPage extends StatefulWidget {
  const MBFilterPage({super.key});

  @override
  State<MBFilterPage> createState() => _MBFilterPageState();
}

class _MBFilterPageState extends State<MBFilterPage> {
  List<String> ward = []; // Initialize ward list
  List<statusMap.StatusMap> workflow = []; // Initialize workflow list
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MeasurementInboxBloc, MeasurementInboxState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loaded: (value) {
            return BlocBuilder<WageSeekerLocationBloc, WageSeekerLocationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                  loaded: (location) {
                    return Scaffold(
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
                      body: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ScrollableContent(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          footer: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: DigitOutLineButton(
                                    label: "Clear",
                                    onPressed: () {},
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: DigitElevatedButton(
                                    child: const Text("Filter"),
                                    onPressed: () {
                                      context.read<MeasurementInboxBloc>().add(
                                            MeasurementBookInboxSearchBlocEvent(
                                              ward: ward,
                                              status: workflow.map((e) => e.statusid!).toList(),
                                              projectId: null,
                                              mbNumber: null,
                                              projectName: null,
                                              limit: 10,
                                              offset: 0,
                                            ),
                                          );

                                          context.router.pop();
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      context.router.pop();
                                    },
                                    icon: const Icon(Icons.close)),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.filter_alt),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Filter",
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineLarge,
                                  ),
                                ),
                              ],
                            ),
                            const DigitTextField(label: "MB number"),
                            const DigitTextField(label: "Project ID"),
                            const DigitTextField(label: "Project Name"),
                            DigitDropdown(
                              onChanged: (value) {
                                setState(() {
                                  ward.add(value!);
                                });
                              },
                              value: ward.isNotEmpty ? ward.first : null,
                              label: "Ward",
                              menuItems: location!
                                  .tenantBoundaryList!.first.boundaryList!
                                  .map((e) => e.code.toString())
                                  .toList(),
                              valueMapper: (value) {
                                return value.toString();
                              },
                            ),
                            DigitDropdown<statusMap.StatusMap>(
                              onChanged: (value) {
                               // setState(() {
                                  workflow.add(value!);
                                // });
                              },
                              value: workflow.isNotEmpty ? workflow.first : null,
                              label: "Workflow States",
                              menuItems: value.mbInboxResponse.statusMap!
                                  .map((e) => e)
                                  .toList(),
                              valueMapper: (value) {
                                return value.state.toString();
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}

