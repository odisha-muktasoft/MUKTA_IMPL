import 'dart:async';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_detail_view.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/utils/constants.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class MultiLineItems extends StatefulWidget {
  final void Function(String?, dynamic) fieldValue;
  final String? number;
  final String? length;
  final String? width;
  final String? quantity;
  final String? height;
  final bool viewMode;
  final String sorId;
  final String type;
  final int index;
  final int measurementIndex;
  final String filteredMeasurementMeasureId;
  final int totalCount;

  const MultiLineItems({
    super.key,
    this.height,
    this.length,
    this.number,
    this.quantity,
    this.width,
    required this.fieldValue,
    required this.viewMode,
    required this.sorId,
    required this.type,
    required this.index,
    required this.measurementIndex,
    required this.filteredMeasurementMeasureId,
    required this.totalCount,
  });

  @override
  State<MultiLineItems> createState() => _MultiLineItemsState();
}

class _MultiLineItemsState extends State<MultiLineItems> {
  late TextEditingController numberController;
  late TextEditingController lengthController;
  late TextEditingController widthController;
  late TextEditingController heightController;
  late TextEditingController quantityController;
  late FocusNode numberFocusNode;
  late FocusNode lengthFocusNode;
  late FocusNode widthFocusNode;
  late FocusNode heightFocusNode;

  @override
  void initState() {
    super.initState();

    // Initialize text controllers and set initial values
    numberController = TextEditingController(
        text:checkValue(widget.number.toString())
            );
    lengthController = TextEditingController(
        text: checkValue(widget.length.toString())
            );
    widthController = TextEditingController(
        text: checkValue(widget.width.toString())
            );
    heightController = TextEditingController(
        text: checkValue(widget.height.toString()));

    quantityController = TextEditingController(
        text: checkValue(widget.quantity.toString())
            );

    numberController.addListener(numberUpload);
    lengthController.addListener(lengthUpload);
    widthController.addListener(widthUpload);
    heightController.addListener(heightUpload);

    numberFocusNode = FocusNode();
    lengthFocusNode = FocusNode();
    widthFocusNode = FocusNode();
    heightFocusNode = FocusNode();
  }

  String checkValue(String value) {
    switch (value) {
      case "0.0":
        return "";
      case "0":
        return "";
      case "0.000":
        return "";

      default:
        return value;
    }
  }

  void numberUpload() {
    final debouncer = Debouncer(milliseconds: 250);

    debouncer.run(() {
      widget.fieldValue("Number", numberController.text);
    });
  }

  void lengthUpload() {
    final debouncer = Debouncer(milliseconds: 250);
    debouncer.run(() {
      widget.fieldValue("Length", lengthController.text);
    });
  }

  void widthUpload() {
    final debouncer = Debouncer(milliseconds: 250);
    debouncer.run(() {
      widget.fieldValue("Width", widthController.text);
    });
  }

  void heightUpload() {
    final debouncer = Debouncer(milliseconds: 250);
    debouncer.run(() {
      widget.fieldValue("Height", heightController.text);
    });
  }

  @override
  void didUpdateWidget(covariant MultiLineItems oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!numberFocusNode.hasFocus && oldWidget.number != widget.number) {
      numberController.text = checkValue(widget.number.toString());
    }
    if (!lengthFocusNode.hasFocus && oldWidget.length != widget.length) {
      lengthController.text = checkValue(widget.length.toString());
    }
    if (!widthFocusNode.hasFocus && oldWidget.width != widget.width) {
      widthController.text =checkValue( widget.width.toString());
    }
    if (!heightFocusNode.hasFocus && oldWidget.height != widget.height) {
      heightController.text = checkValue(widget.height.toString());
    }
  }

  @override
  void dispose() {
    // Dispose text controllers
    numberController.removeListener(numberUpload);
    lengthController.removeListener(lengthUpload);
    widthController.removeListener(widthUpload);
    heightController.removeListener(heightUpload);

    numberController.dispose();
    lengthController.dispose();
    widthController.dispose();
    heightController.dispose();
    quantityController.dispose();

    numberFocusNode.dispose();
    lengthFocusNode.dispose();
    widthFocusNode.dispose();
    heightFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.totalCount != 1 && !widget.viewMode)
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        onPressed: () {
                          context
                              .read<MeasurementDetailBloc>()
                              .add(DeleteMeasurementLineEvent(
                                filteredMeasurementMeasureId:
                                    widget.filteredMeasurementMeasureId,
                                index: widget.index,
                                measurementLineIndex: widget.measurementIndex,
                                sorId: widget.sorId,
                                type: widget.type,
                              ));
                        },
                        icon: SvgPicture.asset(Constants.deleteIcon),
                        label: Text(t.translate(i18.measurementBook.delete)),
                      ),
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          DigitTextField(
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,4}')),
            ],
            textInputType: TextInputType.number,
            label: t.translate(i18.measurementBook.numberLabel),
            controller: numberController,
            focusNode: numberFocusNode,
            isDisabled: widget.viewMode,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,4}')),
                    ],
                    label: t.translate(i18.measurementBook.lengthLabel),
                    isDisabled: widget.viewMode,
                    textInputType: TextInputType.number,
                    controller: lengthController,
                    focusNode: lengthFocusNode,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,4}')),
                    ],
                    label: t.translate(i18.measurementBook.widthLabel),
                    isDisabled: widget.viewMode,
                    textInputType: TextInputType.number,
                    controller: widthController,
                    focusNode: widthFocusNode,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 4.0, right: 2.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d*\.?\d{0,4}')),
                    ],
                    label: t.translate(i18.measurementBook.heightLabel),
                    isDisabled: widget.viewMode,
                    textInputType: TextInputType.number,
                    controller: heightController,
                    focusNode: heightFocusNode,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  t.translate(i18.measurementBook.quantityLabel),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const DigitColors().cloudGray, width: 2),
                    color: DigitTheme.instance.colorScheme.background),
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    checkValue(
                      widget.quantity!.toString())==""?"":
                    double.parse(checkValue(
                      widget.quantity!.toString())).toStringAsFixed(4),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;
  Debouncer({required this.milliseconds});
  void run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
