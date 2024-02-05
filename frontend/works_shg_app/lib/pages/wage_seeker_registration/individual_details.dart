import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/wage_seeker/financial_details_model.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

import '../../blocs/wage_seeker_registration/wage_seeker_create_bloc.dart';
import '../../blocs/wage_seeker_registration/wage_seeker_registration_bloc.dart';
import '../../models/mdms/wage_seeker_mdms.dart';
import '../../models/wage_seeker/individual_details_model.dart';
import '../../models/wage_seeker/location_details_model.dart';
import '../../models/wage_seeker/skill_details_model.dart';
import '../../utils/constants.dart';
import '../../widgets/common_info_card.dart';
import 'indi_detail_sub.dart';
import 'indi_photo_sub.dart';
import 'indi_skill_sub.dart';

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

  int switchPage = 0;

  bool adhar = false;
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    final registrationState = BlocProvider.of<WageSeekerBloc>(context).state;
    individualDetails = registrationState.individualDetails;
    skillDetails = registrationState.skillDetails;
    locationDetails = registrationState.locationDetails;
    financialDetails = registrationState.financialDetails;

    // if (registrationState.skillDetails != null &&
    //     registrationState.skillDetails?.individualSkills != null) {
    //   selectedOptions = registrationState.skillDetails!.individualSkills!
    //           .any((a) => a.type == null)
    //       ? []
    //       : registrationState.skillDetails!.individualSkills!
    //           .where((e) => e.type != null)
    //           .map((e) => '${e.level}.${e.type}')
    //           .toList();
    // }
  }

  void _onPageChange(int count) {
    if (count == 4) {
      widget.onPressed();
    } else {
      setState(() {
        switchPage = count;
      });
    }
  }

  void updateAdhar(String adharName) {
    context
        .read<WageSeekerCreateBloc>()
        .add(const CreateWageSeekerDisposeEvent());
    if (adharName == "AADHAAR") {
      setState(() {
        adhar = true;
      });
    } else {
      setState(() {
        adhar = false;
      });
    }
  }

  void isVerifyDone(bool value) {
    setState(() {
      isVerified = value;
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

    switch (switchPage) {
      case 0:
        return identificationMethod(
            context,
            t,
            relationship,
            gender,
            socialCategory,
            skills,
            photo,
            individualDetails,
            adhar,
            (adhar) {
              updateAdhar(adhar);
            },
            isVerified,
            (value) {
              isVerifyDone(value);
            });
      case 1:
        return IndividualSubDetailPage(
          gender: gender,
          photo: photo,
          relationship: relationship,
          skills: skills,
          socialCategory: socialCategory,
          onPageChanged: (int page) {
            _onPageChange(page);
          },
          individualDetails: individualDetails,
        );
      case 2:
        return IndividualSkillSubPage(
          gender: gender,
          photo: photo,
          relationship: relationship,
          skills: skills,
          socialCategory: socialCategory,
          onPageChanged: (int page) {
            _onPageChange(page);
          },
          skillDetails: skillDetails,
        );
      case 3:
        return IndividualPhotoSubPage(
          onPageChanged: (int page) {
            _onPageChange(page);
          },
          photo: individualDetails?.photo ?? '',
        );
      default:
        return identificationMethod(
            context,
            t,
            relationship,
            gender,
            socialCategory,
            skills,
            photo,
            individualDetails,
            adhar,
            (adhar) {
              updateAdhar(adhar);
            },
            isVerified,
            (value) {
              isVerifyDone(value);
            });
    }
  }

  BlocListener identificationMethod(
    BuildContext context,
    AppLocalizations t,
    List<String> relationship,
    List<String> gender,
    List<String> socialCategory,
    List<String> skills,
    String? photo,
    IndividualDetails? individualDetails,
    bool adhar,
    final Function(String adhar) adharSelect,
    bool isVerified,
    final Function(bool value) isVerifyFunction,
  ) {
    
    return BlocListener<WageSeekerCreateBloc, WageSeekerCreateState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () => {const SizedBox.shrink()},
          verified: (adharCardResponse) {
            isVerified = adharCardResponse!.adharCardResponse!.status ==
                    Constants.verifyAdhar
                ? true
                : false;

            isVerifyDone(isVerified);
          },
          error: (error) {
            isVerified = false;
            isVerifyDone(isVerified);
          },
        );
      },
      child: ReactiveFormBuilder(
        form: () =>
            identificationBuildForm(individualDetails ?? IndividualDetails()),
        builder: (context, form, child) {
          return GestureDetector(
            onTap: () {
              if (FocusScope.of(context).hasFocus) {
                FocusScope.of(context).unfocus();
              }
            },
            child: DigitCard(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                     
                      t.translate(
                        i18.wageSeeker.identificationHeader,
                      ),
                      style: DigitTheme
                          .instance.mobileTheme.textTheme.displayMedium
                          ?.apply(color: const DigitColors().black),
                    ),
                    DigitReactiveDropdown<String>(
                      
                      label: t.translate(i18.wageSeeker.identityDocumentLabel),
                      menuItems: [
                        "AADHAAR",
                        "Election Photo Identity Card(EPIC)",
                        "Driving License",
                        "Ration Card under TPDS"
                      ].map((e) => e.toString()).toList(),
                      isRequired: true,
                      formControlName: identityDocument,
                      valueMapper: (value) => t.translate('CORE_COMMON_$value'),
                      onChanged: (value) {
                        adharSelect(value);
                      },
                    ),
                    DigitTextFormField(
                      onChanged: (p0) {
                        if (adhar) {
                          adharSelect("AADHAAR");
                        }
                        isVerifyDone(false);
                        context
                            .read<WageSeekerCreateBloc>()
                            .add(const CreateWageSeekerDisposeEvent());
                      },
                      formControlName: aadhaarNoKey,
                     
                      label: t.translate(i18.wageSeeker.identityNumberLabel),
                      isRequired: true,
                      minLength: adhar ? 12 : null,
                      maxLength: adhar ? 12 : null,
                      keyboardType: TextInputType.number,
                      inputFormatter: [
                        FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                      ],
                      validationMessages: adhar
                          ? {
                              'required': (_) => t.translate(
                                    i18.wageSeeker.aadhaarRequired,
                                  ),
                              'minLength': (_) => t.translate(
                                    i18.wageSeeker.minAadhaarCharacters,
                                  ),
                              'maxLength': (_) => t.translate(
                                    i18.wageSeeker.maxAadhaarCharacters,
                                  ),
                            }
                          : {
                              'required': (_) => t.translate(
                                    i18.wageSeeker.aadhaarRequired,
                                  ),
                            },
                    ),
                    DigitTextFormField(
                      onChanged: (p0) {
                        if (adhar) {
                          adharSelect("AADHAAR");
                        }
                        isVerifyDone(false);
                        context
                            .read<WageSeekerCreateBloc>()
                            .add(const CreateWageSeekerDisposeEvent());
                      },
                      formControlName: nameKey,
                      isRequired: true,
                      
                      label: t.translate(i18.wageSeeker.identityNameLabel),

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
                    adhar
                        ? BlocBuilder<WageSeekerCreateBloc,
                            WageSeekerCreateState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                orElse: () => const Offstage(),
                                loaded: (value) {
                                  return const SizedBox.shrink();
                                },
                                loading: () {
                                  return const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  );
                                },
                                initial: () {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: TextButton(
                                        style: OutlinedButton.styleFrom(
                                          side: BorderSide(
                                            width: 1.0,
                                            color: DigitTheme
                                                .instance.colorScheme.primary,
                                          ),
                                        ),
                                        onPressed: () {
                                          form.markAllAsTouched(
                                              updateParent: false);
                                          if (!form.valid) return;
                                          if (FocusScope.of(context).hasFocus) {
                                            FocusScope.of(context).unfocus();
                                          }
                                          context
                                              .read<WageSeekerCreateBloc>()
                                              .add(
                                                VerifyAdharEvent(
                                                    name: form.value[nameKey]
                                                        .toString(),
                                                    uid: form
                                                        .value[aadhaarNoKey]
                                                        .toString()),
                                              );
                                        },
                                        child: Text(
                                         
                                          t.translate(
                                              i18.wageSeeker.adharValidate),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                verified: (value) {
                                  return Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: CommonInfoCard(
                                        color: value!.status ==
                                                Constants.verifyAdhar
                                            ? DigitTheme
                                                .instance.colors.paleLeafGreen
                                            : DigitTheme
                                                .instance.colors.paleRose,
                                        widget: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                flex: 0,
                                                child: value!.status ==
                                                        Constants.verifyAdhar
                                                    ? CircleAvatar(
                                                        radius: 18,
                                                        backgroundColor:
                                                            DigitTheme
                                                                .instance
                                                                .colors
                                                                .darkSpringGreen,
                                                        child: Icon(
                                                          Icons.done,
                                                          color: DigitTheme
                                                              .instance
                                                              .colors
                                                              .white,
                                                          size: 30,
                                                        ),
                                                      )
                                                    : Icon(
                                                      Icons.error_outline,
                                                      color: DigitTheme
                                                          .instance
                                                          .colors
                                                          .lavaRed,
                                                      size: 28,
                                                    ),
                                              ),
                                              Flexible(
                                                flex: 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                    value!.status ==
                                                            Constants
                                                                .verifyAdhar
                                                       
                                                        ? t.translate(i18
                                                            .wageSeeker
                                                            .adharVerifySuccess)
                                                        
                                                        : t.translate(i18
                                                            .wageSeeker
                                                            .adharVerifyError),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: value!.status ==
                                                              Constants
                                                                  .verifyAdhar
                                                          ? DigitTheme
                                                              .instance
                                                              .colors
                                                              .darkSpringGreen
                                                          : DigitTheme.instance
                                                              .colors.lavaRed,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                error: (error) {
                                  return Center(
                                    child: SizedBox(
                                      height: 50,
                                      child: Text(
                                       
                                        t.translate(
                                            i18.wageSeeker.adharVerifyFailed),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        : const SizedBox.shrink(),
                    Center(
                      child: DigitElevatedButton(
                          onPressed: (adhar)
                              ? isVerified
                                  ? () {
                                      form.markAllAsTouched(
                                          updateParent: false);
                                      if (!form.valid) return;

                                      context.read<WageSeekerBloc>().add(
                                            WageSeekerIdentificationCreateEvent(
                                              adharVerified: true,
                                              documentType: form
                                                  .value[identityDocument]
                                                  .toString(),
                                              name: form.value[nameKey]
                                                  .toString(),
                                              number: form.value[aadhaarNoKey]
                                                  .toString(),
                                              timeStamp: DateTime.now()
                                                  .millisecondsSinceEpoch,
                                            ),
                                          );
                                      setState(() {
                                        switchPage = 1;
                                      });
                                    }
                                  : null
                              : () {
                                  form.markAllAsTouched(updateParent: false);
                                  if (!form.valid) return;

                                  context.read<WageSeekerBloc>().add(
                                        WageSeekerIdentificationCreateEvent(
                                          adharVerified: false,
                                          documentType: form
                                              .value[identityDocument]
                                              .toString(),
                                          name: form.value[nameKey].toString(),
                                          number: form.value[aadhaarNoKey]
                                              .toString(),
                                          timeStamp: DateTime.now()
                                              .millisecondsSinceEpoch,
                                        ),
                                      );
                                  setState(() {
                                    switchPage = 1;
                                  });
                                },
                          child: Center(
                            child: Text(t.translate(i18.common.next)),
                          )),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }

  // identification

  FormGroup identificationBuildForm(
    IndividualDetails individualDetails,
  ) =>
      fb.group(<String, Object>{
        aadhaarNoKey: FormControl<String>(
            value: individualDetails.aadhaarNo ?? '',
            validators: adhar
                ? [
                    Validators.required,
                    Validators.minLength(12),
                    Validators.maxLength(12)
                  ]
                : [
                    Validators.required,
                  ]),
        nameKey: FormControl<String>(
            value: individualDetails.name ?? '',
            validators: [
              Validators.required,
              Validators.minLength(2),
              Validators.maxLength(128)
            ]),
        identityDocument: FormControl<String>(
            value: individualDetails.documentType,
            validators: [
              Validators.required,
            ]),
      });
}
