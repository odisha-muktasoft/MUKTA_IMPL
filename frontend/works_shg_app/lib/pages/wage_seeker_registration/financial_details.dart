import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/text_chunk.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart'
    as ui_card;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:works_shg_app/services/urls.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

import '../../blocs/localization/app_localization.dart';
import '../../blocs/wage_seeker_registration/wage_seeker_registration_bloc.dart';
import '../../models/mdms/wage_seeker_mdms.dart';
import '../../models/wage_seeker/financial_details_model.dart';
import '../../models/wage_seeker/individual_details_model.dart';
import '../../models/wage_seeker/location_details_model.dart';
import '../../models/wage_seeker/skill_details_model.dart';
import '../../utils/notifiers.dart';
import '../../widgets/atoms/radio_button_list.dart';
import 'package:digit_ui_components/utils/validators/validator.dart'
    as ui_validation;
import 'package:digit_ui_components/digit_components.dart' as ui_component;

class FinancialDetailsPage extends StatefulWidget {
  final void Function() onPressed;
  final WageSeekerMDMS? wageSeekerMDMS;
  const FinancialDetailsPage(
      {required this.onPressed, this.wageSeekerMDMS, super.key});

  @override
  FinancialDetailsState createState() {
    return FinancialDetailsState();
  }
}

class FinancialDetailsState extends State<FinancialDetailsPage> {
  String accountType = '';
  FinancialDetails? financialDetails = FinancialDetails();
  IndividualDetails? individualDetails = IndividualDetails();
  LocationDetails? locationDetails = LocationDetails();
  SkillDetails? skillDetails = SkillDetails();
  String hintText = '';
  String bank = '';
  String branch = '';
  String accountHolderKey = 'accountHolder';
  String accountNoKey = 'accountNo';
  String reAccountNoKey = 'reAccountNo';
  String ifscCodeKey = 'ifscCode';
  String accountTypeKey = 'accountType';

