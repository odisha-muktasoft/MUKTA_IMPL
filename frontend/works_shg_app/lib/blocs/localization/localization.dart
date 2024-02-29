import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
import 'package:universal_html/html.dart' as html;
import 'package:works_shg_app/data/local/isar_logic.dart';
import 'package:works_shg_app/services/urls.dart';

import '../../data/repositories/remote/localization.dart';
import '../../data/schema/localization.dart';
import '../../models/localization/localization_label.dart';
import '../../models/localization/localization_model.dart';
import '../../services/local_storage.dart';
import '../../utils/global_variables.dart';
import 'app_localization.dart';

part 'localization.freezed.dart';

typedef LocalizationEmitter = Emitter<LocalizationState>;
List<LocalizationMessageModel>? localizationMessages;

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final Isar isar;
  final LocalizationRepository localizationRepository;
  LocalizationBloc(super.initialState, this.localizationRepository, this.isar) {
    on<OnLoadLocalizationEvent>(_onLoadLocalization);
    on<OnSpecificLoadLocalizationEvent>(_onSpecificLoadLocalization);
  }

  FutureOr<void> _onLoadLocalization(
    OnLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    try {
      LocalizationModel result = await localizationRepository.search(
        url: Urls.initServices.localizationSearch,
        queryParameters: {
          "module": event.module.toString(),
          "locale": event.locale,
          "tenantId": event.tenantId,
        },
      );

      final List<Localization> newLocalizationList = result.messages
          .map((e) => Localization()
            ..message = e.message
            ..code = e.code
            ..locale = e.locale
            ..module = e.module)
          .toList();

      final localizationWrapper = LocalizationWrapper()
        ..locale = event.locale
        ..localization = newLocalizationList;

      final check = await IsarLogic(isar).loadLocalizationToIsar(
        locale: "locale",
        module: "module",
        tenantId: "tenantId",
        localizationWrapper: localizationWrapper,
      );
      final List codes = event.locale.split('_');
      bool k = await _loadLocale(codes);
      dynamic s;
      emit(LocalizationState.loaded(s));
    } on DioError catch (e) {
      LocalizationState.error(e.response?.data['Errors'][0]['code']);
    }
  }

  FutureOr<void> _onSpecificLoadLocalization(
    OnSpecificLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    try {
      print(event.module);
      // LocalizationModel result = await localizationRepository.search(
      //   url: Urls.initServices.localizationSearch,
      //   queryParameters: {
      //     "module": event.module.toString(),
      //     "locale": event.locale,
      //     "tenantId": event.tenantId,
      //   },
      // );

      // final List<Localization> newLocalizationList = result.messages
      //     .map((e) => Localization()
      //       ..message = e.message
      //       ..code = e.code
      //       ..locale = e.locale
      //       ..module = e.module)
      //     .toList();

      // final localizationWrapper = LocalizationWrapper()
      //   ..locale = event.locale
      //   ..localization = newLocalizationList;

      // final check = await IsarLogic(isar).loadLocalizationToIsar(
      //   locale: "locale",
      //   module: "module",
      //   tenantId: "tenantId",
      //   localizationWrapper: localizationWrapper,
      // );
      // final List codes = event.locale.split('_');
      // bool k = await _loadLocale(codes);
      // dynamic s;
      // emit(LocalizationState.loaded(s));
    } on DioError catch (e) {
      LocalizationState.error(e.response?.data['Errors'][0]['code']);
    }
  }

  FutureOr<bool> _loadLocale(List codes) async {
    return await AppLocalizations(Locale(codes.first, codes.last), isar).load();
  }
}

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.onLoadLocalization({
    required String module,
    required String tenantId,
    required String locale,
  }) = OnLoadLocalizationEvent;

  const factory LocalizationEvent.onSpecificLoadLocalization({
    required String module,
    required String tenantId,
    required String locale,
  }) = OnSpecificLoadLocalizationEvent;
}

@freezed
class LocalizationState with _$LocalizationState {
  const LocalizationState._();
  const factory LocalizationState.initial() = _Initial;
  const factory LocalizationState.loading() = _Loading;
  const factory LocalizationState.loaded(
      List<LocalizationMessageModel>? localization) = _Loaded;
  const factory LocalizationState.error(String? error) = _Error;
}
