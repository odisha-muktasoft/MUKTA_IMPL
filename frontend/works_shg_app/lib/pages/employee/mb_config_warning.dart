import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/employee/emp_hrms/emp_hrms.dart';
import 'package:works_shg_app/blocs/employee/mb/mb_crud.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/employee/mb/mb_detail_response.dart';
import 'package:works_shg_app/models/muster_rolls/business_service_workflow.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/utils/models/file_picker_data.dart';
import 'package:works_shg_app/utils/notifiers.dart';
import 'package:works_shg_app/widgets/mb/multi_image.dart';
import 'package:works_shg_app/widgets/molecules/file_picker.dart';

import '../../blocs/employee/mb/mb_detail_view.dart';
import '../../blocs/muster_rolls/get_muster_workflow.dart';
import '../../models/employee/mb/role_based_hrms.dart';
import '../../models/file_store/file_store_model.dart';
import '../../models/muster_rolls/muster_workflow_model.dart';
import '../../utils/common_methods.dart';
import '../../utils/employee/mb/mb_logic.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

@RoutePage()
class MBTypeConfirmationPage extends StatefulWidget {
  final NextActions? nextActions;
  final String? contractNumber;
  final String? mbNumber;
  final MBScreen type;
  final StateActions? stateActions;
  const MBTypeConfirmationPage({
    super.key,
    required this.nextActions,
    this.contractNumber,
    this.mbNumber,
    required this.type,
    this.stateActions,
  });

  @override
  State<MBTypeConfirmationPage> createState() => _MBTypeConfirmationPageState();
}

class _MBTypeConfirmationPageState extends State<MBTypeConfirmationPage> {
  List<String>? photo;
  List<WorkFlowSupportDocument> supportDocument = [];
  HRMSEmployee? selectedAssignee;
  var comment = TextEditingController();

  @override
  void initState() {
    FilePickerData.imageFile = null;
    FilePickerData.bytes = null;

    super.initState();
  }

