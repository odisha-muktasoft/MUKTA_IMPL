import 'package:digit_components/theme/digit_theme.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:flutter/material.dart';

class FloatActionCard extends StatelessWidget {
  final VoidCallback openButtonSheet;
  final VoidCallback actions;
  final String totalAmountText;
  final String? subtext;
  final String amount;
  const FloatActionCard({super.key, required this.openButtonSheet, required this.actions, required this.totalAmountText,  this.subtext, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Card(
        // color: Colors.grey,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),

        //  margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Center(
                    child: SizedBox(
                      width: 100,
                      child: Divider(
                        thickness: 5,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: openButtonSheet,
                    child: Container(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 0.0),
                      // decoration: BoxDecoration(
                      //   border: Border.all(color: Colors.grey),
                      //   borderRadius: BorderRadius.circular(8),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: '$totalAmountText \n',
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineMedium,
                                children: <TextSpan>[
                                  TextSpan(
                                    text: subtext??"",
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.bodySmall,
                                  )
                                ]),
                          ),
                          Text(
                            amount,
                            style: DigitTheme
                                .instance.mobileTheme.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                  DigitElevatedButton(
                      onPressed: actions,
                      child: const Text("Actions")),
                ],
              ),
            )));
  }
}