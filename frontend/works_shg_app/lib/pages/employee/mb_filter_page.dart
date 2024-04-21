import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/employee/mb/measurement_book.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/employee/mb/mb_inbox_response.dart'
    as statusMap;
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/employee/support_services.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/widgets/atoms/radio_button_list.dart';

import '../../blocs/wage_seeker_registration/wage_seeker_location_bloc.dart';
import '../../services/local_storage.dart';
import '../../utils/common_methods.dart';
import '../../widgets/SideBar.dart';
import '../../widgets/atoms/app_bar_logo.dart';
import '../../widgets/drawer_wrapper.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class MBFilterPage extends StatefulWidget {
  const MBFilterPage({super.key});

  @override
  State<MBFilterPage> createState() => _MBFilterPageState();
}

class _MBFilterPageState extends State<MBFilterPage> {
  List<String> ward = []; // Initialize ward list
  List<statusMap.StatusMap> workflow = []; // Initialize workflow list

  TextEditingController mbNumber = TextEditingController();
  TextEditingController projectId = TextEditingController();
  TextEditingController projectName = TextEditingController();
  bool workShow = true;
  bool project = true;

  String genderKey = 'gender';
  String genderController = '';
  @override
  void initState() {
    super.initState();

    mbNumber.addListener(mbNumberUpload);
    projectId.addListener(projectIdUpload);
    projectName.addListener(projectNameUpload);
  }

