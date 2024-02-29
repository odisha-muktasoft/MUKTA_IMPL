import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';
import 'package:works_shg_app/data/init_client.dart';

import '../blocs/app_initilization/app_initilization.dart';
import '../data/remote_client.dart';
import '../data/repositories/remote/localization.dart';
import '../data/repositories/remote/mdms.dart';
import '../models/localization/localization_model.dart';
import '../widgets/loaders.dart';

class UnauthenticatedPageWrapper extends StatelessWidget {
  final Isar isar;
  const UnauthenticatedPageWrapper({Key? key, required this.isar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client client = Client();
    InitClient initClient = InitClient();
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppInitializationBloc(
            const AppInitializationState(),
            MdmsRepository(initClient.init()),
          )..add(const AppInitializationSetupEvent(selectedLang: 'en_IN')),
        ),
      ],
      child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
          builder: (context, appInitState) {
        return BlocProvider(
            create: (appInitState.initMdmsModel != null &&
                    appInitState.stateInfoListModel?.localizationModules !=
                        null)
                ? (context) => LocalizationBloc(
                      const LocalizationState.initial(),
                      LocalizationRepository(initClient.init(),
                      ),
                      isar
                    )..add(LocalizationEvent.onLoadLocalization(
                        module:
                            'rainmaker-common,rainmaker-common-masters,rainmaker-${appInitState.stateInfoListModel?.code}',
                        tenantId: appInitState.initMdmsModel!
                            .commonMastersModel!.stateInfoListModel!.first.code
                            .toString(),
                        locale: appInitState.digitRowCardItems!
                            .firstWhere((e) => e.isSelected)
                            .value,
                      ))
                : (context) => LocalizationBloc(
                      const LocalizationState.initial(),
                      LocalizationRepository(initClient.init()),
                      isar
                    ),
            child: (appInitState.isInitializationCompleted &&
                    appInitState.digitRowCardItems != null &&
                    appInitState.digitRowCardItems!.isNotEmpty)
                ? BlocBuilder<LocalizationBloc, LocalizationState>(
                    builder: (context, localeState) {
                    return localeState.maybeWhen(
                        orElse: () => Container(),
                        loading: () => Loaders.circularLoader(context),
                        loaded: (List<LocalizationMessageModel>? localization) {
                          return const AutoRouter();
                        },
                        error: (String? error) {
                          return const Center(
                            child: Text(
                              'Unable to load messages',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red),
                            ),
                          );
                        });
                  })
                : Loaders.circularLoader(context));
      }),
    ));
  }
}
