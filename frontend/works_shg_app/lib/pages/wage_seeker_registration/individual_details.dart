import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/wage_seeker/financial_details_model.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/utils/models/file_picker_data.dart';
import 'package:works_shg_app/widgets/atoms/radio_button_list.dart';

import '../../blocs/wage_seeker_registration/wage_seeker_registration_bloc.dart';
import '../../models/file_store/file_store_model.dart';
import '../../models/mdms/wage_seeker_mdms.dart';
import '../../models/wage_seeker/individual_details_model.dart';
import '../../models/wage_seeker/location_details_model.dart';
import '../../models/wage_seeker/skill_details_model.dart';
import '../../utils/notifiers.dart';
import '../../widgets/atoms/multiselect_checkbox.dart';
import '../../widgets/molecules/file_picker.dart';
import 'indi_detail_sub.dart';

class IndividualDetailsPage extends StatefulWidget {
  final void Function() onPressed;
  final WageSeekerMDMS? wageSeekerMDMS;
  const IndividualDetailsPage(
      {required this.onPressed, this.wageSeekerMDMS, super.key});

  @override
  State<StatefulWidget> createState() {
    return IndividualDetailsPageState();
  }
}

class IndividualDetailsPageState extends State<IndividualDetailsPage> {
  String genderController = '';
  IndividualDetails? individualDetails = IndividualDetails();
  LocationDetails? locationDetails = LocationDetails();
  SkillDetails? skillDetails = SkillDetails();
  FinancialDetails? financialDetails = FinancialDetails();
  String nameKey = 'name';
  String fatherNameKey = 'fatherName';
  String aadhaarNoKey = 'aadhaarNo';
  String relationshipKey = 'relationship';
  String dobKey = 'dob';
  String genderKey = 'gender';
  String socialCategoryKey = 'socialCategory';
  String mobileKey = 'mobileNo';
  List<String> selectedOptions = [];
  String identityDocument = "identityDocument";

  int check = 0;

  @override
  void initState() {
    super.initState();
    final registrationState = BlocProvider.of<WageSeekerBloc>(context).state;
    individualDetails = registrationState.individualDetails;
    skillDetails = registrationState.skillDetails;
    locationDetails = registrationState.locationDetails;
    financialDetails = registrationState.financialDetails;

    if (registrationState.skillDetails != null &&
        registrationState.skillDetails?.individualSkills != null) {
      selectedOptions = registrationState.skillDetails!.individualSkills!
              .any((a) => a.type == null)
          ? []
          : registrationState.skillDetails!.individualSkills!
              .where((e) => e.type != null)
              .map((e) => '${e.level}.${e.type}')
              .toList();
    }
  }


