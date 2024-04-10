import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';

import '../../blocs/employee/emp_hrms/emp_hrms.dart';
import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../models/muster_rolls/muster_workflow_model.dart';
import '../../router/app_router.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class CommonButtonCard extends StatelessWidget {
  const CommonButtonCard({
    super.key,
    required this.g,
    required this.contractNumber,
    required this.mbNumber,
  });

  final List<ProcessInstances>? g;
  final String contractNumber;
  final String mbNumber;

  @override
  Widget build(BuildContext context) {
     var t = AppLocalizations.of(context);
    return BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loaded: (value) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                height: g!.first.nextActions!.length!.toDouble() * 50.0,
                width: MediaQuery.sizeOf(context).width,
                child: Center(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                     String editReSubmit="EDIT_RE_SUBMIT";
                      return DigitOutLineButton(
                        
                         label:g!.first.nextActions![index].action ==
                                  "EDIT/RE-SUBMIT"?
                          t.translate("WF_MB_ACTION_$editReSubmit"):t.translate("WF_MB_ACTION_${g!.first.nextActions![index].action!}"),
                       // label: g!.first.nextActions![index].action! ?? "",
                        onPressed: () {
                          final data =
                              g?.first.nextActions![index].roles?.join(',');
                          if (g!.first.nextActions![index].action ==
                                  "EDIT/RE-SUBMIT" &&
                              value.viewStatus) {
                            context.read<MeasurementDetailBloc>().add(
                                  UpdateViewModeEvent(
                                    updateView: !value.viewStatus,
                                  ),
                                );
                            //     Navigator.of(
                            //   context,
                            //   rootNavigator: false,
                            // ).popUntil(
                            //   (route) => route is! PopupRoute,
                            // );
                            Navigator.of(context).pop();
                          } else {
                            context.read<EmpHRMSBloc>().add(
                                  EmpHRMSLoadBlocEvent(
                                    isActive: true,
                                    roles:
                                        g!.first.nextActions![index].action !=
                                                "EDIT/RE-SUBMIT"
                                            ? data ?? "MB_VERIFIER"
                                            : "MB_VERIFIER",
                                    tenantId: 'od.testing',
                                  ),
                                );
                            // Navigator.of(
                            //   context,
                            //   rootNavigator: true,
                            // ).popUntil(
                            //   (route) => route is! PopupRoute,
                            // );
                             Navigator.of(context).pop();
                            context.router.push(
                              MBTypeConfirmationRoute(
                                nextActions: g!.first.nextActions![index],
                                contractNumber: contractNumber,
                                mbNumber: mbNumber,
                              ),
                            );
                          }
                        },
                      );
                    },
                    itemCount: g?.first.nextActions?.length,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
