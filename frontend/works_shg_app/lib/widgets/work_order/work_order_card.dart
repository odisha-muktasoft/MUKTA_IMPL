import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class WorkOrderCard extends StatelessWidget {
  final String? headLabel;
  final Map<String, dynamic> items;
  final Widget? widget1;
  final Widget? widget2;
  const WorkOrderCard({super.key, this.headLabel, required this.items, this.widget1, this.widget2});

  @override
  Widget build(BuildContext context) {
    return DigitCard(
      child: Column(
        crossAxisAlignment:widget1!=null? CrossAxisAlignment.start:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          headLabel!=null?Text(headLabel!):const SizedBox.shrink(),
          DigitTableCard(
            element: items,
          ),
         widget1 ?? const SizedBox.shrink(),
         widget2?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}