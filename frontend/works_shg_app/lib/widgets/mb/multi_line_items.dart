import 'dart:async';

import 'package:digit_components/widgets/digit_text_field.dart';
import 'package:flutter/material.dart';
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

  @override
  void initState() {
    super.initState();

    // Initialize text controllers and set initial values
    numberController = TextEditingController(text: widget.number.toString());
    lengthController = TextEditingController(text: widget.length.toString());
    widthController = TextEditingController(text: widget.width.toString());
    heightController = TextEditingController(text: widget.height.toString());
    quantityController =
        TextEditingController(text: widget.quantity.toString());

    numberController.addListener(numberUpload);
    lengthController.addListener(lengthUpload);
    widthController.addListener(widthUpload);
    heightController.addListener(heightUpload);
  }

  void numberUpload() {
    final debouncer = Debouncer(milliseconds: 500);

    debouncer.run(() {
      widget.fieldValue(
          "Number", numberController.text == "" ? '0' : numberController.text);
    });
  }

  void lengthUpload() {
    final debouncer = Debouncer(milliseconds: 500);
    debouncer.run(() {
      widget.fieldValue(
          "Length", lengthController.text == "" ? '0' : lengthController.text);
    });
  }

  void widthUpload() {
    final debouncer = Debouncer(milliseconds: 500);
    debouncer.run(() {
      widget.fieldValue(
          "Width", widthController.text == "" ? '0' : widthController.text);
    });
  }

  void heightUpload() {
    final debouncer = Debouncer(milliseconds: 500);
    debouncer.run(() {
      widget.fieldValue(
          "Height", heightController.text == "" ? '0' : heightController.text);
    });
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
          (widget.totalCount != 1)
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
            textInputType: TextInputType.number,
            label: t.translate(i18.measurementBook.numberLabel),
            controller: numberController..text = widget.number.toString()..selection=TextSelection.collapsed(offset: numberController.text.length
                      ),
            isDisabled: widget.viewMode,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    label: t.translate(i18.measurementBook.lengthLabel),
                    isDisabled: widget.viewMode,
                    textInputType: TextInputType.number,
                    controller: lengthController
                      ..text = widget.length.toString()..selection=TextSelection.collapsed(offset: lengthController.text.length
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    label: t.translate(i18.measurementBook.widthLabel),
                    isDisabled: widget.viewMode,
                    textInputType: TextInputType.number,
                    controller: widthController..text = widget.width.toString()..selection=TextSelection.collapsed(offset: widthController.text.length
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    label: t.translate(i18.measurementBook.heightLabel),
                    isDisabled: widget.viewMode,
                    textInputType: TextInputType.number,
                    controller: heightController
                      ..text = widget.height.toString()..selection=TextSelection.collapsed(offset: heightController.text.length
                      ),
                  ),
                ),
              ),
            ],
          ),
          DigitTextField(
            label: t.translate(i18.measurementBook.quantityLabel),
            isDisabled: true,
            controller: quantityController..text = widget.quantity!..selection.end,
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
