import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class CommonMBCard extends StatelessWidget {
  
  final String? headLabel;
  final Map<String, dynamic> items;
  final Widget? widget;
  const CommonMBCard(
      {super.key, this.headLabel, required this.items, this.widget});

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        crossAxisAlignment:widget!=null? CrossAxisAlignment.start:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          headLabel!=null?Text(headLabel!):const SizedBox.shrink(),
          DigitTableCard(
            element: items,
          ),
         widget ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
