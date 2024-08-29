import 'package:digit_components/digit_components.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/models/DropdownModels.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_toast.dart';
import 'package:digit_ui_components/widgets/helper_widget/digit_profile.dart';
import 'package:digit_ui_components/widgets/molecules/digit_header.dart';
import 'package:digit_ui_components/widgets/molecules/hamburger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:works_shg_app/blocs/app_initilization/app_initilization.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/models/app_config/app_config_model.dart';
import 'package:works_shg_app/models/employee/homeconfig/home_config_model.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/common_methods.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/utils/notifiers.dart';
import 'package:works_shg_app/widgets/button_link.dart';
import 'package:works_shg_app/widgets/atoms/app_bar_logo.dart';
import 'package:works_shg_app/widgets/atoms/empty_image.dart';
import 'package:works_shg_app/widgets/mb/custom_side_bar.dart';
import 'package:works_shg_app/widgets/new_custom_app_bar.dart';

import '../blocs/app_initilization/home_screen_bloc.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../blocs/organisation/org_search_bloc.dart';
import '../models/organisation/organisation_model.dart';
import '../models/screen_config/home_screen_config.dart';
import '../utils/constants.dart';
import '../utils/global_variables.dart';
// import '../widgets/side_bar.dart';
import '../widgets/drawer_wrapper.dart';
import '../widgets/loaders.dart' as shg_loader;

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => afterViewBuild());
    super.initState();
  }

  afterViewBuild() async {
    if (GlobalVariables.roleType == RoleType.cbo) {
      context.read<ORGSearchBloc>().add(
            SearchORGEvent(GlobalVariables.userRequestModel!['mobileNumber']),
          );
      context.read<HomeScreenBloc>().add(
            const GetHomeScreenConfigEvent(),
          );
    } else {
      context.read<HomeScreenBloc>().add(
            const GetEmpHomeScreenConfigEvent(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context);
    return Scaffold(
      //         actions: [

      //          HeaderAction(
      //             widget: Row(
      //               children: [
      //                 const Text('City'),
      //                 const SizedBox(
      //                   width: 8,
      //                 ),
      //                 Icon(
      //                   Icons.arrow_drop_down,
      //                   color: Colors.white,
      //                 )
      //               ],
      //             ),
      //             isSearchable: true,
      //             dropdownItems: const [
      //               DropdownItem(code: '1', name: 'Option 1'),
      //               DropdownItem(code: '2', name: 'Option 2'),
      //               DropdownItem(code: '3', name: 'Option 3'),
      //               DropdownItem(code: '4', name: 'Option 4'),
      //             ],
      //           ),
      //         ],
      //       ),

      //     ),
      //   ),
      // drawer: SideBar(
      //   sidebarItems: [
      //     SidebarItem(
      //       title: 'Home',
      //       icon: Icons.home,
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //         // Navigate to Home
      //       },
      //     ),
      //     SidebarItem(
      //       title: 'Language',
      //       icon: Icons.language,
      //       onPressed: () {
      //         // Implement language change
      //       },
      //     ),
      //     SidebarItem(
      //       title: 'Profile',
      //       icon: Icons.person,
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //         // Navigate to Profile
      //       },
      //     ),
      //     SidebarItem(
      //       title: 'View Downloaded Data',
      //       icon: Icons.download,
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //         // Navigate to Downloaded Data
      //       },
      //     ),
      //   ],
      // ),

      // appBar: AppBar(
      //   backgroundColor: const Color(0xff0B4B66),
      //   iconTheme: Theme.of(context)
      //       .iconTheme
      //       .copyWith(color: Theme.of(context).colorTheme.paper.primary),
      //   titleSpacing: 0,
      //   title: GlobalVariables.roleType == RoleType.cbo
      //       ? BlocBuilder<ORGSearchBloc, ORGSearchState>(
      //           builder: (context, state) {
      //             return state.maybeWhen(
      //                 orElse: () => Container(),
      //                 loaded: (OrganisationListModel? organisationListModel) {
      //                   return const AppBarLogo();
      //                 });
      //           },
      //         )
      //   : const AppBarLogo(),
      // ),

      appBar: customAppBar(),

      // drawer: DrawerWrapper(
      //   Drawer(
      //       child: GlobalVariables.roleType == RoleType.cbo
      //           ? BlocBuilder<ORGSearchBloc, ORGSearchState>(
      //               builder: (context, state) {
      //                 return state.maybeMap(
      //                   orElse: () {
      //                     return const SideBar();
      //                   },
      //                   loaded: (value) {
      //                     return SideBar(
      //                       module: CommonMethods.getLocaleModules(),
      //                     );
      //                   },
      //                   error: (value) {
      //                     return const SideBar();
      //                   },
      //                 );
      //               },
      //             )
      //           : SideBar(
      //               module: CommonMethods.getLocaleModules(),
      //             )),
      // ),

      // drawer: BlocBuilder<LocalizationBloc, LocalizationState>(
      //   builder: (context, state) {
      //     return state.maybeMap(
      //       orElse: () => const SizedBox.shrink(),
      //       loaded: (value) {
      //         return BlocBuilder<AppInitializationBloc, AppInitializationState>(
      //           builder: (context, stateInit) {
      //             return BlocBuilder<AuthBloc, AuthState>(
      //               builder: (context, stateAuth) {
      //                 return stateAuth.maybeMap(
      //                   orElse: () => const SizedBox.shrink(),
      //                   loaded: (authValue) {
      //                     return SideBar(
      //                       profile: ProfileWidget(
      //                         title: authValue
      //                                 .userDetailsModel?.userRequestModel?.name
      //                                 .toString() ??
      //                             '',
      //                         description: authValue.userDetailsModel
      //                                 ?.userRequestModel?.mobileNumber
      //                                 .toString() ??
      //                             '',
      //                         leading: const SizedBox.shrink(),
      //                       ),
      //                       sidebarItems: [
      //                         SidebarItem(
      //                           title: AppLocalizations.of(context)
      //                               .translate(i18.common.home),
      //                           icon: Icons.home,
      //                           onPressed: () {
      //                             Navigator.of(context).pop();
      //                             // Navigate to Home
      //                           },
      //                         ),
      //                         SidebarItem(
      //                           children: stateInit.digitRowCardItems != null &&
      //                                   stateInit.isInitializationCompleted
      //                               ? List.generate(
      //                                   value.languages != null
      //                                       ? value.languages!.length
      //                                       : 0,
      //                                   (index) => SidebarItem(
      //                                       title:
      //                                           value.languages![index].label,
      //                                       icon: Icons.language,
      //                                       onPressed: () {
      //                                         print("hello welcome");
      //                                         context
      //                                             .read<LocalizationBloc>()
      //                                             .add(
      //                                               LocalizationEvent
      //                                                   .onSpecificLoadLocalization(
      //                                                 locale: value
      //                                                     .languages![index]
      //                                                     .value,
      //                                                 module: CommonMethods
      //                                                     .getLocaleModules(),
      //                                                 tenantId: stateInit
      //                                                     .initMdmsModel!
      //                                                     .commonMastersModel!
      //                                                     .stateInfoListModel!
      //                                                     .first
      //                                                     .code
      //                                                     .toString(),
      //                                               ),
      //                                             );
      //                                       }),
      //                                 ).toList()
      //                               : [],
      //                           title: 'Language',
      //                           icon: Icons.language,
      //                           onPressed: () {
      //                             print("object");
      //                             // Implement language change
      //                           },
      //                         ),
      //                         SidebarItem(
      //                           title: 'Profile',
      //                           icon: Icons.person,
      //                           onPressed: () {
      //                             Navigator.of(context).pop();
      //                             // Navigate to Profile
      //                           },
      //                         ),
      //                         SidebarItem(
      //                           title: 'View Downloaded Data',
      //                           icon: Icons.download,
      //                           onPressed: () {
      //                             Navigator.of(context).pop();
      //                             // Navigate to Downloaded Data
      //                           },
      //                         ),
      //                       ],
      //                     );
      //                   },
      //                 );
      //               },
      //             );
      //           },
      //         );
      //       },
      //     );
      //   },
      // ),
drawer: const MySideBar(),
      body: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localState) {
          return localState.maybeMap(
            orElse: () => const SizedBox.shrink(),
            loaded: (value) {
              Languages selectedLan =
                  value.languages!.firstWhere((element) => element.isSelected);
              return BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.maybeMap(
                    loaded: (value) {
                      if (value.roleType == RoleType.cbo) {
                        return BlocListener<ORGSearchBloc, ORGSearchState>(
                            listener: (context, orgState) {
                          orgState.maybeWhen(
                              orElse: () => false,
                              error: (String? error) {
                                // Notifiers.getToastMessage(
                                //     context,
                                //     t.translate(i18.common.noOrgLinkedWithMob),
                                //     'ERROR');

                                Toast.showToast(
                                  context,
                                  message: t
                                      .translate(i18.common.noOrgLinkedWithMob),
                                  type: ToastType.error,
                                );
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthLogoutEvent());
                              },
                              loaded: (OrganisationListModel?
                                  organisationListModel) async {
                                if ((organisationListModel?.organisations ?? [])
                                    .isEmpty) {
                                  // Notifiers.getToastMessage(
                                  //     context,
                                  //     t.translate(
                                  //         i18.common.noOrgLinkedWithMob),
                                  //     'ERROR');
                                  Toast.showToast(
                                    context,
                                    message: t.translate(
                                        i18.common.noOrgLinkedWithMob),
                                    type: ToastType.error,
                                  );
                                  context
                                      .read<AuthBloc>()
                                      .add(const AuthLogoutEvent());
                                } else {}
                              });
                        }, child: BlocBuilder<ORGSearchBloc, ORGSearchState>(
                                builder: (context, state) {
                          return state.maybeWhen(
                              orElse: () => Container(),
                              loading: () =>
                                  shg_loader.Loaders.circularLoader(context),
                              loaded: (OrganisationListModel?
                                  organisationListModel) {
                                return BlocBuilder<HomeScreenBloc,
                                    HomeScreenBlocState>(
                                  builder: (context, config) {
                                    return config.maybeWhen(
                                        orElse: () => Container(),
                                        loading: () =>
                                            shg_loader.Loaders.circularLoader(
                                                context),
                                        loaded: (List<CBOHomeScreenConfigModel>?
                                                cboHomeScreenConfig,
                                            HomeConfigModel? homeConfigModel) {
                                          return cboBasedLayout(
                                            cboHomeScreenConfig,
                                            t,
                                            context,
                                            selectedLan,
                                          );
                                        });
                                  },
                                );
                              });
                        }));
                      } else {
                        return BlocBuilder<HomeScreenBloc, HomeScreenBlocState>(
                          builder: (context, config) {
                            return config.maybeWhen(
                              orElse: () => Container(),
                              loading: () =>
                                  shg_loader.Loaders.circularLoader(context),
                              loaded: (List<CBOHomeScreenConfigModel>?
                                      cboHomeScreenConfig,
                                  HomeConfigModel? homeConfigModel) {
                                // role based config
                                if (value.roleType == RoleType.cbo) {
                                  return cboBasedLayout(
                                    cboHomeScreenConfig,
                                    t,
                                    context,
                                    selectedLan,
                                  );
                                } else {
                                  return empBasedLayout(
                                      context, homeConfigModel!, t);
                                }
                              },
                            );
                          },
                        );
                      }
                    },
                    orElse: () {
                      return const SizedBox.shrink();
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  

  Widget empBasedLayout(BuildContext context, HomeConfigModel homeConfigModel,
      AppLocalizations t) {
    final List<Widget> cards = _getItems(context, homeConfigModel);
    if (cards.isNotEmpty) {
      return ScrollableContent(
        slivers: [
          SliverGrid(
            delegate: SliverChildBuilderDelegate((context, index) {
              return cards.elementAt(index);
            }, childCount: cards.length),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 170,
              childAspectRatio: 105 / 129,
            ),
          ),
        ],
      );
    } else {
      return Center(
          child: Card(
        child: Center(
          child: EmptyImage(
            align: Alignment.center,
            label: t.translate(i18.measurementBook.noService),
          ),
        ),
      ));
    }
  }

  List<Widget> _getItems(
      BuildContext context, HomeConfigModel homeConfigModel) {
    /// TODO:[ref from health]

    final Map<String, Widget> homeItemsMap = {
      i18.measurementBook.mbMeasurementNumber: HomeItemCard(
        icon: SvgPicture.asset(Constants.mbIcon),
        label: i18.measurementBook.mbMeasurementNumber,
        onPressed: () {
          context.router.push(
            const MeasurementBookInboxRoute(),
          );
        },
      ),
      i18.measurementBook.mbWorkOrderLabel: HomeItemCard(
        icon: SvgPicture.asset(Constants.workOrderIcon),
        label: i18.measurementBook.mbWorkOrderLabel,
        onPressed: () {
          context.router.push(
            const WorkOderInboxRoute(),
          );
        },
      )
    };

    final homeItemsLabel = <String>[
      i18.measurementBook.mbMeasurementNumber,
      i18.measurementBook.mbWorkOrderLabel,
    ];

    final List<String> filteredLabels = homeItemsLabel
        .where((element) => homeConfigModel.actions
            .map((e) {
              if (e.parentModule == "cards") {
                return e.displayName;
              }
            })
            .toList()
            .contains(element))
        .toList();

    final List<Widget> widgetList =
        filteredLabels.map((label) => homeItemsMap[label]!).toList();

    return widgetList;
  }

  ScrollableContent cboBasedLayout(
    List<CBOHomeScreenConfigModel>? cboHomeScreenConfig,
    AppLocalizations t,
    BuildContext context,
    Languages selectedLan,
  ) {
    return ScrollableContent(
        footer: const Padding(
          padding: EdgeInsets.all(16.0),
          child: PoweredByDigit(
            version: Constants.appVersion,
          ),
        ),
        children: [
          DigitCard(
            onPressed: null,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: cboHomeScreenConfig?.map((e) {
                        if (e.order == 1) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    t.translate(i18.home.mukta),
                                    style: DigitTheme.instance.mobileTheme
                                        .textTheme.headlineLarge,
                                  ),
                                  SvgPicture.asset(Constants.muktaIcon)
                                ],
                              ),
                              ButtonLink(
                                  t.translate(e.label ?? ''),
                                  getRoute(
                                      e.key.toString(), context, selectedLan))
                            ],
                          );
                        } else {
                          return ButtonLink(t.translate(e.label ?? ''),
                              getRoute(e.key.toString(), context, selectedLan));
                        }
                      }).toList() ??
                      []),
            ),
          ),
        ]);
  }

  Future<void> localeLoad(Languages data) async {
    context.read<LocalizationBloc>().add(
          LocalizationEvent.onSpecificLoadLocalization(
              module: CommonMethods.getLocaleModules(),
              tenantId: GlobalVariables
                  .globalConfigObject!.globalConfigs!.stateTenantId
                  .toString(),
              locale: data.value.toString()),
        );
  }

  void Function()? getRoute(String key, BuildContext context, Languages data) {
    switch (key) {
      case Constants.homeMyWorks:
        return () {
          localeLoad(data);
          context.router.push(const WorkOrderRoute());
        };
      case Constants.homeTrackAttendance:
        return () {
          localeLoad(data);
          context.router.push(const TrackAttendanceInboxRoute());
        };
      case Constants.homeMusterRolls:
        return () {
          localeLoad(data);
          context.router.push(const ViewMusterRollsRoute());
        };
      case Constants.homeMyBills:
        return () {
          localeLoad(data);
          context.router.push(const MyBillsRoute());
        };
      case Constants.homeRegisterWageSeeker:
        return () {
          localeLoad(data);
          context.router.push(const RegisterIndividualRoute());
        };
      case Constants.homeMyServiceRequests:
        return () {
          localeLoad(data);
          context.router.push(const MyServiceRequestsRoute());
        };
      default:
        return null;
    }
  }
}

class HomeItemCard extends StatelessWidget {
  final Widget icon;
  final String label;
  final VoidCallback? onPressed;

  const HomeItemCard({
    required this.icon,
    required this.label,
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DigitCard(
      onPressed: onPressed,
      padding: const EdgeInsets.all(kPadding).copyWith(top: kPadding * 2),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context).translate(
                label,
              ),
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
