import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:flutter/material.dart';

import '../../models/muster_rolls/muster_workflow_model.dart';
import '../../router/app_router.dart';

class CommonButtonCard extends StatelessWidget {
  const CommonButtonCard({
    super.key,
    required this.g,
  });

  final List<ProcessInstances>? g;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        height: g!.first.nextActions!.length!.toDouble() * 50.0,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return DigitOutLineButton(
                label: g!.first.nextActions![index].action! ?? "",
                onPressed: () {
                  Navigator.of(
                    context,
                    rootNavigator: true,
                  ).popUntil(
                    (route) => route is! PopupRoute,
                  );
                  // Navigator.of(context).pop();
                  context.router.push(const MBTypeConfirmationRoute());
                },
              );
            },
            itemCount: g?.first.nextActions?.length,
          ),
        ),
      ),
    );
  }
}
