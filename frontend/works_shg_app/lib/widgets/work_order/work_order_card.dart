// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/widgets/molecules/mb/table_form_data.dart';

class WorkOrderCard extends StatefulWidget {
  final String? headLabel;
  final Map<String, dynamic> items;
  final Widget? widget1;
  final Widget? widget2;
  const WorkOrderCard({
    super.key,
    this.headLabel,
    required this.items,
    this.widget1,
    this.widget2,
  });

  @override
  State<WorkOrderCard> createState() => _WorkOrderCardState();
}

class _WorkOrderCardState extends State<WorkOrderCard> {
  String? data;

  @override
  Widget build(BuildContext context) {
    data = widget.items.remove("Status");
    return DigitCard(
      child: Column(
        crossAxisAlignment: widget.widget1 != null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.headLabel != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.headLabel!,
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.headlineMedium,
                    ),
                  ],
                )
              : const SizedBox.shrink(),
          TableFormCard(
            element: widget.items,
          ),
          data != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(
                        "Status",
                        style: DigitTheme
                            .instance.mobileTheme.textTheme.headlineSmall,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(width: 0),
                    Flexible(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 1.4),
                      child: Text(
                        data.toString(),
                        style: TextStyle(
                            color: DigitTheme
                                .instance.colorScheme.onSurfaceVariant),
                      ),
                    )),
                  ],
                )
              : const SizedBox.shrink(),
          widget.widget1 ?? const SizedBox.shrink(),
          widget.widget2 ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
