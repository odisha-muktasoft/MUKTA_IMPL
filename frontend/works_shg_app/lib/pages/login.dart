

//  latest code with eye icon

/// working latest code

// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:digit_components/digit_components.dart';
// import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:works_shg_app/blocs/auth/auth.dart';
// import 'package:works_shg_app/blocs/auth/otp_bloc.dart';
// import 'package:works_shg_app/models/init_mdms/init_mdms_model.dart';
// import 'package:works_shg_app/router/app_router.dart';
// import 'package:works_shg_app/utils/global_variables.dart';
// import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
//     as i18;
// import 'package:works_shg_app/widgets/atoms/app_logo.dart';

// import '../blocs/app_initilization/app_initilization.dart';
// import '../blocs/localization/app_localization.dart';
// import '../utils/employee/support_services.dart';
// import '../utils/notifiers.dart';
// import '../widgets/molecules/desktop_view.dart';
// import '../widgets/molecules/mobile_view.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<StatefulWidget> createState() {
//     return _LoginPage();
//   }
// }

// class _LoginPage extends State<LoginPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   var userIdController = TextEditingController();

//   var userNameController = TextEditingController();
//   var userPasswordController = TextEditingController();
//   bool canContinue = false;
//   final formKey = GlobalKey<FormState>();
//   bool autoValidation = false;
//   bool phoneNumberAutoValidation = false;
//   final FocusNode _numberFocus = FocusNode();
//   String selectTenantId = "";

//   bool iconVisibility = true;
//   List<DigitRowCardModel> btns = [
//     const DigitRowCardModel(label: "CBO", value: "", isSelected: true),
//     const DigitRowCardModel(label: "Employee", value: "", isSelected: false)
//   ];

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.addListener(_handleTabSelection);
//     _numberFocus.addListener(_onFocusChange);
//     super.initState();
//   }

//   void _handleTabSelection() {
//     userIdController.clear();
//     userNameController.clear();
//     userPasswordController.clear();
//     setState(() {});
//   }

//   @override
//   dispose() {
//     _tabController.dispose();
//     _tabController.removeListener(_handleTabSelection);
//     _numberFocus.removeListener(_onFocusChange);
//     super.dispose();
//   }

//   @override
//   void deactivate() {
//     context.read<OTPBloc>().add(
//           const DisposeOTPEvent(),
//         );
//     super.deactivate();
//   }

//   void _onFocusChange() {
//     if (!_numberFocus.hasFocus) {
//       setState(() {
//         phoneNumberAutoValidation = true;
//       });
//     }
//   }

