import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_detail_view.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/theme.dart';
import 'package:works_shg_app/widgets/mb/multi_line_items.dart';

import '../../models/employee/mb/filtered_Measures.dart';
import '../../utils/notifiers.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class HorizontalCardListDialog extends StatefulWidget {
  final List<FilteredMeasurementsMeasure>? lineItems;
  final int index;
  final String type;
  final dynamic noOfUnit;
  final dynamic cummulativePrevQty;
  final String sorId;

  const HorizontalCardListDialog(
      {super.key,
      this.lineItems,
      required this.index,
      required this.type,
      this.noOfUnit,
      this.cummulativePrevQty,
      required this.sorId});

  @override
  State<HorizontalCardListDialog> createState() =>
      _HorizontalCardListDialogState();
}

class _HorizontalCardListDialogState extends State<HorizontalCardListDialog> {
  late PageController _scrollController;
  List<FilteredMeasurementsMeasure>? lineItems;
  @override
  void initState() {
    lineItems = widget.lineItems;
    _scrollController = PageController(initialPage: 0);
    super.initState();
  }

  void _scrollForward() {
    _scrollController.animateTo(
      _scrollController.offset + MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollBackward() {
    _scrollController.animateTo(
      _scrollController.offset - MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocListener<MeasurementDetailBloc, MeasurementDetailState>(
      listenWhen: (previous, current) =>
          ((previous != current) || (previous == current)),
      listener: (context, state) {
        // TODO: implement listener
        state.maybeMap(
          orElse: () => null,
          loaded: (value) {
            if (value.warningMsg != null && value.qtyErrorMsg == 2) {
              // SystemChannels.textInput.invokeMethod('TextInput.hide');
              Notifiers.getToastMessage(context,
                  t.translate(i18.measurementBook.mbQtyErrMsg), 'ERROR');
              context
                  .read<MeasurementDetailBloc>()
                  .add(const UpdateMsgCodeEvent(updateCode: 1));
            } else if (value.qtyErrorMsg == 1) {
              // Navigator.of(context).pop();
            } else if (value.qtyErrorMsg == 0 || value.qtyErrorMsg == -2) {
              Navigator.of(context).pop();
            } else {
              // Navigator.of(context).pop();
            }
          },
        );
      },
      child: BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const SizedBox.shrink(),
            loaded: (value) {
              lineItems = widget.type == "sor"
                  ? value.sor![widget.index].filteredMeasurementsMeasure
                  : value.nonSor![widget.index].filteredMeasurementsMeasure;
              return Material(
                type: MaterialType.card,
                color: Colors.transparent,
                elevation: 0,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 2,
                  child: Column(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<MeasurementDetailBloc>()
                                  .add(CancelUpdateEvent(
                                    cancelUpdate: true,
                                    filteredMeasurementsMeasureId: null,
                                    sorId: widget.sorId,
                                    type: widget.type,
                                  ));
                              // context
                              //     .read<MeasurementDetailBloc>()
                              //     .add(const UpdateMsgCodeEvent(updateCode: 0));
                              context.router.pop();
                            },
                            icon: Icon(
                              Icons.close,
                              color: const DigitColors().white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.70,
                        child: PageView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return CardWidget(
                              backward: () {
                                _scrollBackward();
                              },
                              forward: () {
                                _scrollForward();
                              },
                              filteredMeasurementsMeasure: lineItems![index],
                              type: widget.type,
                              viewMode: value.viewStatus,
                              noOfUnit: widget.noOfUnit,
                              cummulativePrevQty: widget.cummulativePrevQty,
                              index: index,
                            );
                          },
                          itemCount: lineItems?.length,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: DigitOutLineButton(
                                    label: t.translate(i18.common.close),
                                    onPressed: () {
                                      context
                                          .read<MeasurementDetailBloc>()
                                          .add(CancelUpdateEvent(
                                            cancelUpdate: true,
                                            filteredMeasurementsMeasureId: null,
                                            sorId: widget.sorId,
                                            type: widget.type,
                                          ));
                                      context.router.pop();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //SubmitLineEvent
                                      context.read<MeasurementDetailBloc>().add(
                                          SubmitLineEvent(
                                              cummulativePrevQty:
                                                  widget.cummulativePrevQty,
                                              noOfUnit: widget.noOfUnit,
                                              sorId: widget.sorId,
                                              type: widget.type));
                                      // Navigator.of(context).pop();
                                    },
                                    child: Text(t.translate(i18.common.submit)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final VoidCallback backward;
  final VoidCallback forward;
  final FilteredMeasurementsMeasure? filteredMeasurementsMeasure;
  final String type;
  final bool viewMode;
  final dynamic noOfUnit;
  final dynamic cummulativePrevQty;
  final int index;

  const CardWidget({
    super.key,
    required this.backward,
    required this.forward,
    this.filteredMeasurementsMeasure,
    required this.type,
    required this.viewMode,
    this.noOfUnit,
    this.cummulativePrevQty,
    required this.index,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Container(
      // width: MediaQuery.sizeOf(context).width-200,
      decoration: BoxDecoration(
        color: const DigitColors().white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.type.toUpperCase(),
                  style: DigitTheme.instance.mobileTheme.textTheme.displayLarge,
                ),
                Text(
                  '${t.translate(i18.measurementBook.item)} ${widget.index + 1}',
                  style:
                      DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
                ),
                
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: SizedBox(
                    height: 30,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Text(
                              t.translate(i18.measurementBook.isDeduction),
                              style: theme.textTheme.displayMedium?.copyWith(),
                            )),
                        Expanded(
                          flex: 1,
                          child: Text(
                            (widget
                                            .filteredMeasurementsMeasure!
                                            .contracts!
                                            .first
                                            .estimates!
                                            .first
                                            .isDeduction !=
                                        null &&
                                    widget
                                        .filteredMeasurementsMeasure!
                                        .contracts!
                                        .first
                                        .estimates!
                                        .first
                                        .isDeduction!)
                                ? t.translate(i18.measurementBook.yes)
                                : t.translate(i18.measurementBook.no),
                            style: theme.textTheme.labelSmall?.copyWith(),
                            maxLines: 1,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            t.translate(
                              i18.measurementBook.description,
                            ),
                            style: theme.textTheme.displayMedium?.copyWith(),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            widget.filteredMeasurementsMeasure!.contracts!.first
                                    .estimates!.first.description ??
                                "",
                            style: theme.textTheme.labelSmall?.copyWith(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    child: (widget.filteredMeasurementsMeasure
                                    ?.measureLineItems ==
                                null ||
                            (widget.filteredMeasurementsMeasure!
                                .measureLineItems!.isEmpty))
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: MultiLineItems(
                                  fieldValue: (p0, p1) {},
                                  //
                                  height: widget
                                      .filteredMeasurementsMeasure?.height
                                      .toString(),
                                  width: widget
                                      .filteredMeasurementsMeasure?.breath
                                      .toString(),
                                  number: widget
                                      .filteredMeasurementsMeasure?.numItems
                                      .toString(),
                                  quantity: widget
                                      .filteredMeasurementsMeasure?.height
                                      .toString(),
                                  length: widget
                                      .filteredMeasurementsMeasure?.length
                                      .toString(),
                                  viewMode: widget.viewMode,
                                  filteredMeasurementMeasureId:
                                      widget.filteredMeasurementsMeasure!.id!,
                                  index: 0,
                                  measurementIndex: 0,
                                  sorId: widget.filteredMeasurementsMeasure!
                                      .contracts!.first.estimates!.first.sorId!,
                                  type: widget.type, totalCount: 1,
                                ),
                              ),
                              !widget.viewMode
                                  ? GestureDetector(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            size: 30,
                                            color: const DigitColors()
                                                .burningOrange,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:4.0),
                                            child: Text(
                                              
                                              t.translate(
                                                i18.measurementBook
                                                    .addMeasurement,
                                              ),
                                              style: DigitTheme
                                                  .instance
                                                  .mobileTheme
                                                  .textTheme!
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: const DigitColors()
                                                          .burningOrange,
                                                          
                                                          ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              AddToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: 0,
                                                measurementLineIndex: widget
                                                        .filteredMeasurementsMeasure!
                                                        .measureLineItems!
                                                        .last
                                                        .measurelineitemNo +
                                                    1,
                                                height: widget
                                                    .filteredMeasurementsMeasure
                                                    ?.height,
                                                length: widget
                                                    .filteredMeasurementsMeasure
                                                    ?.length,
                                                width: widget
                                                    .filteredMeasurementsMeasure
                                                    ?.breath,
                                                number: widget
                                                    .filteredMeasurementsMeasure
                                                    ?.numItems,
                                                quantity: widget
                                                    .filteredMeasurementsMeasure
                                                    ?.height,
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                single: true,
                                              ),
                                            );
                                      },
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          )
                        : ListView.builder(
                            itemCount: !widget.viewMode
                                ? widget.filteredMeasurementsMeasure!
                                        .measureLineItems!.length +
                                    1
                                : widget.filteredMeasurementsMeasure!
                                    .measureLineItems!.length,
                            itemBuilder: (context, index) {
                              if (!widget.viewMode) {
                                if (index ==
                                    widget.filteredMeasurementsMeasure!
                                        .measureLineItems!.length) {
                                  // TO add line items
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 1.0),
                                    child: GestureDetector(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add_circle,
                                            size: 30,
                                            color: const DigitColors()
                                                .burningOrange,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left:4.0),
                                            child: Text(
                                              t.translate(i18.measurementBook
                                                  .addMeasurement),
                                              style: DigitTheme
                                                  .instance
                                                  .mobileTheme
                                                  .textTheme!
                                                  .bodyLarge!
                                                  .copyWith(
                                                      color: const DigitColors()
                                                          .burningOrange),
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              AddToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex: widget
                                                        .filteredMeasurementsMeasure!
                                                        .measureLineItems!
                                                        .last
                                                        .measurelineitemNo +
                                                    1,
                                                // index: 0,
                                                //         measurementLineIndex: 0,
                                                height: 0,
                                                length: 0,
                                                width: 0,
                                                number: 0,
                                                quantity: 0,
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                single: false,
                                              ),
                                            );
                                      },
                                    ),
                                  );
                                }
                              }

                              final data = widget.filteredMeasurementsMeasure
                                  ?.measureLineItems?[index];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: MultiLineItems(
                                  fieldValue: (p0, p1) {
                                    print(widget.noOfUnit);
                                    print(widget.cummulativePrevQty);
                                    switch (p0) {
                                      case "Number":
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              UpdateToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex:
                                                    data!.measurelineitemNo!,
                                                height: data?.height.toString(),
                                                length: data?.length.toString(),
                                                width: data?.width.toString(),
                                                quantity:
                                                    data?.quantity.toString(),
                                                number: p1.toString(),
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                cummulativePrevQty:
                                                    widget.cummulativePrevQty,
                                                noOfUnit: widget.noOfUnit,
                                              ),
                                            );
                                        break;

                                      case "Length":
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              UpdateToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex:
                                                    data!.measurelineitemNo!,
                                                height: data?.height.toString(),
                                                length: p1.toString(),
                                                width: data?.width.toString(),
                                                quantity:
                                                    data?.quantity.toString(),
                                                number: data?.number.toString(),
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                cummulativePrevQty:
                                                    widget.cummulativePrevQty,
                                                noOfUnit: widget.noOfUnit,
                                              ),
                                            );
                                        break;
                                      case "Width":
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              UpdateToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex:
                                                    data!.measurelineitemNo!,
                                                height: data?.height.toString(),
                                                length: data?.length.toString(),
                                                width: p1.toString(),
                                                quantity:
                                                    data?.quantity.toString(),
                                                number: data?.number.toString(),
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                cummulativePrevQty:
                                                    widget.cummulativePrevQty,
                                                noOfUnit: widget.noOfUnit,
                                              ),
                                            );
                                        break;
                                      case "Quantity":
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              UpdateToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex:
                                                    data!.measurelineitemNo!,
                                                height: data?.height.toString(),
                                                length: data?.length.toString(),
                                                width: data?.width.toString(),
                                                quantity: p1.toString(),
                                                number: data?.number.toString(),
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                cummulativePrevQty:
                                                    widget.cummulativePrevQty,
                                                noOfUnit: widget.noOfUnit,
                                              ),
                                            );
                                        break;
                                      case "Height":
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              UpdateToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex:
                                                    data!.measurelineitemNo!,
                                                height: p1.toString(),
                                                length: data?.length.toString(),
                                                width: data?.width.toString(),
                                                quantity:
                                                    data?.quantity.toString(),
                                                number: data?.number.toString(),
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                cummulativePrevQty:
                                                    widget.cummulativePrevQty,
                                                noOfUnit: widget.noOfUnit,
                                              ),
                                            );
                                        break;
                                      default:
                                        context
                                            .read<MeasurementDetailBloc>()
                                            .add(
                                              UpdateToMeasurementLineEvent(
                                                sorId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .sorId!,
                                                type: widget
                                                    .filteredMeasurementsMeasure!
                                                    .contracts!
                                                    .first
                                                    .estimates!
                                                    .first
                                                    .category!,
                                                index: index,
                                                measurementLineIndex:
                                                    data!.measurelineitemNo!,
                                                height: data?.height.toString(),
                                                length: data?.length.toString(),
                                                width: data?.width.toString(),
                                                quantity:
                                                    data?.quantity.toString(),
                                                number: p1.toString(),
                                                filteredMeasurementMeasureId: widget
                                                    .filteredMeasurementsMeasure!
                                                    .id!,
                                                cummulativePrevQty:
                                                    widget.cummulativePrevQty,
                                                noOfUnit: widget.noOfUnit,
                                              ),
                                            );
                                    }
                                  },
                                  height: data == null
                                      ? widget
                                          .filteredMeasurementsMeasure?.height
                                          .toString()
                                      : data?.height.toString(),
                                  width: data == null
                                      ? widget
                                          .filteredMeasurementsMeasure?.breath
                                          .toString()
                                      : data?.width.toString(),
                                  number: data == null
                                      ? widget
                                          .filteredMeasurementsMeasure?.numItems
                                          .toString()
                                      : data?.number.toString(),
                                  quantity: data == null
                                      ? widget.filteredMeasurementsMeasure
                                          ?.currentValue
                                          .toString()
                                      : data?.quantity.toString(),
                                  length: data == null
                                      ? widget
                                          .filteredMeasurementsMeasure?.length
                                          .toString()
                                      : data?.length.toString(),
                                  viewMode: widget.viewMode,
                                  filteredMeasurementMeasureId:
                                      widget.filteredMeasurementsMeasure!.id!,
                                  index: index,
                                  measurementIndex: data!.measurelineitemNo!,
                                  sorId: widget.filteredMeasurementsMeasure!
                                      .contracts!.first.estimates!.first.sorId!,
                                  type: widget.type,
                                  totalCount: widget.filteredMeasurementsMeasure
                                          ?.measureLineItems?.length ??
                                      0,
                                ),
                              ); // Render your item here
                            },
                          ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2, color: const DigitColors().burningOrange)),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: const DigitColors().burningOrange,
                      ),
                      onPressed: widget.backward,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2, color: const DigitColors().burningOrange)),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: const DigitColors().burningOrange,
                      ),
                      onPressed: widget.forward,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
