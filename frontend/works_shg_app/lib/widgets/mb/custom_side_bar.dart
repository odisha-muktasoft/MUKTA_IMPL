import 'package:digit_ui_components/widgets/helper_widget/digit_profile.dart';
import 'package:digit_ui_components/widgets/molecules/hamburger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/app_initilization/app_initilization.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/blocs/localization/app_localization.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/utils/common_methods.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;

class MySideBar extends StatefulWidget {
  const MySideBar({super.key});

  @override
  State<MySideBar> createState() => _MySideBarState();
}

class _MySideBarState extends State<MySideBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const SizedBox.shrink(),
            loaded: (value) {
              return BlocBuilder<AppInitializationBloc, AppInitializationState>(
                builder: (context, stateInit) {
                  return BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, stateAuth) {
                      return stateAuth.maybeMap(
                        orElse: () => const SizedBox.shrink(),
                        loaded: (authValue) {
                          return SideBar(
                            profile: ProfileWidget(
                              title: authValue
                                      .userDetailsModel?.userRequestModel?.name
                                      .toString() ??
                                  '',
                              description: authValue.userDetailsModel
                                      ?.userRequestModel?.mobileNumber
                                      .toString() ??
                                  '',
                              leading: const SizedBox.shrink(),
                            ),
                            sidebarItems: [
                              SidebarItem(
                                title: AppLocalizations.of(context)
                                    .translate(i18.common.home),
                                icon: Icons.home,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate to Home
                                },
                              ),
                              SidebarItem(
                                children: stateInit.digitRowCardItems != null &&
                                        stateInit.isInitializationCompleted
                                    ? List.generate(
                                        value.languages != null
                                            ? value.languages!.length
                                            : 0,
                                        (index) => SidebarItem(
                                            title:
                                                value.languages![index].label,
                                            icon: Icons.language,
                                            onPressed: () {
                                              print("hello welcome");
                                              context
                                                  .read<LocalizationBloc>()
                                                  .add(
                                                    LocalizationEvent
                                                        .onSpecificLoadLocalization(
                                                      locale: value
                                                          .languages![index]
                                                          .value,
                                                      module: CommonMethods
                                                          .getLocaleModules(),
                                                      tenantId: stateInit
                                                          .initMdmsModel!
                                                          .commonMastersModel!
                                                          .stateInfoListModel!
                                                          .first
                                                          .code
                                                          .toString(),
                                                    ),
                                                  );
                                            }),
                                      ).toList()
                                    : [],
                                title: 'Language',
                                icon: Icons.language,
                                onPressed: () {
                                  print("object");
                                  // Implement language change
                                },
                              ),
                              SidebarItem(
                                title: 'Profile',
                                icon: Icons.person,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate to Profile
                                },
                              ),
                              SidebarItem(
                                title: 'View Downloaded Data',
                                icon: Icons.download,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Navigate to Downloaded Data
                                },
                              ),
                            ], logOutButtonLabel: 'LogOut',
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
}