import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:works_shg_app/blocs/auth/auth.dart';
import 'package:works_shg_app/models/app_config/app_config_model.dart';
import 'package:works_shg_app/models/employee/homeconfig/homeConfigModel.dart';
import 'package:works_shg_app/router/app_router.dart';
import 'package:works_shg_app/utils/common_methods.dart';
import 'package:works_shg_app/utils/localization_constants/i18_key_constants.dart'
    as i18;
import 'package:works_shg_app/utils/notifiers.dart';
import 'package:works_shg_app/widgets/ButtonLink.dart';
import 'package:works_shg_app/widgets/atoms/app_bar_logo.dart';

import '../blocs/app_initilization/home_screen_bloc.dart';
import '../blocs/localization/app_localization.dart';
import '../blocs/localization/localization.dart';
import '../blocs/organisation/org_search_bloc.dart';
import '../models/app_config/app_config_model.dart';
import '../models/organisation/organisation_model.dart';
import '../models/screen_config/home_screen_config.dart';
import '../utils/constants.dart';
import '../utils/global_variables.dart';
import '../widgets/SideBar.dart';
import '../widgets/drawer_wrapper.dart';
import '../widgets/loaders.dart' as shg_loader;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
        appBar: AppBar(
          titleSpacing: 0,
          title: BlocBuilder<ORGSearchBloc, ORGSearchState>(
            builder: (context, state) {
              return state.maybeWhen(
                  orElse: () => Container(),
                  loaded: (OrganisationListModel? organisationListModel) {
                    return const AppBarLogo();
                  });
            },
          ),
        ),
        drawer: const DrawerWrapper(Drawer(child: SideBar())),
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
                                Notifiers.getToastMessage(
                                    context,
                                    t.translate(i18.common.noOrgLinkedWithMob),
                                    'ERROR');
                                context
                                    .read<AuthBloc>()
                                    .add(const AuthLogoutEvent());
                              },
                              loaded: (OrganisationListModel?
                                  organisationListModel) async {
                                if ((organisationListModel?.organisations ?? [])
                                    .isEmpty) {
                                  Notifiers.getToastMessage(
                                      context,
                                      t.translate(
                                          i18.common.noOrgLinkedWithMob),
                                      'ERROR');
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
                                                context, homeConfigModel!);
                                          }
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
                                        context, homeConfigModel!);
                                  }
                                });
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
        }));
  }

  ScrollableContent empBasedLayout(
      BuildContext context, HomeConfigModel homeConfigModel) {
    return ScrollableContent(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return _getItems(context, homeConfigModel).elementAt(index);
            },
            childCount: _getItems(context, homeConfigModel).length,
          ),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 145,
            childAspectRatio: 104 / 128,
          ),
        ),
      ],
    );
  }
// data

  List<Widget> _getItems(
      BuildContext context, HomeConfigModel homeConfigModel) {
    // return [
    //   HomeItemCard(
    //     icon: SvgPicture.asset(Constants.mbIcon),
    //     label: 'Measurement Books',
    //     onPressed: () {
    //       context.router.push(
    //         const MeasurementBookInboxRoute(),
    //       );
    //       // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Employee")));
    //     },
    //   ),
    //   HomeItemCard(
    //     icon: SvgPicture.asset(Constants.workOrderIcon),
    //     label: 'Work Orders',
    //     onPressed: () {
    //       context.router.push(
    //         const WorkOderInboxRoute(),
    //       );
    //     },
    //   )
    // ];

    /// TODO:[ref from health]

    final Map<String, Widget> homeItemsMap = {
      i18.measurementBook.mbMeasurementNumber: HomeItemCard(
        icon: SvgPicture.asset(Constants.mbIcon),
        label: 'Measurement Books',
        onPressed: () {
          context.router.push(
            const MeasurementBookInboxRoute(),
          );
          // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Employee")));
        },
      ),
      i18.measurementBook.mbWorkOrderLabel: HomeItemCard(
        icon: SvgPicture.asset(Constants.workOrderIcon),
        label: 'Work Orders',
        onPressed: () {
          context.router.push(
            const WorkOderInboxRoute(),
          );
        },
      )
    };

    // mukta
    final homeItemsLabel = <String>[
      i18.measurementBook.mbMeasurementNumber,
      i18.measurementBook.mbWorkOrderLabel,
    ];


    final List<String> filteredLabels = homeItemsLabel
        .where((element) => homeConfigModel.homeActions
            .map((e) {
              if (e.parentModule=="cards") {
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

//
  ScrollableContent cboBasedLayout(
    List<CBOHomeScreenConfigModel>? cboHomeScreenConfig,
    AppLocalizations t,
    BuildContext context,
    Languages selectedLan,
  ) {
    return ScrollableContent(
        footer: const Padding(
          padding: EdgeInsets.all(16.0),
          child: PoweredByDigit(),
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
    var currentLocale = await GlobalVariables.selectedLocale();
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
            // Icon(
            //   icon,
            //   color: onPressed == null
            //       ? theme.disabledColor
            //       : theme.colorScheme.secondary,
            //   size: 30,
            // ),
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
