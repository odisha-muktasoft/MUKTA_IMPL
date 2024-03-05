import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:works_shg_app/blocs/localization/localization.dart';

import '../models/localization/localization_model.dart';
import '../widgets/loaders.dart';

class UnauthenticatedPageWrapper extends StatelessWidget {
  const UnauthenticatedPageWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocalizationBloc, LocalizationState>(
        builder: (context, localeState) {
          return localeState.maybeWhen(
            orElse: () => Loaders.circularLoader(context),
            loading: () => Loaders.circularLoader(context),
            loaded: (List<LocalizationMessageModel>? localization, languages,
                moduleList) {
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
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
