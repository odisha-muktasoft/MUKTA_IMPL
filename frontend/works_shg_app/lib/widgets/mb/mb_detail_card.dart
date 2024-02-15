import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/router/app_router.dart';

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
          DigitTableCard(
            element: items,
          ),
         widget ?? DigitOutLineButton(
            label: "Open Measurement Book",
            onPressed: () {
              context.router.push(const MBDetailRoute());
            },
          )
        ],
      ),
    );
  }
}