//   Widget getLoginCard(AppLocalizations t, BuildContext loginContext,
//       AppInitializationState data) {
//     return Center(
//       child: Form(
//         key: formKey,
//         autovalidateMode: autoValidation
//             ? AutovalidateMode.always
//             : AutovalidateMode.disabled,
//         child: DigitCard(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const AppLogo(),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                     AppLocalizations.of(loginContext)
//                         .translate(i18.login.loginLabel),
//                     style: const TextStyle(
//                         fontSize: 18, fontWeight: FontWeight.w700)),
//               ),
//               TabBar(
//                   controller: _tabController,
//                   labelColor: const DigitColors().burningOrange,
//                   unselectedLabelColor: Colors.black,
//                   tabs:  [
//                     Tab(
//                       child: Text(
//                          AppLocalizations.of(loginContext).translate(i18.measurementBook.mbCbo),
//                       ),
//                     ),
//                     Tab(
//                       child: Text(
//                         AppLocalizations.of(loginContext).translate(i18.measurementBook.mbEmployee),
//                       ),
//                     ),
//                   ]),
//               AnimatedContainer(
//                 height: _tabController.index == 0 ? 120 : 325,
//                 duration: Duration(
//                     milliseconds: _tabController.index == 0 ? 100 : 100),
//                 child: TabBarView(
//                     physics: const NeverScrollableScrollPhysics(),
//                     controller: _tabController,
//                     children: [
//                       cboLogin(loginContext),
//                       employeeLogin(t, loginContext, data,
//                           userName: userNameController,
//                           userpassword: userPasswordController)
//                     ]),
//               ),
//               _tabController.index == 0
//                   ? BlocListener<OTPBloc, OTPBlocState>(
//                       listener: (context, state) {
//                         state.maybeWhen(
//                             orElse: () => Container(),
//                             loaded: () {
//                               context.router.push(OTPVerificationRoute(
//                                   mobileNumber: userIdController.text));
//                             },
//                             error: () => Notifiers.getToastMessage(
//                                 context,
//                                 AppLocalizations.of(context).translate(
//                                     i18.login.enteredMobileNotRegistered),
//                                 'ERROR'));
//                       },
//                       child: DigitElevatedButton(
//                         onPressed: canContinue
//                             ? () {
//                                 if (formKey.currentState!.validate()) {
//                                   loginContext.read<OTPBloc>().add(
//                                         OTPSendEvent(
//                                           mobileNumber: userIdController.text,
//                                         ),
//                                       );
//                                 } else {
//                                   setState(() {
//                                     autoValidation = true;
//                                   });
//                                 }
//                               }
//                             : null,
//                         child: Center(
//                           child: Text(AppLocalizations.of(loginContext)
//                               .translate(i18.common.continueLabel)),
//                         ),
//                       ),
//                     )
//                   : BlocListener<AuthBloc, AuthState>(
//                       listener: (context, state) {
//                         state.maybeWhen(
//                             error: () {
//                               Notifiers.getToastMessage(
//                                   context,
//                                   AppLocalizations.of(context).translate(
//                                       _tabController.index == 0
//                                           ? i18.login.invalidOTP
//                                           : i18.common.empLoginError),
//                                   'ERROR');
//                             },
//                             orElse: () => Container());
//                       },
//                       child: DigitElevatedButton(
//                         onPressed: () {
//                           if (userNameController.text != "" &&
//                               userPasswordController.text != "" &&
//                               selectTenantId != "") {
//                             context.read<AuthBloc>().add(
//                                   AuthLoginEvent(
//                                     userId: userNameController.text,
//                                     password: userPasswordController.text,
//                                     roleType: RoleType.employee,
//                                     tenantId: selectTenantId.toString(),
//                                   ),
//                                 );
//                           } else {
//                             Notifiers.getToastMessage(
//                                 context,
//                                 AppLocalizations.of(context)
//                                     .translate(i18.common.allFieldsMandatory),
//                                 'ERROR');
//                           }
//                         },
//                         child: Center(
//                           child: Text(AppLocalizations.of(loginContext)
//                               .translate(i18.common.continueLabel)),
//                         ),
//                       ),
//                     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<dynamic> forgotPassword(AppLocalizations t) {
//     return showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
//           titlePadding:
//               const EdgeInsets.only(top: 16.0, left: 5.0, bottom: 2.0),
//           title: Text(t.translate(i18.login.forgotPassword)),
//           content: SizedBox(
//             width: MediaQuery.sizeOf(context).width,
//             height: 120,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: 12.0, top: 0.0),
//                   child: Text(
//                     t.translate(i18.login.forgotPasswordMsg),
//                     style: DigitTheme.instance.mobileTheme.textTheme.titleSmall,
//                   ),
//                 ),
//                 DigitElevatedButton(
//                   child: Text(t.translate(i18.common.oK)),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   SizedBox cboLogin(BuildContext loginContext) {
//     return SizedBox(
//       height: (MediaQuery.sizeOf(loginContext).height) * 0.7,
//       child: SingleChildScrollView(
//         child: DigitTextField(
//           label:
//               '${AppLocalizations.of(loginContext).translate(i18.common.mobileNumber)}*',
//           controller: userIdController,
//           isRequired: true,
//           prefixText: '+91 - ',
//           focusNode: _numberFocus,
//           autoValidation: phoneNumberAutoValidation
//               ? AutovalidateMode.always
//               : AutovalidateMode.disabled,
//           textInputType: TextInputType.number,
//           inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
//           validator: (val) {
//             if (val!.trim().isEmpty || val!.trim().length != 10) {
//               return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
//             }
//             return null;
//           },
//           onChange: (value) {
//             setState(() {
//               canContinue = value.length == 10;
//             });
//             if (value.length == 10) {
//               _numberFocus.unfocus();
//             }
//           },
//           maxLength: 10,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     var t = AppLocalizations.of(context);
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//           appBar: AppBar(
//             automaticallyImplyLeading: true,
//           ),
//           body: BlocBuilder<AppInitializationBloc, AppInitializationState>(
//             builder: (context, state) {
//               return LayoutBuilder(builder: (context, constraints) {
//                 if (constraints.maxWidth < 720) {
//                   return Center(
//                     child: MobileView(
//                       getLoginCard(t, context, state),
//                       GlobalVariables.stateInfoListModel!.bannerUrl.toString(),
//                       logoBottomPosition: (constraints.maxHeight / 8) + 50,
//                       cardBottomPosition: (constraints.maxHeight / 3),
//                     ),
//                   );
//                 } else {
//                   return DesktopView(getLoginCard(t, context, state),
//                       GlobalVariables.stateInfoListModel!.bannerUrl.toString());
//                 }
//               });
//             },
//           )),
//     );
//   }

