import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  final int decimalRange;

  DecimalTextInputFormatter({required this.decimalRange})
      : assert(decimalRange > 0);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (text == '') {
      return newValue;
    }

    // Regex to match a number with up to `decimalRange` decimal places.
    RegExp regExp = RegExp(r'^\d*\.?\d{0,' + decimalRange.toString() + r'}$');

    if (regExp.hasMatch(text)) {
      return newValue;
    }

    return oldValue;
  }
}
