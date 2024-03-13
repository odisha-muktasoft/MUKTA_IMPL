import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:works_shg_app/widgets/mb/multi_line_items.dart';

import '../../models/employee/mb/filtered_Measures.dart';

class HorizontalCardListDialog extends StatefulWidget {
  final List<FilteredMeasurementsMeasure>? lineItems;
  const HorizontalCardListDialog({super.key, this.lineItems});

  @override
  State<HorizontalCardListDialog> createState() =>
      _HorizontalCardListDialogState();
}

class _HorizontalCardListDialogState extends State<HorizontalCardListDialog> {
  late PageController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = PageController();
  }

  void _scrollForward() {
    _scrollController.animateTo(
      _scrollController.offset + MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollBackward() {
    _scrollController.animateTo(
      _scrollController.offset - MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      color: Colors.transparent,
      elevation: 0,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 2,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    context.router.pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: const DigitColors().white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.70,
              child: PageView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    backward: () {
                      _scrollBackward();
                    },
                    forward: () {
                      _scrollForward();
                    },
                    filteredMeasurementsMeasure: widget.lineItems![index],
                  );
                },
                itemCount: widget.lineItems?.length,
              ),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.white,
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DigitOutLineButton(
                          label: "Close",
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatefulWidget {
  final VoidCallback backward;
  final VoidCallback forward;
  final FilteredMeasurementsMeasure? filteredMeasurementsMeasure;

  const CardWidget(
      {super.key,
      required this.backward,
      required this.forward,
      this.filteredMeasurementsMeasure});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  final TextEditingController number = TextEditingController();
  final TextEditingController length = TextEditingController();
  final TextEditingController width = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    number.dispose();
    length.dispose();
    width.dispose();
    height.dispose();
    quantity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.sizeOf(context).width-200,
      decoration: BoxDecoration(
        color: const DigitColors().white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SOR1',
                  style: DigitTheme.instance.mobileTheme.textTheme.displayLarge,
                ),
                Text(
                  'Item 1',
                  style:
                      DigitTheme.instance.mobileTheme.textTheme.headlineLarge,
                ),
                DigitTableCard(element: {
                  "Type": "Plus",
                  "Description": widget.filteredMeasurementsMeasure!.contracts!
                      .first.estimates!.first.description,
                }),
                SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.40,
                    child:
                        (widget.filteredMeasurementsMeasure?.measureLineItems ==
                                    null ||
                                (widget.filteredMeasurementsMeasure!
                                    .measureLineItems!.isEmpty))
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: MultiLineItems(
                                      height: widget
                                          .filteredMeasurementsMeasure?.height
                                          .toString(),
                                      width: widget
                                          .filteredMeasurementsMeasure?.breath
                                          .toString(),
                                      number: widget
                                          .filteredMeasurementsMeasure?.numItems
                                          .toString(),
                                      quantity: widget
                                          .filteredMeasurementsMeasure?.height
                                          .toString(),
                                      length: widget
                                          .filteredMeasurementsMeasure?.numItems
                                          .toString(),
                                    ),
                                  ),
                                  DigitIconButton(
                                    icon: IconData(Icons.add.codePoint),
                                    iconText: "Add Measurements",
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            : ListView.builder(
                                itemCount: widget.filteredMeasurementsMeasure!
                                        .measureLineItems!.length +
                                    1,
                                itemBuilder: (context, index) {
                                  if (index ==
                                      widget.filteredMeasurementsMeasure!
                                          .measureLineItems!.length) {
                                    // TO add line items
                                    return DigitIconButton(
                                      icon: IconData(Icons.add.codePoint),
                                      iconText: "Add Measurements",
                                      onPressed: () {},
                                    );
                                  }

                                  final data = widget
                                      .filteredMeasurementsMeasure
                                      ?.measureLineItems?[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: MultiLineItems(
                                      height: data == null
                                          ? widget.filteredMeasurementsMeasure
                                              ?.height
                                              .toString()
                                          : data?.height.toString(),
                                      width: data == null
                                          ? widget.filteredMeasurementsMeasure
                                              ?.breath
                                              .toString()
                                          : data?.width.toString(),
                                      number: data == null
                                          ? widget.filteredMeasurementsMeasure
                                              ?.numItems
                                              .toString()
                                          : data?.number.toString(),
                                      quantity: data == null
                                          ? widget.filteredMeasurementsMeasure
                                              ?.height
                                              .toString()
                                          : data?.quantity.toString(),
                                      length: data == null
                                          ? widget.filteredMeasurementsMeasure
                                              ?.numItems
                                              .toString()
                                          : data?.length.toString(),
                                    ),
                                  ); // Render your item here
                                },
                              ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2, color: const DigitColors().burningOrange)),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: const DigitColors().burningOrange,
                      ),
                      onPressed: widget.backward,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          width: 2, color: const DigitColors().burningOrange)),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: const DigitColors().burningOrange,
                      ),
                      onPressed: widget.forward,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
