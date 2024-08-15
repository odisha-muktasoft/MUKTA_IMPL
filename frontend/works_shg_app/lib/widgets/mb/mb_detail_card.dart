import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class CommonMBCard extends StatelessWidget {
  final String? headLabel;
  final Map<String, dynamic> items;
  final Widget? widget;
  final int? sla;
  final bool showSla;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool showStatus;
  final String status;
  const CommonMBCard({
    super.key,
    this.headLabel,
    required this.items,
    this.widget,
    this.sla,
    required this.showSla,
    this.padding,
    this.margin,
    required this.showStatus,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var t = AppLocalizations.of(context);
    return DigitCard(
      margin: margin,
      padding: padding,
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 0.0),
        child: Column(
          crossAxisAlignment: widget != null
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            headLabel != null
                ? Text(
                    headLabel!,
                    style: DigitTheme
                        .instance.mobileTheme.textTheme.headlineMedium,
                  )
                : const SizedBox.shrink(),
            DigitTableCard(
              padding: EdgeInsets.zero,
              element: items,
            ),
            showStatus
                ? Container(
                    margin: DigitTheme.instance.verticalMargin,
                    padding: const EdgeInsets.only(
                      bottom: 0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.81,
                          child: Text(
                            t.translate(i18.measurementBook.mbStatus),
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(width: 0),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 1.4),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 0, right: 12, top: 4, bottom: 4),
                            color: Colors.transparent,
                            child: Text(
                              status.toString(),
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.displaySmall!
                                  .copyWith(
                                color: const DigitColors().darkSpringGreen,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            showSla
                ? Container(
                    margin: DigitTheme.instance.verticalMargin,
                    padding: const EdgeInsets.only(bottom: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.81,
                          child: Text(
                            t.translate(i18.measurementBook.mbSlaDaysRemaining),
                            style: theme.textTheme.headlineSmall,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        const SizedBox(width: 0),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 1.4),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 4, bottom: 4),
                            color: sla! < 0
                                ? Colors.red.shade100
                                : const DigitColors().paleLeafGreen,
                            child: Text(
                              sla.toString(),
                              style: DigitTheme
                                  .instance.mobileTheme.textTheme.bodySmall!
                                  .copyWith(
                                color: sla! < 0
                                    ? const DigitColors().lavaRed
                                    : const DigitColors().darkSpringGreen,
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            widget ?? const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
