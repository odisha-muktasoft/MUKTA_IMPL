import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class HorizontalCardListDialog extends StatefulWidget {
  const HorizontalCardListDialog({super.key});

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
        height: MediaQuery.of(context).size.height,
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
              height: MediaQuery.sizeOf(context).height * 0.58,
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
                  );
                },
                itemCount: 6,
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
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
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

  const CardWidget({super.key, required this.backward, required this.forward});

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: const DigitColors().white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
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
                const DigitTableCard(element: {
                  "Type": "Plus",
                  "Description": "LHS Wall",
                }),
                const DigitTextField(label: "Number"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8 / 3,
                        child: const DigitTextField(
                          label: "Length",
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8 / 3,
                        child: const DigitTextField(
                          label: "Width",
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 0.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8 / 3,
                        child: const DigitTextField(
                          label: "Height",
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                const DigitTextField(
                  label: "Quantity",
                  isDisabled: true,
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