  void mbNumberUpload() {
    if (mbNumber.text != "" || projectId.text != "" || projectName.text != "") {
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
    if (mbNumber.text != "" || projectId.text != "" || projectName.text != "") {
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
    if (mbNumber.text != "" || projectId.text != "" || projectName.text != "") {
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
    // TODO: implement dispose
    mbNumber.removeListener(mbNumberUpload);
    projectId.removeListener(projectIdUpload);
    projectName.removeListener(projectNameUpload);

    mbNumber.dispose();
    projectId.dispose();
    projectName.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return BlocBuilder<MeasurementInboxBloc, MeasurementInboxState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => const SizedBox.shrink(),
          loaded: (value) {
            return BlocBuilder<WageSeekerLocationBloc, WageSeekerLocationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return const SizedBox.shrink();
                  },
                  loaded: (location) {
                    return Scaffold(
                      appBar: AppBar(
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
                          form: detailBuildForm,
                          builder: (BuildContext context, FormGroup formGroup,
                              Widget? child) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ScrollableContent(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                footer: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: DigitOutLineButton(
                                          label: t.translate(i18.measurementBook.clear),
                                          onPressed: () {
                                            context.router.pop();
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: DigitElevatedButton(
                                          child:  Text(t.translate(i18.measurementBook.filter)),
                                          onPressed: () async {
                                            Map<String, Map<String, dynamic>> s;
                                            if (workShow && !project) {
                                              if (workflow.isEmpty &&
                                                  ward.isNotEmpty) {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      // "status": workflow
                                                      //     .map((e) => e.statusid!)
                                                      //     .toList(),
                                                      "ward": ward,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              } else if (workflow.isNotEmpty &&
                                                  ward.isEmpty) {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      "status": workflow
                                                          .map((e) =>
                                                              e.statusid!)
                                                          .toList(),
                                                      // "ward": ward,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              } else {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      "status": workflow
                                                          .map((e) =>
                                                              e.statusid!)
                                                          .toList(),
                                                      "ward": ward,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              }

                                              if (formGroup.value[genderKey] ==
                                                      "ASSIGNED_TO_ME" ||
                                                  formGroup.value[genderKey]
                                                      .toString()
                                                      .isEmpty) {
                                               s['inbox']!['moduleSearchCriteria']!['assignee'] = "sse";
                                              }
                                              context
                                                  .read<MeasurementInboxBloc>()
                                                  .add(
                                                    MeasurementBookInboxSearchBlocEvent(
                                                      limit: 10,
                                                      offset: 0,
                                                      data: s, // ward: ward,
                                                      // status: workflow
                                                      //     .map((e) => e.statusid!)
                                                      //     .toList(),
                                                      // projectId: null,
                                                      // mbNumber: null,
                                                      // projectName: null,
                                                    ),
                                                  );
                                            }
                                             else 
                                             {
                                              if (mbNumber.text != "" &&
                                                  projectId.text == "" &&
                                                  projectName.text == "") {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      // "status": workflow
                                                      //     .map((e) => e.statusid!)
                                                      //     .toList(),
                                                      "measurementNumber":
                                                          mbNumber.text,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              } else if (mbNumber.text == "" &&
                                                  projectId.text != "" &&
                                                  projectName.text == "") {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      "projectId":
                                                          projectId.text,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              } else if (mbNumber.text == "" &&
                                                  projectId.text == "" &&
                                                  projectName.text != "") {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      "projectType":
                                                          projectName.text,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              } else {
                                                s = {
                                                  "inbox": {
                                                    "tenantId": GlobalVariables.tenantId,
                                                    "moduleSearchCriteria": {
                                                      "tenantId": GlobalVariables.tenantId,
                                                      "measurementNumber":
                                                          mbNumber.text,
                                                      "projectId":
                                                          projectId.text,
                                                      "projectType":
                                                          projectName.text,
                                                    },
                                                    "processSearchCriteria": {
                                                      "businessService": ["MB"],
                                                      "moduleName":
                                                          "measurement-service"
                                                    },
                                                    "limit": 10,
                                                    "offset": 0
                                                  }
                                                };
                                              }
                                              context
                                                  .read<MeasurementInboxBloc>()
                                                  .add(
                                                    MeasurementBookInboxSearchBlocEvent(
                                                      limit: 10,
                                                      offset: 0,
                                                      data: s, // ward: ward,
                                                      // status: workflow
                                                      //     .map((e) => e.statusid!)
                                                      //     .toList(),
                                                      // projectId: null,
                                                      // mbNumber: null,
                                                      // projectName: null,
                                                    ),
                                                  );
                                            }

                                            context.router.pop();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            context.router.pop();
                                          },
                                          icon: const Icon(Icons.close)),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(Icons.filter_alt),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Text(
                                         t.translate(i18.measurementBook.filter),
                                          style: DigitTheme.instance.mobileTheme
                                              .textTheme.headlineLarge,
                                        ),
                                      ),
                                    ],
                                  ),
                                  DigitRadioButtonList<String>(
                                    labelText: t.translate(i18.common.assignee),
                                    formControlName: genderKey,
                                    options: const [
                                      'MB_ASSIGNED_TO_ME',
                                      'MB_ASSIGNED_TO_ALL'
                                    ],
                                    isRequired: false,
                                    valueMapper: (value) => t.translate(value),
                                    onValueChange: (value) {
                                      genderController = value;
                                    },
                                  ),
                                  project
                                      ? DigitTextField(
                                          label: t.translate(i18.measurementBook.mbNumber),
                                          controller: mbNumber,
                                        )
                                      : const SizedBox.shrink(),
                                  project
                                      ? DigitTextField(
                                          label: "Project ID",
                                          controller: projectId,
                                        )
                                      : const SizedBox.shrink(),
                                  project
                                      ? DigitTextField(
                                          label: t.translate(
                                              i18.measurementBook.projectName),
                                          controller: projectName,
                                        )
                                      : const SizedBox.shrink(),
                                  workShow
                                      ? DigitDropdown(
                                          onChanged: (value) {
                                            setState(() {
                                              ward.add(value!);
                                              project = false;
                                            });
                                          },
                                          value: ward.isNotEmpty
                                              ? ward.first
                                              : null,
                                          label: t.translate(i18.common.ward),
                                          menuItems: location!
                                              .tenantBoundaryList!
                                              .first
                                              .boundaryList!
                                              .map((e) => e.code.toString())
                                              .toList(),
                                          valueMapper: (value) {
                                            return  t.translate(convertToWard(value.toString()));
                                           // return value.toString();
                                          },
                                        )
                                      : const SizedBox.shrink(),
                                  workShow
                                      ? DigitDropdown<statusMap.StatusMap>(
                                          onChanged: (value) {
                                            setState(() {
                                              workflow.add(value!);
                                              project = false;
                                            });
                                          },
                                          value: workflow.isNotEmpty
                                              ? workflow.first
                                              : null,
                                          label: t.translate(i18
                                              .measurementBook.workflowState),
                                          menuItems: value
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
  }

  FormGroup detailBuildForm() => fb.group(<String, Object>{
        genderKey: FormControl<String>(value: "MB_ASSIGNED_TO_ALL"),
      });

      String convertToWard(String input) {
    
   String tenant=Conversion. splitTenant(GlobalVariables.tenantId!);
    String result =
        "${tenant}_ADMIN_${input.toUpperCase()}";
    return result;
  }
}
