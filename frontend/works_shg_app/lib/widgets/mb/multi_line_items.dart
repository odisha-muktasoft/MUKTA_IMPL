import 'dart:async';

import 'package:digit_components/widgets/digit_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_detail_view.dart';

class MultiLineItems extends StatefulWidget {
  final void Function(String?, dynamic) fieldValue;
  final String? number;
  final String? length;
  final String? width;
  final String? quantity;
  final String? height;

  const MultiLineItems({
    super.key,
    this.height,
    this.length,
    this.number,
    this.quantity,
    this.width,
    required this.fieldValue,
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
          DigitTextField(
            label: "Number",
            controller: numberController,
            isDisabled: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    label: "Length",
                    textInputType: TextInputType.number,
                    // controller: length
                    //   ..value
                    //   ..text =
                    //       (widget.filteredMeasurementsMeasure!.length ??
                    //               0.0,
                    //               )
                    //           .toString(),
                    controller: lengthController,
                    //         onChange: (value) {

                    //   widget.fieldValue("Length",value);
                    // },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    label: "Width",
                    textInputType: TextInputType.number,
                    // controller: width
                    //   ..value
                    //   ..text =
                    //       (widget.filteredMeasurementsMeasure!.breath ??
                    //               0.0)
                    //           .toString(),
                    controller: widthController,
                    //         onChange: (value) {

                    //   widget.fieldValue("Width",value);
                    // },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 0.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 3,
                  child: DigitTextField(
                    label: "Height",
                    textInputType: TextInputType.number,
                    // controller: height
                    //   ..value
                    //   ..text =
                    //       (widget.filteredMeasurementsMeasure!.height ??
                    //               0.0)
                    //           .toString(),
                    controller: heightController,
                    //         onChange: (value) {

                    //   widget.fieldValue("Height",value);
                    // },
                  ),
                ),
              ),
            ],
          ),
          DigitTextField(
            label: "Quantity",
            isDisabled: true,
            controller: quantityController..text=widget.quantity!,
            

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