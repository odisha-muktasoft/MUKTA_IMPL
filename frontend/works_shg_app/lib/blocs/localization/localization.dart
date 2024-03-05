import 'dart:async';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:works_shg_app/models/localization/module_status.dart';
import 'package:works_shg_app/services/urls.dart';

import '../../data/repositories/remote/localization.dart';
import '../../data/schema/localization.dart';
import '../../models/app_config/app_config_model.dart';
import '../../models/localization/localization_model.dart';
import 'app_localization.dart';

part 'localization.freezed.dart';

// List<DigitRowCardModel>?

typedef LocalizationEmitter = Emitter<LocalizationState>;
List<LocalizationMessageModel>? localizationMessages;

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LocalizationRepository localizationRepository;
  LocalizationBloc(
    super.initialState,
    this.localizationRepository,
  ) {
    on<OnLoadLocalizationEvent>(_onLoadLocalization);
    on<OnSpecificLoadLocalizationEvent>(_onSpecificLoadLocalization);

   
  }

  FutureOr<void> _onLoadLocalization(
    OnLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    try {
      emit(const LocalizationState.loading());
      List<ModuleStatus> module = event.localizationModules!.map((e) {
        return ModuleStatus(
            isEng: false, label: e.label, value: e.value, isOdia: false);
      }).toList();
      final List<String> selectedModule = event.module!.split(',');

      if (event.locale == "en_IN") {
        for (final itemB in selectedModule) {
          final itemAIndex =
              module.indexWhere((element) => element.value == itemB);
          if (itemAIndex != -1) {
            module[itemAIndex] = module[itemAIndex].copyWith(isEng: true);
          }
        }
      } else {}

      final box = Hive.box<EnglishLocalization>('englishLocalization');
      final List<EnglishLocalization> localizationList = box.values.toList();

      if (localizationList.isEmpty) {
        LocalizationModel result = await localizationRepository.search(
          url: Urls.initServices.localizationSearch,
          queryParameters: {
            "module": event.module.toString(),
            "locale": event.locale,
            "tenantId": event.tenantId,
          },
        );

        var box = Hive.box<EnglishLocalization>('englishLocalization');
        final List<EnglishLocalization> newLocalizationList = result.messages
            .map((e) => EnglishLocalization()
              ..message = e.message
              ..code = e.code
              ..locale = e.locale
              ..module = e.module)
            .toList();
        await box.addAll(newLocalizationList);

        final List codes = event.locale.split('_');
        bool k = await _loadLocale(codes, event.locale);
        dynamic s;
        emit(LocalizationState.loaded(s, event.languages, module));
      } else {
        final List codes = event.locale.split('_');
        bool k = await _loadLocale(codes, event.locale!);
        dynamic s;
        emit(LocalizationState.loaded(s, event.languages, module));
      }
    } on DioError catch (e) {
      LocalizationState.error(e.response?.data['Errors'][0]['code']);
    }
  }

  FutureOr<void> _onSpecificLoadLocalization(
    OnSpecificLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    try {
      await state.maybeMap(
        orElse: () => null,
        loaded: (value) async {
          emit(const LocalizationState.loading());
          final List<Languages> sd = List.from(value.languages!).map((e) {
            if (e.value == event.locale) {
              final data =
                  Languages(label: e.label, value: e.value, isSelected: true);
              return data;
            } else {
              final data =
                  Languages(label: e.label, value: e.value, isSelected: false);
              return data;
            }
          }).toList();

          final List<String> selectedModule = event.module!.split(',');
          List<ModuleStatus> ss = List.from(value.moduleStatus!);
          List<String> loopingData = List.from(selectedModule);
          if (event.locale == "en_IN") {
            for (final itemB in loopingData) {
              final itemAIndex =
                  ss!.indexWhere((element) => element.value == itemB);
              if (itemAIndex != -1) {
                if (ss![itemAIndex].isEng == true) {
                  selectedModule.remove(itemB);
                } else {
                  final data = ModuleStatus(
                      isEng: true,
                      label: value.moduleStatus![itemAIndex].label,
                      value: value.moduleStatus![itemAIndex].value,
                      isOdia: value.moduleStatus![itemAIndex].isOdia);
                  ss.removeAt(itemAIndex);
                  ss.insert(itemAIndex, data);

                  // value.moduleStatus![itemAIndex].copyWith(isEng: true);
                }
              }
            }
          } else {
            for (final itemB in loopingData) {
              final itemAIndex =
                  ss!.indexWhere((element) => element.value == itemB);
              if (itemAIndex != -1) {
                if (ss![itemAIndex].isOdia == true) {
                  selectedModule.remove(itemB);
                } else {
                  final data = ModuleStatus(
                      isEng: value.moduleStatus![itemAIndex].isEng,
                      label: value.moduleStatus![itemAIndex].label,
                      value: value.moduleStatus![itemAIndex].value,
                      isOdia: true);
                  ss.removeAt(itemAIndex);
                  ss.insert(itemAIndex, data);

                  // value.moduleStatus![itemAIndex].copyWith(isEng: true);
                }
              }
            }
          }

          final box = Hive.box<EnglishLocalization>('englishLocalization');
          var odiaBox = Hive.box<OdiaLocalization>('odiaLocalization');

          if (selectedModule.isNotEmpty) {
            LocalizationModel result = await localizationRepository.search(
              url: Urls.initServices.localizationSearch,
              queryParameters: {
                "module": selectedModule.join(",").toString(),
                "locale": event.locale,
                "tenantId": event.tenantId,
              },
            );

            if (event.locale == "en_IN") {
              final List<EnglishLocalization> newLocalizationList =
                  result.messages
                      .map((e) => EnglishLocalization()
                        ..message = e.message
                        ..code = e.code
                        ..locale = e.locale
                        ..module = e.module)
                      .toList();
              await box.addAll(newLocalizationList);
            } else {
              final List<OdiaLocalization> newLocalizationList = result.messages
                  .map((e) => OdiaLocalization()
                    ..message = e.message
                    ..code = e.code
                    ..locale = e.locale
                    ..module = e.module)
                  .toList();
              await odiaBox.addAll(newLocalizationList);
            }

            final List codes = event.locale.split('_');
            bool k = await _loadLocale(codes, event.locale);

            emit(value.copyWith(moduleStatus: ss, languages: sd));
          } else {
            final List codes = event.locale.split('_');
            bool k = await _loadLocale(codes, event.locale!);

            emit(value.copyWith(moduleStatus: ss, languages: sd));
          }
        },
      );
    } on DioError catch (e) {
      LocalizationState.error(e.response?.data['Errors'][0]['code']);
    }
  }

  

  FutureOr<bool> _loadLocale(List codes, String locale) async {
    return await AppLocalizations(Locale(codes.first, codes.last))
        .load(locale: codes.first);
  }
}

@freezed
class LocalizationEvent with _$LocalizationEvent {
  const factory LocalizationEvent.onLoadLocalization({
    required String module,
    required String tenantId,
    required String locale,
    final List<Languages>? languages,
    final List<LocalizationModules>? localizationModules,
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
  factory LocalizationState.loaded(
    List<LocalizationMessageModel>? localization,
    List<Languages>? languages,
    List<ModuleStatus>? moduleStatus,
  ) = _Loaded;
  const factory LocalizationState.error(String? error) = _Error;
}
