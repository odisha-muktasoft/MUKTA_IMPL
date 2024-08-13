import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/employee/mb/measurement_book.dart';
import 'package:works_shg_app/blocs/employee/mb/project_type.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/models/employee/mb/mb_inbox_response.dart'
    as status_map;
import 'package:works_shg_app/models/employee/mb/mb_project_type.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/Toast/toaster.dart';
import 'package:works_shg_app/utils/employee/support_services.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/widgets/atoms/radio_button_list.dart';

import '../../blocs/wage_seeker_registration/wage_seeker_location_bloc.dart';
import '../../utils/common_methods.dart';
import '../../widgets/side_bar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

@RoutePage()
class MBFilterPage extends StatefulWidget {
  const MBFilterPage({super.key});

  @override
  State<MBFilterPage> createState() => _MBFilterPageState();
}

class _MBFilterPageState extends State<MBFilterPage> {
  List<String> ward = []; // Initialize ward list
  List<status_map.StatusMap> workflow = []; // Initialize workflow list

  TextEditingController mbNumber = TextEditingController();
  TextEditingController projectId = TextEditingController();
  String projectName = "";
  ProjectType? selectedType;
  bool workShow = true;
  bool project = true;

  String assign = 'assign';
  String projectTypeKey = "projectTypeKey";
  String wardNoKey = "wardNoKey";
  String statusMapKey = "statusMapKey";
  String genderController = '';
  @override
  void initState() {
    super.initState();

    // final state = context.read<MeasurementInboxBloc>().state;
    // state.maybeMap(
    //   orElse: () => null,
    //   loaded: (valueMeasurement) {
    //      valueMeasurement.data['inbox'] != null
    //         ?ward.add( valueMeasurement.data['inbox']!['moduleSearchCriteria']['ward'][0])
    //         : ward.isNotEmpty
    //             ? ward.first
    //             : [];
    //   },
    // );

    mbNumber.addListener(mbNumberUpload);
    projectId.addListener(projectIdUpload);
    // projectName.addListener(projectNameUpload);
  }

  void mbNumberUpload() {
    if (mbNumber.text != "" || projectId.text != "" || projectName != "") {
      setState(() {
        workShow = false;
      });
    } else {
      setState(() {
        workShow = true;
      });
    }
  }

  void projectIdUpload() {
    if (mbNumber.text != "" || projectId.text != "" || projectName != "") {
      setState(() {
        workShow = false;
      });
    } else {
      setState(() {
        workShow = true;
      });
    }
  }

  void projectNameUpload() {
    if (mbNumber.text != "" || projectId.text != "" || projectName != "") {
      setState(() {
        workShow = false;
      });
    } else {
      setState(() {
        workShow = true;
      });
    }
  }

