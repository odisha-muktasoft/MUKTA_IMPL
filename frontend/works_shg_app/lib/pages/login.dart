import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/blocs/auth/otp_bloc.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/widgets/atoms/app_logo.dart';

import '../blocs/app_initilization/app_initilization.dart';
import '../blocs/localization/app_localization.dart';
import '../utils/notifiers.dart';
import '../widgets/molecules/desktop_view.dart';
import '../widgets/molecules/mobile_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  var userIdController = TextEditingController();

  var userNameController = TextEditingController();
  var userPasswordController = TextEditingController();
  bool canContinue = false;
  final formKey = GlobalKey<FormState>();
  bool autoValidation = false;
  bool phoneNumberAutoValidation = false;
  final FocusNode _numberFocus = FocusNode();

  List<DigitRowCardModel> btns = [
    const DigitRowCardModel(label: "CBO", value: "", isSelected: true),
    const DigitRowCardModel(label: "Employee", value: "", isSelected: false)
  ];

  @override
  void initState() {
    _numberFocus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  dispose() {
    _numberFocus.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  void deactivate() {
    context.read<OTPBloc>().add(
          const DisposeOTPEvent(),
        );
    super.deactivate();
  }

  void _onFocusChange() {
    if (!_numberFocus.hasFocus) {
      setState(() {
        phoneNumberAutoValidation = true;
      });
    }
  }

  Widget getLoginCard(BuildContext loginContext, AppInitializationState data) {
    return Form(
      key: formKey,
      autovalidateMode:
          autoValidation ? AutovalidateMode.always : AutovalidateMode.disabled,
      child: DigitCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLogo(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  AppLocalizations.of(loginContext)
                      .translate(i18.login.loginLabel),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w700)),
            ),
            btns.first.isSelected
                ? cboLogin(loginContext)
                : employeeLogin(loginContext, data,
                    userName: userNameController,
                    userpassword: userPasswordController),
            const SizedBox(height: 16),
            DigitRowCard(
              onChanged: (value) {
                userIdController.clear();
                userNameController.clear();
                userPasswordController.clear();
                setState(() {
                  final m = btns.map((e) {
                    if (e.label == value.label) {
                      final s = DigitRowCardModel(
                          label: e.label, value: e.value, isSelected: true);
                      return s;
                    } else {
                      final k = DigitRowCardModel(
                          label: e.label, value: e.value, isSelected: false);
                      return k;
                    }
                  }).toList();
                  btns.clear();
                  btns.addAll(m);
                });
              },
              rowItems: btns,
              width: MediaQuery.of(context).size.width > 720
                  ? (MediaQuery.of(context).size.width / (2 * 3)) - 20
                  : (MediaQuery.of(context).size.width / 2) - 16 * 2,
            ),
            const SizedBox(
              height: 10,
            ),
            btns.first.isSelected
                ? BlocListener<OTPBloc, OTPBlocState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () => Container(),
                          loaded: () {
                            context.router.push(OTPVerificationRoute(
                                mobileNumber: userIdController.text));
                          },
                          error: () => Notifiers.getToastMessage(
                              context,
                              AppLocalizations.of(context).translate(
                                  i18.login.enteredMobileNotRegistered),
                              'ERROR'));
                    },
                    child: DigitElevatedButton(
                      onPressed: canContinue
                          ? () {
                              if (formKey.currentState!.validate()) {
                                loginContext.read<OTPBloc>().add(
                                      OTPSendEvent(
                                        mobileNumber: userIdController.text,
                                      ),
                                    );
                              } else {
                                setState(() {
                                  autoValidation = true;
                                });
                              }
                            }
                          : null,
                      child: Center(
                        child: Text(AppLocalizations.of(loginContext)
                            .translate(i18.common.continueLabel)),
                      ),
                    ),
                  )
                : BlocListener<AuthBloc, AuthState>(
                    listener: (context, state) {

                      state.maybeWhen(
                        error: () {
                          Notifiers.getToastMessage(
                              context,
                              AppLocalizations.of(context)
                                  .translate(i18.login.invalidOTP),
                              'ERROR');
                         
                        },
                        orElse: () => Container());
                    },
                    child: DigitElevatedButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              AuthLoginEvent(
                                userId: userNameController.text,
                                password: userPasswordController.text,
                                roleType: RoleType.employee,
                              ),
                            );
                      },
                      child: Center(
                        child: Text(AppLocalizations.of(loginContext)
                            .translate(i18.common.continueLabel)),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  DigitTextField cboLogin(BuildContext loginContext) {
    return DigitTextField(
      label:
          '${AppLocalizations.of(loginContext).translate(i18.common.mobileNumber)}*',
      controller: userIdController,
      isRequired: true,
      prefixText: '+91 - ',
      focusNode: _numberFocus,
      autoValidation: phoneNumberAutoValidation
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      textInputType: TextInputType.number,
      inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
      validator: (val) {
        if (val!.trim().isEmpty || val!.trim().length != 10) {
          return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
        }
        return null;
      },
      onChange: (value) {
        setState(() {
          canContinue = value.length == 10;
        });
        if (value.length == 10) {
          _numberFocus.unfocus();
        }
      },
      maxLength: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: BlocBuilder<AppInitializationBloc, AppInitializationState>(
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 720) {
                return MobileView(
                  getLoginCard(context, state),
                  GlobalVariables.stateInfoListModel!.bannerUrl.toString(),
                  logoBottomPosition: constraints.maxHeight / 8,
                  cardBottomPosition: constraints.maxHeight / 3,
                );
              } else {
                return DesktopView(getLoginCard(context, state),
                    GlobalVariables.stateInfoListModel!.bannerUrl.toString());
              }
            });
          },
        ));
  }

  Column employeeLogin(BuildContext context, AppInitializationState data,
      {required TextEditingController userName,
      required TextEditingController userpassword}) {
    return Column(
      children: [
        DigitTextField(
          label: 'User Name*',
          controller: userName,
          isRequired: true,
          validator: (val) {
            if (val!.trim().isEmpty || val!.trim().length != 10) {
              return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
            }
            return null;
          },
          onChange: (value) {},
        ),
        DigitTextField(
          label: 'Password*',
          controller: userpassword,
          isRequired: true,

          //  focusNode: _numberFocus,
          validator: (val) {
            if (val!.trim().isEmpty || val!.trim().length != 10) {
              return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
            }
            return null;
          },
          onChange: (value) {},
        ),
        DigitDropdown(
            onChanged: (value) {},
            value: null,
            label: "City *",
            menuItems: data!.initMdmsModel!.tenant!.tenantListModel!,
            valueMapper: (value) {
              return value!.code!;
            })
      ],
    );
  }
}
// const [
//               "testing",
//               "delhi",
//               "mumbai",
//               "bbsr",
//               "ctc",
//               "puri"
//             ]