  @override
  void dispose() {
    comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocListener<MeasurementCrudBloc, MeasurementCrudState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loaded: (value) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).popUntil(
              (route) => route is! PopupRoute,
            );
            // Navigator.of(context).popUntil((route) => route is HomeRoute);
            context.read<MusterGetWorkflowBloc>().add(
                  //hard coded
                  FetchMBWorkFlowEvent(
                      tenantId: GlobalVariables.tenantId!,
                      mbNumber: widget.mbNumber!),
                );
            if (widget.type == MBScreen.update) {
              context.read<MeasurementDetailBloc>().add(
                    MeasurementDetailBookBlocEvent(
                      contractNumber: widget.contractNumber!,
                      measurementNumber: widget.mbNumber!,
                      tenantId: '',
                      screenType: widget.type,
                    ),
                  );
              Navigator.of(context).pop();
            } else {
              context.read<MeasurementDetailBloc>().add(
                    MeasurementDetailBookBlocEvent(
                      contractNumber: widget.contractNumber!,
                      measurementNumber:
                          value.measurement?.measurementNumber ?? '',
                      tenantId: '',
                      screenType: MBScreen.update,
                    ),
                  );
              if (value.measurement!.wfStatus == "SUBMITTED") {
                context.router.popUntilRouteWithPath('home');
              } else {
                Navigator.of(context).pop();
                Navigator.of(context).pop();

                context.router.push(MBDetailRoute(
                  contractNumber: widget.contractNumber!,
                  mbNumber: value.measurement?.measurementNumber ?? '',
                  tenantId: GlobalVariables.tenantId,
                  type: MBScreen.update,
                ));
              }
            }
          },
          loading: (value) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).popUntil(
              (route) => route is! PopupRoute,
            );
            Loaders.showLoadingDialog(context);
          },
          error: (value) {
            Navigator.of(
              context,
              rootNavigator: true,
            ).popUntil(
              (route) => route is! PopupRoute,
            );
            Notifiers.getToastMessage(
              context,
              value.error.toString(),
              'ERROR',
            );
          },
        );
      },
      child: Scaffold(
        backgroundColor: const DigitColors().white,
        appBar: AppBar(
          iconTheme: DigitTheme.instance.mobileTheme.iconTheme.copyWith(color: const DigitColors().white),
          titleSpacing: 0,
          title: const AppBarLogo(),
        ),
        drawer: DrawerWrapper(
          Drawer(
            child: SideBar(
              module: CommonMethods.getLocaleModules(),
            ),
          ),
        ),
        body: BlocBuilder<MeasurementDetailBloc, MeasurementDetailState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              loaded: (value) {
                if (widget.type == MBScreen.update) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScrollableContent(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      footer: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: DigitElevatedButton(
                                child: Text(
                                  widget.nextActions!.action == "EDIT/RE-SUBMIT"
                                      ? t.translate("WORKS_FORWARD")
                                      : t.translate(
                                          "WF_MODAL_SUBMIT_MB_${widget.nextActions!.action!}"),
                                ),
                                onPressed: () {
                                  if (widget.nextActions!.action == "REJECT" &&
                                      comment.text == "") {
                                    Notifiers.getToastMessage(
                                      context,
                                      // AppLocalizations.of(context)
                                      //     .translate(i18.login.invalidOTP),

                                      t.translate(
                                          i18.common.allFieldsMandatory),
                                      'ERROR',
                                    );
                                  } else {
                                    List<List<SorObject>> sorList = [
                                      value.sor!,
                                      value.nonSor!
                                    ];
                                    MBDetailResponse kkk =
                                        MBLogic.getMbPayloadUpdate(
                                      data: value.data,
                                      sorList: sorList,
                                      workFlow: WorkFlow(
                                        action: widget.nextActions!.action,
                                        comment: comment.text,
                                        assignees: selectedAssignee != null
                                            ? selectedAssignee?.uuid != null
                                                ? [selectedAssignee!.uuid!]
                                                : null
                                            : null,
                                        documents: supportDocument,
                                      ),
                                      type: widget.type,
                                    );

                                    context.read<MeasurementCrudBloc>().add(
                                          MeasurementUpdateBlocEvent(
                                            measurement: kkk.measurement!,
                                            tenantId: '',
                                            workFlow: WorkFlow(
                                              action:
                                                  widget.nextActions!.action,
                                              comment: comment.text,
                                              assignees: selectedAssignee !=
                                                      null
                                                  ? selectedAssignee?.uuid !=
                                                          null
                                                      ? [
                                                          selectedAssignee!
                                                              .uuid!
                                                        ]
                                                      : null
                                                  : null,
                                              documents: supportDocument,
                                            ),
                                            type: widget.type,
                                          ),
                                        );
                                  }
                                },
                              ),
                            )
                         , SizedBox(
                               width: MediaQuery.sizeOf(context).width,
                              child: DigitOutLineButton(
                                label:
                                    t.translate(i18.measurementBook.mbCancel),
                                onPressed: () {
                                  context.router.maybePopTop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.router.maybePopTop();
                                },
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                widget.nextActions!.action == "EDIT/RE-SUBMIT"
                                    ? t.translate("WORKS_UPDATE_AND_FORWARD")
                                    : t.translate(
                                        "WF_MB_ACTION_${widget.nextActions!.action}"),
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineLarge,
                              ),
                            ),
                          ],
                        ),
                        (widget.nextActions!.action == "EDIT/RE-SUBMIT" ||
                                widget.nextActions!.action ==
                                    "VERIFY_AND_FORWARD" ||
                                widget.nextActions!.action == "SUBMIT" ||
                                widget.nextActions!.action ==
                                    "SEND_BACK_TO_ORIGINATOR")
                            ? BlocBuilder<EmpHRMSBloc, EmpHRMsState>(
                                builder: (context, state) {
                                  return state.maybeMap(
                                    orElse: () => const SizedBox.shrink(),
                                    loaded: (value) {
                                      if (value.hrmsEmployee != null &&
                                          value.hrmsEmployee!.isNotEmpty) {
                                        return DigitDropdown<HRMSEmployee>(
                                          onChanged: (value) {
                                            setState(() {
                                              selectedAssignee = value!;
                                            });
                                          },
                                          value: selectedAssignee,
                                          label:
                                              t.translate("WF_MODAL_APPROVER"),
                                          menuItems: value.hrmsEmployee!
                                              .map((e) => e)
                                              .toList(),
                                          valueMapper: (value) {
                                            if (value.employeeUser != null) {
                                              return t.translate(value
                                                  .employeeUser!.name
                                                  .toString());
                                            } else {
                                              return t.translate(
                                                  value.code.toString());
                                            }
                                          },
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                    error: (value) {
                                      return const SizedBox.shrink();
                                    },
                                  );
                                },
                              )
                            : const SizedBox.shrink(),
                        DigitTextField(
                          label:
                              "${t.translate("WF_MODAL_COMMENTS")}${widget.nextActions!.action == "REJECT" ? "*" : ""}",
                          maxLines: 6,
                          controller: comment,
                          isRequired: widget.nextActions!.action == "REJECT"
                              ? true
                              : false,
                        ),
                        widget.nextActions!.action != "EDIT/RE-SUBMIT" &&
                                widget.nextActions!.action != "SUBMIT"
                            ? SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height: 300,
                                child: Column(
                                  children: [
                                    FilePickerDemo(
                                      callBack: (List<FileStoreModel>? g,
                                          List<WorkflowDocument>? l) {
                                        final supportDocumentData = l!
                                            .where((element) =>
                                                element.isActive == true)
                                            .toList()
                                            .map(
                                          (e) {
                                            return WorkFlowSupportDocument(
                                              documentType: e.documentType,
                                              documentUid: e.fileStore,
                                              fileName: e
                                                  .documentAdditionalDetails
                                                  ?.fileName,
                                              fileStoreId: e.fileStore,
                                              tenantId: e.tenantId,
                                            );
                                          },
                                        ).toList();
                                        supportDocument.clear();
                                        supportDocument
                                            .addAll(supportDocumentData);
                                        setState(() {});
                                       
                                      },
                                      extensions: const [
                                        'jpg',
                                        'png',
                                        'jpeg',
                                        'pdf',
                                        'xls',
                                        'doc'
                                      ],
                                      moduleName: 'works',
                                      headerType: MediaType.mbConfim,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      //  color: DigitColors().curiousBlue,
                                      child: Text(
                                          t.translate(i18.common.photoInfo)),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ScrollableContent(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      footer: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: DigitElevatedButton(
                                child: Text(
                                  widget.stateActions!.action == "SUBMIT"
                                      ? t.translate(
                                          i18.measurementBook.mbSubmitLabel)
                                      : t.translate(
                                          "WF_MODAL_SUBMIT_MB_${widget.stateActions!.action}"),
                                ),
                                onPressed: () {
                                  List<List<SorObject>> sorList = [
                                    value.sor!,
                                    value.nonSor!
                                  ];
                                  MBDetailResponse kkk =
                                      MBLogic.getMbPayloadUpdate(
                                    data: value.data,
                                    sorList: sorList,
                                    workFlow: WorkFlow(
                                      action: widget.stateActions!.action ==
                                              "CREATE"
                                          ? "SUBMIT"
                                          : widget.stateActions!.action,
                                      comment: comment.text,
                                      assignees: selectedAssignee != null
                                          ? selectedAssignee?.uuid != null
                                              ? [selectedAssignee!.uuid!]
                                              : null
                                          : null,
                                      documents: supportDocument,
                                    ),
                                    type: widget.type,
                                  );

                                  context.read<MeasurementCrudBloc>().add(
                                        MeasurementUpdateBlocEvent(
                                          measurement: kkk.measurement!,
                                          tenantId: '',
                                          workFlow: WorkFlow(
                                            action: widget
                                                        .stateActions!.action ==
                                                    "CREATE"
                                                ? "SUBMIT"
                                                : widget.stateActions!.action,
                                            comment: comment.text,
                                            assignees: selectedAssignee != null
                                                ? selectedAssignee?.uuid != null
                                                    ? [selectedAssignee!.uuid!]
                                                    : null
                                                : null,
                                            documents: supportDocument,
                                          ),
                                          type: widget.type,
                                        ),
                                      );
                                  // Navigator.of(context)
                                  //     .popUntil((route) => route is HomeRoute);
                                  // context.router.push(const HomeRoute());
                                },
                              ),
                            )
                        , SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              child: DigitOutLineButton(
                                label:
                                    t.translate(i18.measurementBook.mbCancel),
                                onPressed: () {
                                  context.router.maybePopTop();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  context.router.maybePopTop();
                                },
                                icon: const Icon(Icons.close)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                widget.stateActions!.action == "SUBMIT"
                                    ? t.translate(
                                        i18.measurementBook.mbcreateLabel)
                                    : t.translate(
                                        "WF_MB_ACTION_${widget.stateActions!.action}"),
                                style: DigitTheme.instance.mobileTheme.textTheme
                                    .headlineLarge,
                              ),
                            ),
                          ],
                        ),
                        (widget.stateActions!.action == "SUBMIT")
                            ? BlocBuilder<EmpHRMSBloc, EmpHRMsState>(
                                builder: (context, state) {
                                  return state.maybeMap(
                                    orElse: () => const SizedBox.shrink(),
                                    loaded: (value) {
                                      if (value.hrmsEmployee != null &&
                                          value.hrmsEmployee!.isNotEmpty) {
                                        return DigitDropdown<HRMSEmployee>(
                                          onChanged: (value) {
                                            setState(() {
                                              selectedAssignee = value!;
                                            });
                                          },
                                          value: selectedAssignee,
                                          label:
                                              t.translate("WF_MODAL_APPROVER"),
                                          menuItems: value.hrmsEmployee!
                                              .map((e) => e)
                                              .toList(),
                                          valueMapper: (value) {
                                            if (value.employeeUser != null) {
                                              return t.translate(value
                                                  .employeeUser!.name
                                                  .toString());
                                            } else {
                                              return t.translate(
                                                  value.code.toString());
                                            }

                                            // return value.toString();
                                          },
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                    error: (value) {
                                      return const SizedBox.shrink();
                                    },
                                  );
                                },
                              )
                            : const SizedBox.shrink(),
                        DigitTextField(
                          label: t.translate("WF_MODAL_COMMENTS"),
                          maxLines: 6,
                          controller: comment,
                        ),
                        widget.stateActions!.action != null
                            ? SizedBox(
                                width: MediaQuery.sizeOf(context).width,
                                height: 300,
                                child: Column(
                                  children: [
                                    FilePickerDemo(
                                      callBack: (List<FileStoreModel>? g,
                                          List<WorkflowDocument>? l) {
                                        final supportDocumentData = l!
                                            .where((element) =>
                                                element.isActive == true)
                                            .toList()
                                            .map(
                                          (e) {
                                            return WorkFlowSupportDocument(
                                              documentType: e.documentType,
                                              documentUid: e.fileStore,
                                              fileName: e
                                                  .documentAdditionalDetails
                                                  ?.fileName,
                                              fileStoreId: e.fileStore,
                                              tenantId: e.tenantId,
                                            );
                                          },
                                        ).toList();
                                        supportDocument.clear();
                                        supportDocument
                                            .addAll(supportDocumentData);
                                        setState(() {});
                                      },
                                      extensions: const [
                                        'jpg',
                                        'png',
                                        'jpeg',
                                        'pdf',
                                        'xls',
                                        'doc'
                                      ],
                                      moduleName: 'works',
                                      headerType: MediaType.mbConfim,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      //  color: DigitColors().curiousBlue,
                                      child: Text(
                                          t.translate(i18.common.photoInfo)),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),
                  );
                }
              },
              error: (value) {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ),
    );
  }
}