  @override
  void dispose() {
    mbNumber.removeListener(mbNumberUpload);
    projectId.removeListener(projectIdUpload);
    //projectName.removeListener(projectNameUpload);

    mbNumber.dispose();
    projectId.dispose();
    //projectName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, localizationState) {
        return BlocBuilder<MeasurementInboxBloc, MeasurementInboxState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const SizedBox.shrink(),
              loaded: (valueMeasurement) {
                return BlocBuilder<WageSeekerLocationBloc,
                    WageSeekerLocationState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return const SizedBox.shrink();
                      },
                      loaded: (location) {
                        return Scaffold(
                          backgroundColor: const DigitColors().white,
                          appBar: AppBar(
                            iconTheme: DigitTheme.instance.mobileTheme.iconTheme
                                .copyWith(color: const DigitColors().white),
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
                          body: ReactiveFormBuilder(
                              form: () => detailBuildForm(valueMeasurement),
                              builder: (BuildContext context,
                                  FormGroup formGroup, Widget? child) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ScrollableContent(
                                    backgroundColor: Colors.transparent,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    footer: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 10,
                                            child: DigitOutLineButton(
                                              label: t.translate(
                                                  i18.measurementBook.clear),
                                              onPressed: () {
                                                context
                                                    .read<
                                                        MeasurementInboxBloc>()
                                                    .add(
                                                      MeasurementBookInboxBlocEvent(
                                                        businessService: "MB",
                                                        limit: 10,
                                                        moduleName:
                                                            'measurement-module',
                                                        offset: 0,
                                                        tenantId:
                                                            GlobalVariables
                                                                .tenantId!,
                                                      ),
                                                    );
                                                context.router.maybePopTop();
                                              },
                                            ),
                                          ),
                                          const Expanded(
                                              flex: 1,
                                              child: SizedBox.shrink()),
                                          Expanded(
                                            flex: 10,
                                            child: DigitElevatedButton(
                                              child: Text(t.translate(
                                                  i18.measurementBook.filter)),
                                              onPressed: () async {
                                                Map<String,
                                                        Map<String, dynamic>>
                                                    filterPayload;

                                                if (workShow && project) {
                                                  filterPayload = {
                                                    "inbox": {
                                                      "tenantId":
                                                          GlobalVariables
                                                              .tenantId,
                                                      "moduleSearchCriteria": {
                                                        "tenantId":
                                                            GlobalVariables
                                                                .tenantId,
                                                      },
                                                      "processSearchCriteria": {
                                                        "businessService": [
                                                          "MB"
                                                        ],
                                                        "moduleName":
                                                            "measurement-service"
                                                      },
                                                      "limit": 10,
                                                      "offset": 0
                                                    }
                                                  };

                                                  if (formGroup.value[assign] ==
                                                          "MB_ASSIGNED_TO_ME" ||
                                                      assign ==
                                                          "MB_ASSIGNED_TO_ME") {
                                                    filterPayload['inbox']![
                                                                'moduleSearchCriteria']![
                                                            'assignee'] =
                                                        GlobalVariables.uuid;
                                                    context
                                                        .read<
                                                            MeasurementInboxBloc>()
                                                        .add(
                                                          MeasurementBookInboxSearchBlocEvent(
                                                            limit: 10,
                                                            offset: 0,
                                                            data: filterPayload,
                                                          ),
                                                        );
                                                    context.router
                                                        .maybePopTop();
                                                  } else {
                                                    ToastUtils.showCustomToast(
                                                        context,
                                                        t.translate(i18.common
                                                            .searchCriteria),
                                                        "INFO");

                                                    // TODO: digit component toast
                                                    // DigitToast.show(
                                                    //   context,
                                                    //   options:
                                                    //       DigitToastOptions(
                                                    //     t.translate(i18.common
                                                    //         .searchCriteria),
                                                    //     true,
                                                    //     DigitTheme.instance
                                                    //         .mobileTheme,
                                                    //   ),
                                                    // );
                                                    // end of it
                                                  }
                                                } else {
                                                  if (workShow && !project) {
                                                    if (workflow.isEmpty &&
                                                        ward.isNotEmpty) {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            // "status": workflow
                                                            //     .map((e) => e.statusid!)
                                                            //     .toList(),
                                                            "ward": ward,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    } else if (workflow
                                                            .isNotEmpty &&
                                                        ward.isEmpty) {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            "status": workflow
                                                                .map((e) =>
                                                                    e.statusid!)
                                                                .toList(),
                                                            // "ward": ward,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    } else {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            "status": workflow
                                                                .map((e) =>
                                                                    e.statusid!)
                                                                .toList(),
                                                            "ward": ward,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    }

                                                    if (formGroup.value[
                                                                assign] ==
                                                            "MB_ASSIGNED_TO_ME" ||
                                                        assign ==
                                                            "MB_ASSIGNED_TO_ME") {
                                                      filterPayload['inbox']![
                                                                  'moduleSearchCriteria']![
                                                              'assignee'] =
                                                          GlobalVariables.uuid;
                                                    }
                                                    context
                                                        .read<
                                                            MeasurementInboxBloc>()
                                                        .add(
                                                          MeasurementBookInboxSearchBlocEvent(
                                                            limit: 10,
                                                            offset: 0,
                                                            data: filterPayload,
                                                          ),
                                                        );
                                                  } else {
                                                    if (mbNumber.text != "" &&
                                                        projectId.text == "" &&
                                                        projectName == "") {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            "measurementNumber":
                                                                mbNumber.text,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    } else if (mbNumber.text ==
                                                            "" &&
                                                        projectId.text != "" &&
                                                        projectName == "") {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            "projectId":
                                                                projectId.text,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    } else if (mbNumber.text ==
                                                            "" &&
                                                        projectId.text == "" &&
                                                        projectName != "") {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            "projectType":
                                                                projectName,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    } else {
                                                      filterPayload = {
                                                        "inbox": {
                                                          "tenantId":
                                                              GlobalVariables
                                                                  .tenantId,
                                                          "moduleSearchCriteria":
                                                              {
                                                            "tenantId":
                                                                GlobalVariables
                                                                    .tenantId,
                                                            "measurementNumber":
                                                                mbNumber.text,
                                                            "projectId":
                                                                projectId.text,
                                                            "projectType":
                                                                projectName,
                                                          },
                                                          "processSearchCriteria":
                                                              {
                                                            "businessService": [
                                                              "MB"
                                                            ],
                                                            "moduleName":
                                                                "measurement-service"
                                                          },
                                                          "limit": 10,
                                                          "offset": 0
                                                        }
                                                      };
                                                    }

                                                    if (formGroup.value[
                                                                assign] ==
                                                            "MB_ASSIGNED_TO_ME" ||
                                                        assign ==
                                                            "MB_ASSIGNED_TO_ME") {
                                                      filterPayload['inbox']![
                                                                  'moduleSearchCriteria']![
                                                              'assignee'] =
                                                          GlobalVariables.uuid;
                                                    }

                                                    context
                                                        .read<
                                                            MeasurementInboxBloc>()
                                                        .add(
                                                          MeasurementBookInboxSearchBlocEvent(
                                                            limit: 10,
                                                            offset: 0,
                                                            data: filterPayload,
                                                          ),
                                                        );
                                                  }

                                                  context.router.maybePopTop();
                                                }
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          DigitIconButton(
                                            textDirection: TextDirection.rtl,
                                            onPressed: () {
                                              context
                                                  .read<MeasurementInboxBloc>()
                                                  .add(
                                                    MeasurementBookInboxBlocEvent(
                                                      businessService: "MB",
                                                      limit: 10,
                                                      moduleName:
                                                          'measurement-module',
                                                      offset: 0,
                                                      tenantId: GlobalVariables
                                                          .tenantId!,
                                                    ),
                                                  );
                                              context.router.maybePopTop();
                                            },
                                            icon: Icons.close,
                                            iconSize: 30,
                                            iconColor:
                                                const DigitColors().black,
                                          ),
                                        ],
                                      ),

                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(Icons.filter_alt),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              t.translate(
                                                  i18.measurementBook.filter),
                                              style: DigitTheme
                                                  .instance
                                                  .mobileTheme
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                      fontFamily: 'Roboto'),
                                            ),
                                          ),
                                        ],
                                      ),

                                      workShow
                                          ? DigitRadioButtonList<String>(
                                              isEnabled: true,
                                              labelText: t.translate(
                                                  i18.common.assignee),
                                              formControlName: assign,
                                              options: const [
                                                'MB_ASSIGNED_TO_ME',
                                                'MB_ASSIGNED_TO_ALL'
                                              ],
                                              isRequired: false,
                                              valueMapper: (value) =>
                                                  t.translate(value),
                                              onValueChange: (value) {
                                                setState(() {
                                                  assign = value;
                                                });
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                      project
                                          ? DigitTextField(
                                              label: t.translate(
                                                  i18.measurementBook.mbNumber),
                                              controller: mbNumber,
                                            )
                                          : const SizedBox.shrink(),
                                      project
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: DigitTextField(
                                                label: t.translate(i18
                                                    .measurementBook.projectId),
                                                controller: projectId,
                                              ),
                                            )
                                          : const SizedBox.shrink(),

                                      project
                                          ? BlocBuilder<ProjectTypeBloc,
                                              ProjectTypeState>(
                                              builder: (context, state) {
                                                return state.maybeMap(
                                                  orElse: () =>
                                                      const SizedBox.shrink(),
                                                  loaded: (value) {
                                                    return DigitReactiveDropdown<
                                                        ProjectType>(
                                                      formControlName:
                                                          projectTypeKey,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          projectName =
                                                              value!.code!;
                                                          selectedType = value;
                                                          workShow = false;
                                                        });
                                                      },
                                                      initialValue:
                                                          selectedType,
                                                      label: t.translate(i18
                                                          .measurementBook
                                                          .projectType),
                                                      menuItems: value
                                                          .mbProjectType!
                                                          .mdmsRes!
                                                          .mbWorks!
                                                          .projectType!,
                                                      valueMapper: (value) {
                                                        return value.name!
                                                            .trim();
                                                      },
                                                    );
                                                  },
                                                  error: (value) {
                                                    return const SizedBox
                                                        .shrink();
                                                  },
                                                  loading: (value) {
                                                    return const SizedBox
                                                        .shrink();
                                                  },
                                                );
                                              },
                                            )
                                          : const SizedBox.shrink(),

                                      // end of this
                                      workShow
                                          ? DigitReactiveDropdown<String>(
                                              formControlName: wardNoKey,
                                              onChanged: (value) {
                                                setState(() {
                                                  ward.add(value);
                                                  project = false;
                                                });
                                              },
                                              initialValue:  ward.isNotEmpty
                                                      ? ward.first
                                                      : null,
                                              label:
                                                  t.translate(i18.common.ward),
                                              menuItems: location!
                                                  .tenantBoundaryList!
                                                  .first
                                                  .boundaryList!
                                                  .map((e) => e.code.toString())
                                                  .toList(),
                                              valueMapper: (value) {
                                                return t.translate(
                                                    convertToWard(
                                                        value.toString()));
                                                // return value.toString();
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                      workShow
                                          ? DigitReactiveDropdown<
                                              status_map.StatusMap>(
                                              formControlName: statusMapKey,
                                              onChanged: (value) {
                                                setState(() {
                                                  workflow.add(value);
                                                  project = false;
                                                });
                                              },
                                              initialValue: workflow.isNotEmpty
                                                  ? workflow.first
                                                  : null,
                                              label: t.translate(i18
                                                  .measurementBook
                                                  .workflowState),
                                              menuItems: valueMeasurement
                                                  .mbInboxResponse.statusMap!
                                                  .map((e) => e)
                                                  .toList(),
                                              valueMapper: (value) {
                                                return t.translate(
                                                    "MB_WFMB_STATE_${value.state.toString()}");
                                              },
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                );
                              }),
                        );
                      },
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }

  FormGroup detailBuildForm(dynamic valueMeasurement) =>
      fb.group(<String, Object>{
        assign: FormControl<String>(value: "MB_ASSIGNED_TO_ALL"),
        projectTypeKey: FormControl<ProjectType>(value: selectedType),
        wardNoKey: FormControl<String>(
            value: valueMeasurement.data['inbox'] != null
                ? valueMeasurement.data['inbox']!['moduleSearchCriteria']
                    ['ward']!=null?valueMeasurement.data['inbox']!['moduleSearchCriteria']
                    ['ward'][0]:null
                : ward.isNotEmpty
                    ? ward.first
                    : null),
        statusMapKey: FormControl<status_map.StatusMap>(value: null),
      });

  String convertToWard(String input) {
    String tenant = Conversion.splitTenant(GlobalVariables.tenantId!);
    String result = "${tenant}_ADMIN_${input.toUpperCase()}";
    return result;
  }
}