  void _onSelectedOptionsChanged(List<String> options) {
    setState(() {
      selectedOptions = options;
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    String? photo;
    List<String> relationship = widget.wageSeekerMDMS!.commonMDMS!.relationship!
        .map((e) => (e.code))
        .toList();
    List<String> socialCategory = widget
        .wageSeekerMDMS!.commonMDMS!.socialCategory!
        .map((e) => (e.code))
        .toList();
    List<String> gender = widget.wageSeekerMDMS!.commonMDMS!.genderType!
        .map((e) => (e.code))
        .toList();
    List<String> skills =
        widget.wageSeekerMDMS!.commonMDMS!.wageSeekerSkills != null
            ? widget.wageSeekerMDMS!.commonMDMS!.wageSeekerSkills!
                .map((e) => e.code)
                .toList()
            : [];

    switch (check) {
      case 0:
        return identificationMethod(context,
            t, relationship, gender, socialCategory, skills, photo);
      case 1:
       
        return IndividualSubDetailPage(gender: gender, photo: photo, relationship: relationship, skills: skills, socialCategory: socialCategory,);
      case 2:
        return skillMethod(context,
            t, relationship, gender, socialCategory, skills, photo);
      default:
        return identificationMethod(context,
            t, relationship, gender, socialCategory, skills, photo);
    }
  }

  ReactiveFormBuilder identificationMethod(
    BuildContext context,
      AppLocalizations t,
      List<String> relationship,
      List<String> gender,
      List<String> socialCategory,
      List<String> skills,
      String? photo) {
    return ReactiveFormBuilder(
      form: identificationBuildForm,
      builder: (context, form, child) {
       
        return GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DigitCard(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Individual's Identification Details",
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.displayMedium
                          ?.apply(color: const DigitColors().black),
                    ),
                    Column(children: [
                      DigitReactiveDropdown<String>(
                        label: "Identity Document",
                        menuItems: ["Adhar", "VoterId", "Rasan Card"]
                            .map((e) => e.toString())
                            .toList(),
                        isRequired: true,
                        formControlName: identityDocument,
                        valueMapper: (value) =>
                            t.translate('CORE_COMMON_$value'),
                        onChanged: (value) {},
                       
                      ),
                      DigitTextFormField(
                        formControlName: aadhaarNoKey,
                        label: "Identity Number",
                        isRequired: true,
                        minLength: 12,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.aadhaarRequired,
                              ),
                          'minLength': (_) => t.translate(
                                i18.wageSeeker.minAadhaarCharacters,
                              ),
                          'maxLength': (_) => t.translate(
                                i18.wageSeeker.maxAadhaarCharacters,
                              ),
                        },
                      ),
                      DigitTextFormField(
                        padding: const EdgeInsets.only(top: 0),
                        formControlName: nameKey,
                        isRequired: true,
                        label: "Name on Document",
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
                        ],
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.nameRequired,
                              ),
                          'minLength': (_) => t.translate(
                                i18.wageSeeker.minNameCharacters,
                              ),
                          'maxLength': (_) => t.translate(
                                i18.wageSeeker.maxNameCharacters,
                              ),
                        },
                      ),
                      
                    ]),
                    Center(
                      child: DigitElevatedButton(
                          onPressed: () {
                            form.markAllAsTouched(updateParent: false);
                            if (!form.valid) return;
                           
                              setState(() {
                                check = 1;
                              });
                            
                          },
                          child: Center(
                            child: Text(t.translate(i18.common.next)),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  

  ReactiveFormBuilder skillMethod(
     BuildContext contexttt,
      AppLocalizations t,
      List<String> relationship,
      List<String> gender,
      List<String> socialCategory,
      List<String> skills,
      String? photo) {
    return ReactiveFormBuilder(
      form: buildForm,
      builder: (contexttt, form2, child) {
        
        return GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DigitCard(
                margin: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Individual's Skill Details",
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.displayMedium
                          ?.apply(color: const DigitColors().black),
                    ),
                    Column(children: [
                      DigitReactiveDropdown<String>(
                        label: "Identity Document",
                        menuItems: ["Adhar", "VoterId", "Rasan Card"]
                            .map((e) => e.toString())
                            .toList(),
                        isRequired: true,
                        formControlName: relationshipKey,
                        valueMapper: (value) =>
                            t.translate('CORE_COMMON_$value'),
                        onChanged: (value) {},
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.relationshipRequired,
                              ),
                        },
                      ),
                      DigitTextFormField(
                        formControlName: aadhaarNoKey,
                        label: "Identity Number",
                        isRequired: true,
                        minLength: 12,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.aadhaarRequired,
                              ),
                          'minLength': (_) => t.translate(
                                i18.wageSeeker.minAadhaarCharacters,
                              ),
                          'maxLength': (_) => t.translate(
                                i18.wageSeeker.maxAadhaarCharacters,
                              ),
                        },
                      ),
                      DigitTextFormField(
                        padding: const EdgeInsets.only(top: 0),
                        formControlName: nameKey,
                        isRequired: true,
                        label: "Name on Document",
                        inputFormatter: [
                          FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
                        ],
                        validationMessages: {
                          'required': (_) => t.translate(
                                i18.wageSeeker.nameRequired,
                              ),
                          'minLength': (_) => t.translate(
                                i18.wageSeeker.minNameCharacters,
                              ),
                          'maxLength': (_) => t.translate(
                                i18.wageSeeker.maxNameCharacters,
                              ),
                        },
                      ),
                    ]),
                    Center(
                      child: DigitElevatedButton(
                          onPressed: () {
                            
                          },
                          child: Center(
                            child: Text(t.translate(i18.common.next)),
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  bool getSkillsValid() {
    Map<String, int> beforeDotCount = {};
    Map<String, int> afterDotCount = {};

    for (String skill in selectedOptions) {
      List<String> skillParts = skill.split(".");
      String beforeDot = skillParts[0];
      String afterDot = skillParts[1];

      beforeDotCount[beforeDot] = (beforeDotCount[beforeDot] ?? 0) + 1;
      afterDotCount[afterDot] = (afterDotCount[afterDot] ?? 0) + 1;
    }

    // int countBeforeDot =
    //     beforeDotCount.values.where((count) => count > 1).length;
    int countAfterDot = afterDotCount.values.where((count) => count > 1).length;

    if (countAfterDot > 0) {
      return false;
    }
    return true;
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        aadhaarNoKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(12),
          Validators.maxLength(12)
        ]),
        nameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        genderKey: FormControl<String>(value: null),
        fatherNameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        relationshipKey:
            FormControl<String>(value: null, validators: [Validators.required]),
        dobKey: FormControl<DateTime>(
          value: null,
          validators: [
            Validators.required,
            Validators.max(DateTime(DateTime.now().year - 18,
                DateTime.now().month, DateTime.now().day))
          ],
        ),
        socialCategoryKey: FormControl<String>(value: null),
        mobileKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(10),
          Validators.min('5999999999'),
          Validators.max('9999999999'),
          Validators.maxLength(10)
        ]),
     
      });

  // identification

  FormGroup identificationBuildForm() => fb.group(<String, Object>{
        aadhaarNoKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(12),
          Validators.maxLength(12)
        ]),
        nameKey: FormControl<String>(value: '', validators: [
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(128)
        ]),
        identityDocument: FormControl<String>(
          value: null,
        ),
      });



}
