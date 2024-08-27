import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  static getItemWidget(BuildContext context,
      {String title = '',
      String description = '',
      String subtitle = '',
      Color? descColor}) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: (Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.only(right: 16),
                width: MediaQuery.of(context).size.width > 720
                    ? MediaQuery.of(context).size.width / 3.5
                    : MediaQuery.of(context).size.width / 3.5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      subtitle.trim.toString() != ''
                          ? Text(
                              subtitle,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColorLight),
                            )
                          : const Text('')
                    ])),
            SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: descColor ??
                          Theme.of(context).colorScheme.onBackground),
                  textAlign: TextAlign.left,
                ))
          ],
        )));
  }

  static Widget downloadButton(String label, void Function()? onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 8.0),
      // child: TextButton.icon(
      //     onPressed: onPressed,
      //     icon: Icon(
      //       Icons.download_sharp,
      //       color: const DigitColors().burningOrange,
      //     ),
      //     label: Text(
      //       label,
      //       style: TextStyle(color: const DigitColors().burningOrange,),
      //     )),

      child: Button(
        prefixIcon: Icons.download_sharp,
        mainAxisSize: MainAxisSize.min,
        type: ButtonType.tertiary,
        size: ButtonSize.large,
        label: label,
        onPressed: onPressed!,
      ),
    );
  }
}
