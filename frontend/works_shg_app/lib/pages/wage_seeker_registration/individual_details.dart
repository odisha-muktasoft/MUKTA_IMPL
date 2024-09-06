import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/digit_components.dart' as ui_component;
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/text_chunk.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart'
    as ui_card;
import 'package:digit_ui_components/utils/validators/validator.dart'
    as ui_validation;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/models/adharModel/adhar_response.dart';
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
  String aadhaarNoKey = 'aadhaarNo';
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
    // Localization object
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
                .map((e) => e.id!)
                .toList()
            : [];
// Returning appropriate subpage based on the switchPage variable
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

// Widget for displaying identification method form
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
        // Listen to state changes in WageSeekerCreateBloc
        state.maybeMap(
          orElse: () => {const SizedBox.shrink()},
          verified: (adharCardResponse) {
            // Update Aadhaar verification status
            isVerified = adharCardResponse.adharCardResponse!.status ==
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
            child: ui_card.DigitCard(
              margin: const EdgeInsets.all(8),
              cardType: CardType.primary,
              children: [
                TextChunk(
                  heading: t.translate(
                    i18.wageSeeker.identificationHeader,
                  ),
                  // style: DigitTheme
                  //     .instance.mobileTheme.textTheme.displayMedium
                  //     ?.apply(color: const DigitColors().black),
                ),
                // DigitReactiveDropdown<String>(
                //   label: t.translate(i18.wageSeeker.identityDocumentLabel),
                //   //TODO:[temp commented for adhar release ]
                //   // menuItems: [
                //   //   "AADHAAR",
                //   //   "Election Photo Identity Card(EPIC)",
                //   //   "Driving License",
                //   //   "Ration Card under TPDS"
                //   // ].map((e) => e.toString()).toList(),
                // menuItems: [
                //   "AADHAAR",
                // ].map((e) => e.toString()).toList(),
                //   isRequired: true,
                //   formControlName: identityDocument,
                //   valueMapper: (value) => t.translate('CBO_CORE_COMMON_$value'),
                //   onChanged: (value) {
                //     //TODO:[temp comment for release]
                //     // adharSelect(value);
                //   },
                // ),

                ui_component.LabeledField(
                  // label: t.translate(i18.wageSeeker.identificationHeader),
                  child: ui_component.DigitDropdown(
                    selectedOption: DropdownItem(
                        name: t.translate('CBO_CORE_COMMON_AADHAAR'),
                        code: "AADHAAR".toString()),
                    items: [
                      "AADHAAR",
                    ]
                        .map((e) => DropdownItem(
                            name: t.translate('CBO_CORE_COMMON_$e'),
                            code: e.toString()))
                        .toList(),
                  ),
                ),

                // old
                // DigitTextFormField(
                //   padding: const EdgeInsets.only(
                //     top: 10,
                //     bottom: 0,
                //   ),
                //   onChanged: (p0) {
                //     //TODO:[aadhar temporarily commented for release]
                //     // if (adhar) {
                //     //   adharSelect("AADHAAR");
                //     // }
                //     // isVerifyDone(false);
                //     // context
                //     //     .read<WageSeekerCreateBloc>()
                //     //     .add(const CreateWageSeekerDisposeEvent());
                //   },
                //   formControlName: aadhaarNoKey,
                // label: t.translate(i18.wageSeeker.identityNumberLabel),
                //   isRequired: true,
                //   //TODO:[temp commented for release]
                //   // minLength: adhar ? 12 : null,
                //   // maxLength: adhar ? 12 : null,
                // minLength: adhar ? 12 : 12,
                // maxLength: adhar ? 12 : 12,
                // keyboardType: TextInputType.number,
                // inputFormatters: [
                //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                // ],
                // validationMessages: adhar
                //     ? {
                //         'required': (_) => t.translate(
                //               i18.wageSeeker.aadhaarRequired,
                //             ),
                //         'minLength': (_) => t.translate(
                //               i18.wageSeeker.minAadhaarCharacters,
                //             ),
                //         'maxLength': (_) => t.translate(
                //               i18.wageSeeker.maxAadhaarCharacters,
                //             ),
                //       }
                //     : {
                // 'required': (_) => t.translate(
                //       i18.wageSeeker.aadhaarRequired,
                //     ),
                // 'minLength': (_) => t.translate(
                //       i18.wageSeeker.minAadhaarCharacters,
                //     ),
                // 'maxLength': (_) => t.translate(
                //       i18.wageSeeker.maxAadhaarCharacters,
                //     ),
                //       },
                // ),
                // end

                ui_component.LabeledField(
                  label: t.translate(i18.wageSeeker.identityNumberLabel),
                  isRequired: true,
                  child: ReactiveWrapperField(
                    formControlName: aadhaarNoKey,
                    validationMessages: {
                      'required': (error) =>
                          t.translate(i18.wageSeeker.aadhaarRequired),
                      'minLength': (error) =>
                          t.translate(i18.wageSeeker.minAadhaarCharacters),
                      'maxLength': (error) =>
                          t.translate(i18.wageSeeker.maxAadhaarCharacters),
                    },
                    showErrors: (control) => control.invalid && control.touched,
                    builder: (field) {
                      return DigitTextFormInput(
                        controller: TextEditingController()
                          ..text = form.control(aadhaarNoKey).value,
                        isRequired: true,
                        // minLength: 12,
                        // maxLength: 12,
                        onChange: (value) {
                          field.control.markAsTouched();

                          form.control(aadhaarNoKey).value = value;
                        },
                        charCount: true,

                        errorMessage: field.errorText,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        validations: [
                          ui_validation.Validator(
                              ui_validation.ValidatorType.minLength, 12,
                              errorMessage: t.translate(
                                  i18.wageSeeker.minAadhaarCharacters)),
                          ui_validation.Validator(
                              ui_validation.ValidatorType.maxLength, 12,
                              errorMessage: t.translate(
                                  i18.wageSeeker.maxAadhaarCharacters)),
                        ],
                      );
                    },
                  ),
                ),

//old
                // DigitTextFormField(
                //   padding: EdgeInsets.zero,
                //   onChanged: (p0) {
                //     //TODO:[temp commented for release]
                //     // if (adhar) {
                //     //   adharSelect("AADHAAR");
                //     // }
                //     // isVerifyDone(false);
                //     // context
                //     //     .read<WageSeekerCreateBloc>()
                //     //     .add(const CreateWageSeekerDisposeEvent());
                //   },
                //   formControlName: nameKey,
                //   isRequired: true,
                // label: t.translate(i18.wageSeeker.identityNameLabel),
                //   inputFormatters: [
                // FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
                //   ],
                //   validationMessages: {
                //     'required': (_) => t.translate(
                //           i18.wageSeeker.nameRequired,
                //         ),
                // 'minLength': (_) => t.translate(
                //       i18.wageSeeker.minNameCharacters,
                //     ),
                //     'maxLength': (_) => t.translate(
                //           i18.wageSeeker.maxNameCharacters,
                //         ),
                //   },
                // ),

                // end

                ui_component.LabeledField(
                  isRequired: true,
                  label: t.translate(i18.wageSeeker.identityNameLabel),
                  child: ReactiveWrapperField(
                    validationMessages: {
                      'required': (error) => t.translate(
                            i18.wageSeeker.aadhaarRequired,
                          ),
                      'minLength': (error) => t.translate(
                            i18.wageSeeker.minNameCharacters,
                          ),
                      'maxLength': (error) => t.translate(
                            i18.wageSeeker.maxNameCharacters,
                          ),
                    },
                    showErrors: (control) => control.invalid && control.touched,
                    formControlName: nameKey,
                    builder: (field) {
                      return DigitTextFormInput(
                        errorMessage: field.errorText,
                        controller: TextEditingController()
                          ..text = form.control(nameKey).value,
                        isRequired: true,
                        // minLength: 12,
                        // maxLength: 12,
                        onChange: (value) {
                          field.control.markAsTouched();
                          form.control(nameKey).value = value;
                        },

                        validations: [
                          ui_validation.Validator(
                              ui_validation.ValidatorType.minLength, 2,
                              errorMessage: t.translate(
                                i18.wageSeeker.minNameCharacters,
                              )),
                          ui_validation.Validator(
                            ui_validation.ValidatorType.required,
                            "",
                            errorMessage: t.translate(
                              i18.wageSeeker.aadhaarRequired,
                            ),
                          ),
                        ],
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
                        ],
                      );
                    },
                  ),
                ),

                // adhar
                //     ? BlocBuilder<WageSeekerCreateBloc, WageSeekerCreateState>(
                //         builder: (context, state) {
                //           return state.maybeWhen(
                //             orElse: () => const Offstage(),
                //             loaded: (value) {
                //               return const SizedBox.shrink();
                //             },
                //             loading: () {
                //               return const Center(
                //                 child: CircularProgressIndicator.adaptive(),
                //               );
                //             },
                //             initial: () {
                //               return Padding(
                //                 padding: const EdgeInsets.only(bottom: 8.0),
                //                 child: SizedBox(
                //                   width: MediaQuery.of(context).size.width,
                //                   child: TextButton(
                //                     style: OutlinedButton.styleFrom(
                //                       side: BorderSide(
                //                         width: 1.0,
                //                         color: Theme.of(context)
                //                             .colorScheme
                //                             .primary,
                //                       ),
                //                     ),
                //                     onPressed: () {
                //                       form.markAllAsTouched(
                //                           updateParent: false);
                //                       if (!form.valid) return;
                //                       if (FocusScope.of(context).hasFocus) {
                //                         FocusScope.of(context).unfocus();
                //                       }
                //                       context.read<WageSeekerCreateBloc>().add(
                //                             VerifyAdharEvent(
                //                                 name: form.value[nameKey]
                //                                     .toString(),
                //                                 uid: form.value[aadhaarNoKey]
                //                                     .toString()),
                //                           );
                //                     },
                //                     child: Text(
                //                       t.translate(i18.wageSeeker.adharValidate),
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //             verified: (value) {
                //               return Center(
                //                 child: Padding(
                //                   padding: const EdgeInsets.only(bottom: 8.0),
                //                   child: CommonInfoCard(
                //                     color:
                //                         value!.status == Constants.verifyAdhar
                //                             ? Colors.green
                //                             : Colors.red,
                //                     widget: Padding(
                //                       padding: const EdgeInsets.all(8.0),
                //                       child: Row(
                //                         children: [
                //                           Flexible(
                //                             flex: 0,
                //                             child: value.status ==
                //                                     Constants.verifyAdhar
                //                                 ? const CircleAvatar(
                //                                     radius: 18,
                //                                     backgroundColor:
                //                                         Colors.green,
                //                                     child: Icon(
                //                                       Icons.done,
                //                                       color: Colors.white,
                //                                       size: 30,
                //                                     ),
                //                                   )
                //                                 : const Icon(
                //                                     Icons.error_outline,
                //                                     color: Colors.red,
                //                                     size: 28,
                //                                   ),
                //                           ),
                //                           Flexible(
                //                             flex: 3,
                //                             child: Padding(
                //                               padding: const EdgeInsets.only(
                //                                   left: 8.0),
                //                               child: Text(
                //                                 value.status ==
                //                                         Constants.verifyAdhar
                //                                     ? t.translate(i18.wageSeeker
                //                                         .adharVerifySuccess)
                //                                     : t.translate(i18.wageSeeker
                //                                         .adharVerifyError),
                //                                 style: TextStyle(
                //                                   fontSize: 15,
                //                                   color: value.status ==
                //                                           Constants.verifyAdhar
                //                                       ? Colors.green
                //                                       : Colors.red,
                //                                 ),
                //                               ),
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //             error: (error) {
                //               return Center(
                //                 child: SizedBox(
                //                   height: 50,
                //                   child: Text(
                //                     t.translate(
                //                         i18.wageSeeker.adharVerifyFailed),
                //                     style: const TextStyle(
                //                       fontSize: 15,
                //                       color: Colors.red,
                //                     ),
                //                   ),
                //                 ),
                //               );
                //             },
                //           );
                //         },
                //       )
                //     : const SizedBox.shrink(),
                // old
                // Center(
                //   child: DigitElevatedButton(
                // onPressed: (adhar)
                //     ? isVerified
                //         ? () {
                //             form.markAllAsTouched(updateParent: false);
                //             if (!form.valid) return;
                //             final adharState = context
                //                 .read<WageSeekerCreateBloc>()
                //                 .state;

                //             AdharCardResponse? s = adharState.maybeMap(
                //               orElse: () => const AdharCardResponse(),
                //               verified: (value) {
                //                 return value.adharCardResponse;
                //               },
                //             );
                //             context.read<WageSeekerBloc>().add(
                //                   WageSeekerIdentificationCreateEvent(
                //                       adharVerified: true,
                //                       documentType: form
                //                           .value[identityDocument]
                //                           .toString(),
                //                       name:
                //                           form.value[nameKey].toString(),
                //                       number: form.value[aadhaarNoKey]
                //                           .toString(),
                //                       timeStamp: DateTime.now()
                //                           .millisecondsSinceEpoch,
                //                       adharCardResponse: s),
                //                 );
                //             setState(() {
                //               switchPage = 1;
                //             });
                //           }
                //         : null
                //     : () {
                //         form.markAllAsTouched(updateParent: false);
                //         if (!form.valid) return;

                //         context.read<WageSeekerBloc>().add(
                //               WageSeekerIdentificationCreateEvent(
                //                   adharVerified: false,
                //                   documentType: form
                //                       .value[identityDocument]
                //                       .toString(),
                //                   name: form.value[nameKey].toString(),
                //                   number:
                //                       form.value[aadhaarNoKey].toString(),
                //                   timeStamp: DateTime.now()
                //                       .millisecondsSinceEpoch,
                //                   adharCardResponse:
                //                       const AdharCardResponse()),
                //             );
                //         setState(() {
                //           switchPage = 1;
                //         });
                //       },
                //       child: Center(
                // child: Text(t.translate(i18.common.next)),
                //       )),
                // )

                Button(
                  label: t.translate(i18.common.next),
                  onPressed: () {
                    form.markAllAsTouched(updateParent: false);
                    // setState(() {});
                    if (!form.valid) return;

                    context.read<WageSeekerBloc>().add(
                          WageSeekerIdentificationCreateEvent(
                              adharVerified: false,
                              documentType:
                                  form.value[identityDocument].toString(),
                              name: form.value[nameKey].toString(),
                              number: form.value[aadhaarNoKey].toString(),
                              timeStamp: DateTime.now().millisecondsSinceEpoch,
                              adharCardResponse: const AdharCardResponse()),
                        );
                    setState(() {
                      switchPage = 1;
                    });
                  },
                  type: ButtonType.primary,
                  size: ButtonSize.large,
                  mainAxisSize: MainAxisSize.max,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  // Build Reactive Forms FormGroup for identification details
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
                    Validators.minLength(12),
                    Validators.maxLength(12)
                  ]),
        nameKey: FormControl<String>(
            value: individualDetails.name ?? '',
            validators: [
              Validators.required,
              Validators.minLength(2),
              Validators.maxLength(128)
            ]),
        identityDocument: FormControl<String>(
            value: individualDetails.documentType ?? "AADHAAR",
            validators: [
              Validators.required,
            ]),
      });
}