  @override
  void initState() {
    super.initState();
    final registrationState = BlocProvider.of<WageSeekerBloc>(context).state;
    individualDetails = registrationState.individualDetails;
    skillDetails = registrationState.skillDetails;
    locationDetails = registrationState.locationDetails;
    if (registrationState.financialDetails != null) {
      financialDetails = registrationState.financialDetails;
      accountType =
          registrationState.financialDetails?.accountType.toString() ?? '';
      bank = registrationState.financialDetails?.bankName ?? '';
      branch = registrationState.financialDetails?.branchName ?? '';
      if (registrationState.financialDetails?.bankName != null) {
        hintText = hintText.isNotEmpty
            ? hintText
            : '${registrationState.financialDetails!.bankName}';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    List<String> accountTypeList = widget
        .wageSeekerMDMS!.worksMDMS!.bankAccType!
        .map((e) => e.code)
        .toList();
    return ReactiveFormBuilder(
      form: () => buildForm(financialDetails ?? FinancialDetails()),
      builder: (context, form, child) {
        if (financialDetails != null) {
          accountType = financialDetails!.accountType != null
              ? financialDetails!.accountType.toString()
              : accountType;
        }
        return ui_card.DigitCard(
          cardType: CardType.primary,
          margin: const EdgeInsets.all(8.0),
          children: [
            TextChunk(
              heading: t.translate(i18.common.financialDetails),
            ),

            // old

            // DigitTextFormField(
            //   padding: EdgeInsets.zero,
            //   formControlName: accountHolderKey,
            //   label: t.translate(i18.common.accountHolderName),
            //   isRequired: true,
            //   keyboardType: TextInputType.name,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
            //   ],
            //   validationMessages: {
            //     'required': (_) => t.translate(
            //           i18.wageSeeker.accountHolderNameRequired,
            //         ),
            //     'minLength': (_) => t.translate(
            //           i18.wageSeeker.minNameCharacters,
            //         ),
            //     'maxLength': (_) => t.translate(
            //           i18.wageSeeker.maxNameCharacters,
            //         ),
            //   },
            // ),
//end

            ui_component.LabeledField(
              isRequired: true,
              label: t.translate(i18.common.accountHolderName),
              child: ReactiveWrapperField(
                validationMessages: {
                  'required': (_) => t.translate(
                        i18.wageSeeker.accountHolderNameRequired,
                      ),
                  'minLength': (_) => t.translate(
                        i18.wageSeeker.minNameCharacters,
                      ),
                  'maxLength': (_) => t.translate(
                        i18.wageSeeker.maxNameCharacters,
                      ),
                },
                formControlName: accountHolderKey,
                builder: (field) {
                  return DigitTextFormInput(
                    //charCount: true,
                    controller: TextEditingController()
                      ..text = form.control(accountHolderKey).value ?? '',
                    onChange: (value) {
                      field.control.markAsTouched();

                      form.control(accountHolderKey).value = value;
                    },
                    errorMessage: field.errorText,
                    isRequired: true,
                    keyboardType: TextInputType.name,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
                    ],
                    // validations: [
                    //   ui_validation.Validator(
                    //       ui_validation.ValidatorType.maxLength, 8,
                    //       errorMessage: t.translate(
                    //           i18.wageSeeker.maxDoorNoCharacters)),
                    // ],
                  );
                },
              ),
            ),

//old
            // DigitTextFormField(
            //   padding: EdgeInsets.zero,
            //   formControlName: accountNoKey,
            //   label: t.translate(i18.common.accountNo),
            //   isRequired: true,
            //   obscureText: true,
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.allow(RegExp("[0-9]"))
            //   ],
            //   validationMessages: {
            //     'required': (_) => t.translate(
            //           i18.wageSeeker.accountNumberRequired,
            //         ),
            //     'mustMatch': (_) =>
            //         t.translate(i18.wageSeeker.reEnterAccountNumber),
            //     'minLength': (_) => t.translate(
            //           i18.wageSeeker.minAccNoCharacters,
            //         ),
            //     'maxLength': (_) => t.translate(
            //           i18.wageSeeker.maxAccNoCharacters,
            //         ),
            //   },
            // ),
//end

            ui_component.LabeledField(
              isRequired: true,
              label: t.translate(i18.common.accountNo),
              child: ReactiveWrapperField(
                validationMessages: {
                  'required': (_) => t.translate(
                        i18.wageSeeker.accountNumberRequired,
                      ),
                  'mustMatch': (_) =>
                      t.translate(i18.wageSeeker.reEnterAccountNumber),
                  'minLength': (_) => t.translate(
                        i18.wageSeeker.minAccNoCharacters,
                      ),
                  'maxLength': (_) => t.translate(
                        i18.wageSeeker.maxAccNoCharacters,
                      ),
                },
                formControlName: accountNoKey,
                builder: (field) {
                  return DigitTextFormInput(
                    // charCount: true,
                    controller: TextEditingController()
                      ..text = form.control(accountNoKey).value ?? '',
                    onChange: (value) {
                      field.control.markAsTouched();

                      form.control(accountNoKey).value = value;
                    },
                    errorMessage: field.errorText,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    validations: [
                      ui_validation.Validator(
                          ui_validation.ValidatorType.maxLength, 18,
                          errorMessage:
                              t.translate(i18.wageSeeker.maxAccNoCharacters)),
                      ui_validation.Validator(
                          ui_validation.ValidatorType.minLength, 8,
                          errorMessage:
                              t.translate(i18.wageSeeker.minAccNoCharacters)),
                      ui_validation.Validator(
                          ui_validation.ValidatorType.required, '',
                          errorMessage: t
                              .translate(i18.wageSeeker.accountNumberRequired)),
                    ],
                  );
                },
              ),
            ),

// old
            // DigitTextFormField(
            //   padding: EdgeInsets.zero,
            //   formControlName: reAccountNoKey,
            //   label: t.translate(i18.common.reEnterAccountNo),
            //   isRequired: true,
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.allow(RegExp("[0-9]"))
            //   ],
            //   validationMessages: {
            //     'mustMatch': (_) => AppLocalizations.of(context)
            //         .translate(i18.wageSeeker.reEnterAccountNumber)
            //   },
            // ),

// end

            ui_component.LabeledField(
              isRequired: true,
              label: t.translate(i18.common.reEnterAccountNo),
              child: ReactiveWrapperField(
                validationMessages: {
                  'mustMatch': (_) =>
                      t.translate(i18.wageSeeker.reEnterAccountNumber),
                },
                formControlName: reAccountNoKey,
                builder: (field) {
                  return DigitTextFormInput(
                    // charCount: true,
                    controller: TextEditingController()
                      ..text = form.control(reAccountNoKey).value ?? '',
                    onChange: (value) {
                      field.control.markAsTouched();

                      form.control(reAccountNoKey).value = value;
                    },
                    errorMessage: field.errorText,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    ],
                    // validations: [
                    //   ui_validation.Validator(
                    //       ui_validation.ValidatorType.maxLength, 18,
                    //       errorMessage: t.translate(
                    //           i18.wageSeeker.maxAccNoCharacters)),
                    //    ui_validation.Validator(
                    //       ui_validation.ValidatorType.minLength, 8,
                    //       errorMessage: t.translate(
                    //           i18.wageSeeker.minAccNoCharacters)),
                    //            ui_validation.Validator(
                    //       ui_validation.ValidatorType.required, '',
                    //       errorMessage: t.translate(
                    //           i18.wageSeeker.accountNumberRequired)),
                    // ],
                  );
                },
              ),
            ),

// old
            // StatefulBuilder(
            //     builder: (BuildContext context, StateSetter setState) {
            //   return DigitRadioButtonList<String>(
            //     labelText: t.translate(i18.common.accountType),
            //     formControlName: accountTypeKey,
            //     options: accountTypeList.map((e) => e.toString()).toList(),
            //     isRequired: true,
            //     valueMapper: (value) => t.translate(value),
            //     onValueChange: (value) {
            //       setState(() {
            //         accountType = value;
            //       });
            //     },
            //   );
            // }),

// end

            ui_component.LabeledField(
              label: t.translate(i18.common.accountType),
              isRequired: true,
              child: ReactiveWrapperField(
                validationMessages: {
                  "required": (error) =>
                      t.translate(i18.wageSeeker.accountTypeRequired),
                },
                showErrors: (control) => control.invalid && control.touched,
                formControlName: accountTypeKey,
                builder: (field) {
                  return RadioList(
                    errorMessage: field.errorText,
                    groupValue: form.control(accountTypeKey).value ?? '',
                    radioButtons: accountTypeList
                        .map((e) => RadioButtonModel(
                            code: e.toString(),
                            name: t.translate(e.toString())))
                        .toList(),
                    onChanged: (value) {
                      // genderController = value.code;
                      field.control.markAsTouched();

                      form.control(accountTypeKey).value = value.code;
                    },
                  );
                },
              ),
            ),

// old
            // DigitTextFormField(
            //   padding: EdgeInsets.zero,
            //   formControlName: ifscCodeKey,
            //   textCapitalization: TextCapitalization.characters,
            //   label: t.translate(i18.common.ifscCode),
            //   onChanged: (val) async {
            //     final url = Uri.parse(
            //         '${Urls.commonServices.bankDetails}/${form.value[ifscCodeKey]}');
            //     final response = await http.get(url);
            //     if (response.statusCode == 200) {
            //       final data = jsonDecode(response.body);
            //       final String bankName = data['BANK'];
            //       final String branchName = data['BRANCH'];

            //       setState(() {
            //         hintText = '$bankName, $branchName';
            //       });
            //     } else {
            //       setState(() {
            //         hintText = '';
            //       });
            //     }
            //   },
            //   isRequired: true,
            //   validationMessages: {
            //     'required': (_) => t.translate(
            //           i18.wageSeeker.ifscCodeRequired,
            //         ),
            //   },
            //   hintText: hintText,
            // ),
            // end

            ui_component.LabeledField(
              isRequired: true,
              label: t.translate(i18.common.ifscCode),
              child: ReactiveWrapperField(
                validationMessages: {
                  'required': (error) => t.translate(
                        i18.wageSeeker.ifscCodeRequired,
                      ),
                },
                formControlName: ifscCodeKey,
                builder: (field) {
                  return DigitTextFormInput(
                    helpText: hintText,
                    // charCount: true,
                    controller: TextEditingController()
                      ..text = form.control(ifscCodeKey).value ?? '',
                    onChange: (value) async {
                      field.control.markAsTouched();

                      form.control(ifscCodeKey).value = value;
                      final url = Uri.parse(
                          '${Urls.commonServices.bankDetails}/${form.value[ifscCodeKey]}');
                      final response = await http.get(url);
                      if (response.statusCode == 200) {
                        final data = jsonDecode(response.body);
                        final String bankName = data['BANK'];
                        final String branchName = data['BRANCH'];

                        setState(() {
                          hintText = '$bankName, $branchName';
                        });
                      } else {
                        setState(() {
                          hintText = '';
                        });
                      }
                    },
                    errorMessage: field.errorText,
                    isRequired: true,
                    keyboardType: TextInputType.text,
                    // inputFormatters: [
                    //   FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                    // ],
                    // validations: [
                    //   ui_validation.Validator(
                    //       ui_validation.ValidatorType.maxLength, 18,
                    //       errorMessage:
                    //           t.translate(i18.wageSeeker.maxAccNoCharacters)),
                    //   ui_validation.Validator(
                    //       ui_validation.ValidatorType.minLength, 8,
                    //       errorMessage:
                    //           t.translate(i18.wageSeeker.minAccNoCharacters)),
                    //   ui_validation.Validator(
                    //       ui_validation.ValidatorType.required, '',
                    //       errorMessage: t
                    //           .translate(i18.wageSeeker.accountNumberRequired)),
                    // ],
                  );
                },
              ),
            ),

            Center(
              child: Button(
                type: ButtonType.primary,
                size: ButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                onPressed: () {
                  form.markAllAsTouched(updateParent: false);
                  if (!form.valid) return;
                  if (hintText.isEmpty) {
                    // Notifiers.getToastMessage(
                    //     context, i18.wageSeeker.enterValidIFSC, 'ERROR');
                        Toast.showToast(context, message: t.translate(i18.wageSeeker.enterValidIFSC), type: ToastType.error);
                  } else {
                    final financeDetails = FinancialDetails(
                        accountHolderName:
                            form.value[accountHolderKey].toString(),
                        accountNumber: form.value[accountNoKey].toString(),
                        reAccountNumber: form.value[reAccountNoKey].toString(),
                        ifscCode:
                            form.value[ifscCodeKey].toString().toUpperCase(),
                        accountType: form.value[accountTypeKey].toString(),
                        bankName: hintText);
                    BlocProvider.of<WageSeekerBloc>(context).add(
                      WageSeekerCreateEvent(
                          individualDetails: individualDetails,
                          skillDetails: skillDetails,
                          locationDetails: locationDetails,
                          financialDetails: financeDetails),
                    );
                    widget.onPressed();
                  }
                },
                label: t.translate(i18.common.next),
              ),
            )
          ],
        );
      },
    );
  }

  FormGroup buildForm(FinancialDetails finance) => fb.group(<String, Object>{
        accountHolderKey: FormControl<String>(
            value: finance.accountHolderName,
            validators: [
              Validators.required,
              Validators.minLength(2),
              Validators.maxLength(128)
            ]),
        accountNoKey: FormControl<String>(
            value: finance.accountNumber,
            validators: [
              Validators.required,
              Validators.minLength(9),
              Validators.maxLength(18)
            ]),
        reAccountNoKey: FormControl<String>(value: finance.reAccountNumber),
        accountTypeKey: FormControl<String>(
            value: finance.accountType, validators: [Validators.required]),
        ifscCodeKey: FormControl<String>(value: finance.ifscCode, validators: [
          Validators.required,
        ]),
      }, [
        Validators.mustMatch(accountNoKey, reAccountNoKey)
      ]);
}