//   SizedBox employeeLogin(
//       AppLocalizations t, BuildContext context, AppInitializationState data,
//       {required TextEditingController userName,
//       required TextEditingController userpassword}) {
//     return SizedBox(
//       height: (MediaQuery.sizeOf(context).height) * 0.7,
//       child: Column(
//         children: [
//           DigitTextField(
//             label:
//                 '${AppLocalizations.of(context).translate(i18.login.loginUserName)}*',
//             controller: userName,
//             isRequired: true,
//             validator: (val) {
//               if (val!.trim().isEmpty || val!.trim().length != 10) {
//                 return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
//               }
//               return null;
//             },
//             onChange: (value) {},
//           ),
//           DigitTextField(
//             maxLines: 1,
//             label:
//                 '${AppLocalizations.of(context).translate(i18.login.loginPassword)}*',
//             controller: userpassword,
//             isRequired: true,
//             obscureText: iconVisibility,
//             suffixIcon: Padding(
//               padding: const EdgeInsets.all(0.0),
//               child: IconButton(
//                   onPressed: () {
//                     setState(() {
//                       iconVisibility = !iconVisibility;
//                     });
//                   },
//                   icon: Icon(
//                     iconVisibility
//                         ? Icons.visibility_rounded
//                         : Icons.visibility_off_rounded,
//                     size: 30,
//                   )),
//             ),
//             //  focusNode: _numberFocus,
//             validator: (val) {
//               if (val!.trim().isEmpty || val!.trim() == "") {
//                 return '${AppLocalizations.of(context).translate(i18.login.pleaseEnterMobile)}';
//               }
//               return null;
//             },
//             onChange: (value) {},
//           ),
//           DigitDropdown(
//               onChanged: (value) {
//                 setState(() {
//                   selectTenantId = value?.code ?? "";
//                 });
//               },
//               value: null,
//               label: "${t.translate(i18.common.city)} *",
//               menuItems: data!.initMdmsModel!.tenant!.tenantListModel!,
//               valueMapper: (value) {
//                 return t.translate(Conversion.convertToTenant(value!.code!));
//               }),

         
//           DigitIconButton(
//             iconText: t.translate(i18.login.forgotPassword),
//             onPressed: () {
//               forgotPassword(t);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

/// end
/// 

/// second
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/blocs/auth/otp_bloc.dart';
import 'package:works_shg_app/models/init_mdms/init_mdms_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/global_variables.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart' as i18;
import 'package:works_shg_app/widgets/atoms/app_logo.dart';

