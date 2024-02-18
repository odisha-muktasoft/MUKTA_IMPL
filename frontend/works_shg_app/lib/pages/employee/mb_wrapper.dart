import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/employee/mb/measurement_book.dart';
import '../../router/app_router.dart';

class MeasurementBookWrapperPage extends StatefulWidget with AutoRouteWrapper {
  const MeasurementBookWrapperPage({super.key});

  @override
  State<MeasurementBookWrapperPage> createState() =>
      _MeasurementBookWrapperPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

class _MeasurementBookWrapperPageState
    extends State<MeasurementBookWrapperPage> {
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => MeasurementInboxBloc(),
      child: const AutoRouter(),
    );
  }
}
