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
        children: [
          DigitTableCard(
            element: items,
          ),
          DigitOutLineButton(
            label: "Open Measurement Book",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