import '../blocs/app_initilization/app_initilization.dart';
import '../blocs/localization/app_localization.dart';
import '../utils/employee/support_services.dart';
import '../utils/notifiers.dart';
import '../widgets/molecules/desktop_view.dart';
import '../widgets/molecules/mobile_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final userIdController = TextEditingController();
  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  bool canContinue = false;
  final formKey = GlobalKey<FormState>();
  bool autoValidation = false;
  bool phoneNumberAutoValidation = false;
  final FocusNode _numberFocus = FocusNode();
  String selectTenantId = "";

  bool iconVisibility = true;
  List<DigitRowCardModel> btns = [
    const DigitRowCardModel(label: "CBO", value: "", isSelected: true),
    const DigitRowCardModel(label: "Employee", value: "", isSelected: false)
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _numberFocus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    _numberFocus.removeListener(_onFocusChange);
    userIdController.dispose();
    userNameController.dispose();
    userPasswordController.dispose();
    _numberFocus.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    userIdController.clear();
    userNameController.clear();
    userPasswordController.clear();
    setState(() {});
  }

  void _onFocusChange() {
    if (!_numberFocus.hasFocus) {
      setState(() {
        phoneNumberAutoValidation = true;
      });
    }
  }

  Widget getLoginCard(AppLocalizations t, BuildContext loginContext, AppInitializationState data) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autoValidation ? AutovalidateMode.always : AutovalidateMode.disabled,
        child: DigitCard(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const AppLogo(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  t.translate(i18.login.loginLabel),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: const DigitColors().burningOrange,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(t.translate(i18.measurementBook.mbCbo)),
                  ),
                  Tab(
                    child: Text(t.translate(i18.measurementBook.mbEmployee)),
                  ),
                ],
              ),
              AnimatedContainer(
                height: _tabController.index == 0 ? 120 : 325,
                duration: const Duration(milliseconds: 100),
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [
                    cboLogin(loginContext),
                    employeeLogin(t, loginContext, data,),
                  ],
                ),
              ),
              _buildLoginButton(t, loginContext),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(AppLocalizations t, BuildContext loginContext) {
    if (_tabController.index == 0) {
      return BlocListener<OTPBloc, OTPBlocState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loaded: () {
              context.router.push(OTPVerificationRoute(mobileNumber: userIdController.text));
            },
            error: () {
              Notifiers.getToastMessage(
                context,
                t.translate(i18.login.enteredMobileNotRegistered),
                'ERROR',
              );
            },
          );
        },
        child: DigitElevatedButton(
          onPressed: canContinue
              ? () {
                  if (formKey.currentState!.validate()) {
                    loginContext.read<OTPBloc>().add(OTPSendEvent(mobileNumber: userIdController.text));
                  } else {
                    setState(() {
                      autoValidation = true;
                    });
                  }
                }
              : null,
          child: Center(
            child: Text(t.translate(i18.common.continueLabel)),
          ),
        ),
      );
    } else {
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            error: () {
              Notifiers.getToastMessage(
                context,
                t.translate(i18.common.empLoginError),
                'ERROR',
              );
            },
            orElse: () {},
          );
        },
        child: DigitElevatedButton(
          onPressed: () {
            if (userNameController.text.isNotEmpty &&
                userPasswordController.text.isNotEmpty &&
                selectTenantId.isNotEmpty) {
              context.read<AuthBloc>().add(
                    AuthLoginEvent(
                      userId: userNameController.text,
                      password: userPasswordController.text,
                      roleType: RoleType.employee,
                      tenantId: selectTenantId,
                    ),
                  );
            } else {
              Notifiers.getToastMessage(
                context,
                t.translate(i18.common.allFieldsMandatory),
                'ERROR',
              );
            }
          },
          child: Center(
            child: Text(t.translate(i18.common.continueLabel)),
          ),
        ),
      );
    }
  }

  Future<dynamic> forgotPassword(AppLocalizations t) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          titlePadding: const EdgeInsets.only(top: 16.0, left: 5.0, bottom: 2.0),
          title: Text(t.translate(i18.login.forgotPassword)),
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    t.translate(i18.login.forgotPasswordMsg),
                    style: DigitTheme.instance.mobileTheme.textTheme.titleSmall,
                  ),
                ),
                DigitElevatedButton(
                  child: Text(t.translate(i18.common.oK)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox cboLogin(BuildContext loginContext) {
    return SizedBox(
      height: MediaQuery.of(loginContext).size.height * 0.7,
      child: SingleChildScrollView(
        child: DigitTextField(
          label: '${AppLocalizations.of(loginContext).translate(i18.common.mobileNumber)}*',
          controller: userIdController,
          isRequired: true,
          prefixText: '+91 - ',
          focusNode: _numberFocus,
          autoValidation: phoneNumberAutoValidation ? AutovalidateMode.always : AutovalidateMode.disabled,
          textInputType: TextInputType.number,
          inputFormatter: [FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
          validator: (val) {
            if (val!.trim().isEmpty || val.trim().length != 10) {
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
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: BlocBuilder<AppInitializationBloc, AppInitializationState>(
          builder: (context, state) {
            return LayoutBuilder(builder: (context, constraints) {
              if (constraints.maxWidth < 720) {
                return Center(
                  child: MobileView(
                    getLoginCard(t, context, state),
                    GlobalVariables.stateInfoListModel!.bannerUrl.toString(),
                    logoBottomPosition: (constraints.maxHeight / 8) + 50,
                    cardBottomPosition: (constraints.maxHeight / 4.5),
                  ),
                );
              } else {
                return DesktopView(
                  getLoginCard(t, context, state),
                  GlobalVariables.stateInfoListModel!.bannerUrl.toString(),
                );
              }
            });
          },
        ),
      ),
    );
  }

  SizedBox employeeLogin(AppLocalizations t, BuildContext context, AppInitializationState data,
     ) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          DigitTextField(
            label: '${t.translate(i18.login.loginUserName)}*',
            controller: userNameController,
            isRequired: true,
            validator: (val) {
              if (val!.trim().isEmpty) {
                return '${t.translate(i18.login.pleaseEnterMobile)}';
              }
              return null;
            },
            onChange: (value) {},
          ),
          DigitTextField(
            maxLines: 1,
            label: '${t.translate(i18.login.loginPassword)}*',
            controller: userPasswordController,
            isRequired: true,
            obscureText: iconVisibility,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  iconVisibility = !iconVisibility;
                });
              },
              icon: Icon(
                iconVisibility ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                size: 30,
              ),
            ),
            validator: (val) {
              if (val!.trim().isEmpty) {
                return '${t.translate(i18.login.pleaseEnterMobile)}';
              }
              return null;
            },
            onChange: (value) {},
          ),
          DigitDropdown(
            onChanged: (value) {
              setState(() {
                selectTenantId = value?.code ?? "";
              });
            },
            value: null,
            label: "${t.translate(i18.common.city)} *",
            menuItems: data.initMdmsModel!.tenant!.tenantListModel!,
            valueMapper: (value) => t.translate(Conversion.convertToTenant(value!.code!)),
          ),
          DigitIconButton(
            iconText: t.translate(i18.login.forgotPassword),
            onPressed: () {
              forgotPassword(t);
            },
          ),
        ],
      ),
    );
  }
}
/// end
/// 



