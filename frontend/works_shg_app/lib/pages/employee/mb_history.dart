import 'package:auto_route/auto_route.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_action_dialog.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/muster_rolls/get_muster_workflow.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';

import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/localization/localization.dart';
import '../../utils/common_methods.dart';
import '../../widgets/Back.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';
import '../../widgets/mb/float_action_card.dart';
import '../../widgets/mb/mb_detail_card.dart';
import '../../widgets/mb/text_button_underline.dart';
import '../../widgets/mb/workFlowButtonList.dart';
import 'mb_inbox.dart';

class MBHistoryBookPage extends StatefulWidget {
  final String contractNumber;
  final String mbNumber;
  final String? tenantId;
  const MBHistoryBookPage(
      {super.key,
      required this.contractNumber,
      required this.mbNumber,
      this.tenantId});

  @override
  State<MBHistoryBookPage> createState() => _MBHistoryBookPageState();
}

class _MBHistoryBookPageState extends State<MBHistoryBookPage> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () {
                return const SizedBox.shrink();
              },
              loaded: (value) {
                final k = value.data;
                return Scaffold(
                  bottomNavigationBar: BlocBuilder<MusterGetWorkflowBloc,
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
                                g,
                                widget.contractNumber,
                                widget.mbNumber,
                              );
                            },
                            totalAmountText: 'Total MB Amount',
                          );
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
                  body: CustomScrollView(
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
                                  widget: null,
                                  callback: () {
                                    context.router.pop();

                                    //Navigator.of(context).pop();
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "MB History",
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          height: 100,
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            final adjustedIndex = index + 1;
                            if (adjustedIndex < k.length) {
                              return CommonMBCard(
                                headLabel:
                                    "${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(k[adjustedIndex].startDate!))}-${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(k[adjustedIndex].endDate!))}",
                                items: {
                                  "MB number": k[adjustedIndex].mbNumber,
                                  "Date": DateFormat('dd/MM/yyyy').format(
                                      DateTime.fromMillisecondsSinceEpoch(
                                          k[adjustedIndex].entryDate!)),
                                  "MB Account":
                                      k[adjustedIndex].totalAmount != null
                                          ? double.parse(
                                              (k[adjustedIndex].totalAmount!)
                                                  .toStringAsFixed(2))
                                          : '0.0',
                                  "Status": k[adjustedIndex].wfStatus,
                                },
                                widget: CommonTextButtonUnderline(
                                  label: 'View Muster Roll',
                                  onPressed: () {},
                                ), show: false,
                              );
                            } else {
                              return null; // Return null for the skipped item
                            }
                          },
                          childCount: k.length - 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void _openBottomSheet(
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
