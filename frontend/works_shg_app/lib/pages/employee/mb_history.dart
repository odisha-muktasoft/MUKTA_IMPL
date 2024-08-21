import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/atoms/digit_action_dialog.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_ui_components/digit_components.dart' as ui_component;
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/ComponentTheme/button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/atoms/label_value_list.dart';
import 'package:digit_ui_components/widgets/atoms/text_chunk.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:works_shg_app/blocs/muster_rolls/get_muster_workflow.dart';
import 'package:works_shg_app/models/muster_rolls/muster_workflow_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/widgets/mb/back_button.dart';

import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/localization/localization.dart';
import '../../utils/common_methods.dart';
import '../../utils/employee/mb/mb_logic.dart';
import '../../widgets/back.dart';
import '../../widgets/side_bar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';
import '../../widgets/mb/float_action_card.dart';
import '../../widgets/mb/mb_detail_card.dart';
import '../../widgets/mb/text_button_underline.dart';
import '../../widgets/mb/work_flow_button_list.dart';
import 'mb_inbox.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

@RoutePage()
class MBHistoryBookPage extends StatefulWidget {
  final String contractNumber;
  final String mbNumber;
  final String? tenantId;
  final MBScreen type;
  const MBHistoryBookPage(
      {super.key,
      required this.contractNumber,
      required this.mbNumber,
      this.tenantId,
      required this.type});

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
                final k = value.data
                    .where((element) => element.wfStatus == "APPROVED")
                    .toList();
                return Scaffold(
                  bottomNavigationBar: widget.type == MBScreen.create
                      ? const SizedBox.shrink()
                      : BlocBuilder<MusterGetWorkflowBloc,
                          MusterGetWorkflowState>(
                          builder: (context, state) {
                            return state.maybeMap(
                              orElse: () => const SizedBox.shrink(),
                              loaded: (mbWorkFlow) {
                                final g = mbWorkFlow
                                    .musterWorkFlowModel?.processInstances;
                                return Draggable(
                                  childWhenDragging: FloatActionCard(
                                    actions: () {
                                      showDialog(
                                       context: context,
                                        builder:(context)=> CommonButtonCard(
                                          g: g,
                                          contractNumber: widget.contractNumber,
                                          mbNumber: widget.mbNumber,
                                          type: widget.type,
                                        ),
                                      );
                                    },
                                    amount: value.data.first.totalAmount != null
                                        ? value.data.first.totalAmount!
                                            .roundToDouble()
                                            .toStringAsFixed(2)
                                        : "0.00",
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
                                          (g != null &&
                                                  (g.first.nextActions !=
                                                          null &&
                                                      g.first.nextActions!
                                                          .isEmpty))
                                              ? false
                                              : true);
                                    },
                                    totalAmountText: t.translate(
                                        i18.measurementBook.totalMbAmount),
                                    showAction: (g != null &&
                                            (g.first.nextActions != null &&
                                                g.first.nextActions!.isEmpty))
                                        ? false
                                        : true,
                                  ),
                                  onDragEnd: (details) {
                                    _openBottomSheet(
                                        t,
                                        context,
                                        value.data.first.totalSorAmount!,
                                        value.data.first.totalNorSorAmount!,
                                        value.data.first.totalAmount!,
                                        g,
                                        widget.contractNumber,
                                        widget.mbNumber,
                                        (g != null &&
                                                (g.first.nextActions != null &&
                                                    g.first.nextActions!
                                                        .isEmpty))
                                            ? false
                                            : true);
                                  },
                                  feedback: const SizedBox.shrink(),
                                  child: FloatActionCard(
                                    actions: () {
                                      showDialog(
                                       context: context,
                                        builder:(context)=> CommonButtonCard(
                                          g: g,
                                          contractNumber: widget.contractNumber,
                                          mbNumber: widget.mbNumber,
                                          type: widget.type,
                                        ),
                                      );
                                    },
                                    amount: value.data.first.totalAmount != null
                                        ? value.data.first.totalAmount!
                                            .roundToDouble()
                                            .toStringAsFixed(2)
                                        : "0.00",
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
                                          (g != null &&
                                                  (g.first.nextActions !=
                                                          null &&
                                                      g.first.nextActions!
                                                          .isEmpty))
                                              ? false
                                              : true);
                                    },
                                    totalAmountText: t.translate(
                                        i18.measurementBook.totalMbAmount),
                                    showAction: (g != null &&
                                            (g.first.nextActions != null &&
                                                g.first.nextActions!.isEmpty))
                                        ? false
                                        : true,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                  backgroundColor: const DigitColors().seaShellGray,
                  appBar: AppBar(
                    backgroundColor: const Color(0xff0B4B66),
                    iconTheme: DigitTheme.instance.mobileTheme.iconTheme
                        .copyWith(color: const DigitColors().white),
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 0.0,
                                      bottom: 0.0,
                                      top: 8.0,
                                      right: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: BackNavigationButton(
                                          backNavigationButtonThemeData:
                                              const BackNavigationButtonThemeData()
                                                  .copyWith(
                                            textColor: Theme.of(context)
                                                .colorTheme
                                                .primary
                                                .primary2,
                                            contentPadding: EdgeInsets.zero,
                                            context: context,
                                          ),
                                          backButtonText: AppLocalizations.of(
                                                      context)
                                                  .translate(i18.common.back) ??
                                              'Back',
                                          handleBack: () {
                                            context.router.maybePopTop();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextChunk(
                                    heading: t.translate(
                                        i18.measurementBook.mbHistory),
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
                            final adjustedIndex =
                                widget.type == MBScreen.update ? index : index;
                            if (adjustedIndex <= k.length) {
                              return DigitCard(
                                padding: const EdgeInsets.only(
                                  left: 4.0,
                                  bottom: 8.0,
                                  right: 4.0,
                                  top: 8.0,
                                ),
                                margin: const EdgeInsets.all(8.0),
                                cardType: CardType.primary,
                                children: [
                                  LabelValueList(
                                      padding: const EdgeInsets.only(
                                        left: 4.0,
                                        bottom: 8.0,
                                        right: 4.0,
                                        top: 8.0,
                                      ),
                                      heading:
                                          "${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(k[adjustedIndex].startDate!))} - ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(k[adjustedIndex].endDate!))}",
                                      maxLines: 3,
                                      labelFlex: 5,
                                      valueFlex: 5,
                                      items: [
                                        LabelValuePair(
                                            label: t.translate(
                                                i18.measurementBook.mbNumber),
                                            value: k[adjustedIndex].mbNumber ??
                                                ""),
                                        LabelValuePair(
                                            label: t.translate(i18.common.date),
                                            value: DateFormat('dd/MM/yyyy')
                                                .format(DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        k[adjustedIndex]
                                                            .entryDate!))),
                                        LabelValuePair(
                                            label: t.translate(
                                                i18.measurementBook.mbAmount),
                                            value: k[adjustedIndex]
                                                        .totalAmount !=
                                                    null
                                                ? double.parse((k[adjustedIndex]
                                                            .totalAmount!)
                                                        .toString())
                                                    .toStringAsFixed(2)
                                                : '0.00'),
                                        LabelValuePair(
                                            label: t.translate(
                                                i18.measurementBook.mbStatus),
                                            value: k[adjustedIndex].wfStatus ??
                                                ""),
                                      ]),
                                  (k[adjustedIndex].musterRollNumber == null ||
                                          k[adjustedIndex]
                                                  .musterRollNumber
                                                  .toString() ==
                                              "")
                                      ? const SizedBox.shrink()
                                      : Button(
                                          suffixIcon:
                                              Icons.arrow_forward_outlined,
                                          label:
                                              t.translate(i18.home.musterRoll),
                                          onPressed: () {
                                            context.router
                                                .push(MBMusterScreenRoute(
                                              musterRollNumber: k[adjustedIndex]
                                                  .musterRollNumber
                                                  .toString(),
                                              tenantId: widget.tenantId!,
                                            ));
                                          },
                                          type: ButtonType.link,
                                          size: ButtonSize.medium),
                                ],

                                // showSla: false, showStatus: true, status: k[adjustedIndex].wfStatus??'',
                              );
                            } else {
                              return null; // Return null for the skipped item
                            }
                          },
                          childCount: widget.type == MBScreen.update
                              ? k.length
                              : k.length,
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
    AppLocalizations t,
    BuildContext context,
    double totalSorAmount,
    double totalNonSorAmount,
    double mbAmount,
    List<ProcessInstances>? processInstances,
    String contractNumber,
    String mbNumber,
    bool showBtn,
  ) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, top: 16.0, bottom: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Center(
                child: SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 5,
                  ),
                ),
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
                      // "Total SOR Amount",
                      t.translate(i18.measurementBook.totalSorAmount),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                    subtitle: Text(
                      t.translate(i18.measurementBook.forCurrentEntry),
                      style:
                          DigitTheme.instance.mobileTheme.textTheme.bodySmall,
                    ),
                    trailing: Text(
                      totalSorAmount.toDouble().toStringAsFixed(2),
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
                      t.translate(i18.measurementBook.forCurrentEntry),
                      style:
                          DigitTheme.instance.mobileTheme.textTheme.bodySmall,
                    ),
                    trailing: Text(
                      totalNonSorAmount.toDouble().toStringAsFixed(2),
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
                //  height: 80,
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
                                mbAmount.roundToDouble().toStringAsFixed(2),
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
              showBtn
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: ui_component.Button(
                        mainAxisSize: MainAxisSize.max,
                        label: t.translate(i18.measurementBook.mbAction),
                        onPressed: () {
                          Navigator.of(context).pop();
                          showDialog(
                           context: context,
                            builder:(context)=> CommonButtonCard(
                              g: processInstances,
                              contractNumber: contractNumber,
                              mbNumber: mbNumber,
                              type: widget.type,
                            ),
                          );
                        },
                        type: ButtonType.primary,
                        size: ButtonSize.large,
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
