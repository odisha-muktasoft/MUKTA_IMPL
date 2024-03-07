import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:works_shg_app/models/localization/module_status.dart';
import 'package:works_shg_app/services/urls.dart';
import 'package:works_shg_app/utils/constants.dart';

import '../../data/repositories/remote/localization.dart';
import '../../data/schema/localization.dart';
import '../../models/app_config/app_config_model.dart';
import '../../models/localization/localization_model.dart';
import 'app_localization.dart';

part 'localization.freezed.dart';

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
      // Create ModuleStatus list based on localization modules
      List<ModuleStatus> module = event.localizationModules!.map((e) {
        return ModuleStatus(
            isEng: false, label: e.label, value: e.value, isOdia: false);
      }).toList();
      // Extract selected modules
      final List<String> selectedModule = event.module!.split(',');

// Check if locale is English
      if (event.locale == LanguageEnum.en_IN.name) {
        for (final itemB in selectedModule) {
          final itemAIndex =
              module.indexWhere((element) => element.value == itemB);
          if (itemAIndex != -1) {
            module[itemAIndex] = module[itemAIndex].copyWith(isEng: true);
          }
        }
      } else {}
      // Access Hive box for English localization
      final box = Hive.box<KeyValueModel>('keyValueModel');
      final List<KeyValueModel> localizationList = box.values.toList();
      // final ll =
      //       localizationList.firstWhere((element) => element.locale == "en_IN");
      // Fetch localization data from remote API

      LocalizationModel result = await localizationRepository.search(
        url: Urls.initServices.localizationSearch,
        queryParameters: {
          "module": event.module.toString(),
          "locale": event.locale,
          "tenantId": event.tenantId,
        },
      );

      // var box = Hive.box<KeyValueModel>('keyValueModel');
      final List<Localization> newLocalizationList = result.messages
          .map((e) => Localization()
            ..message = e.message
            ..code = e.code
            ..locale = e.locale
            ..module = e.module)
          .toList();
      // Add fetched data to Hive box
      KeyValueModel keyValueModel = KeyValueModel()
        ..locale = "en_IN"
        ..localizationsList = newLocalizationList;
      await box.add(keyValueModel);

      final List codes = event.locale.split('_');
      await _loadLocale(codes, event.locale);
      // Emit loaded state
      emit(LocalizationState.loaded(event.languages, module));
    } on DioError catch (e) {
      LocalizationState.error(e.response?.data['Errors'][0]['code']);
    }
  }

// Handler for loading specific localization data
  FutureOr<void> _onSpecificLoadLocalization(
    OnSpecificLoadLocalizationEvent event,
    LocalizationEmitter emit,
  ) async {
    try {
      // Check the current state and proceed only if it's in the 'loaded' state
      await state.maybeMap(
        orElse: () => null,
        loaded: (value) async {
          emit(const LocalizationState.loading());
          // Generate a list of configured languages with updated selected status
          final List<Languages> configLanguage =
              List.from(value.languages!).map((e) {
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
// Extract selected modules from the event
          final List<String> selectedModule = event.module!.split(',');
          // Clone the existing module status list
          List<ModuleStatus> ss = List.from(value.moduleStatus!);
          // Create a copy of selected modules list
          List<String> loopingData = List.from(selectedModule);
          // Update module status based on locale
          if (event.locale == LanguageEnum.en_IN.name) {
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
                }
              }
            }
          } else {
            // Handle non-English locale scenarios
            for (final itemB in loopingData) {
              final itemAIndex =
                  ss!.indexWhere((element) => element.value == itemB);
              if (itemAIndex != -1) {
                if (ss![itemAIndex].isOdia == true) {
                  // Remove already selected Odia modules
                  selectedModule.remove(itemB);
                } else {
                  // Update module status for Odia modules
                  final data = ModuleStatus(
                      isEng: value.moduleStatus![itemAIndex].isEng,
                      label: value.moduleStatus![itemAIndex].label,
                      value: value.moduleStatus![itemAIndex].value,
                      isOdia: true);
                  ss.removeAt(itemAIndex);
                  ss.insert(itemAIndex, data);
                }
              }
            }
          }
          // Access Hive box for English and Odia localizations
          final box = Hive.box<KeyValueModel>('keyValueModel');

          // Fetch localization data from remote API for selected modules
          if (selectedModule.isNotEmpty) {
            LocalizationModel result = await localizationRepository.search(
              url: Urls.initServices.localizationSearch,
              queryParameters: {
                "module": selectedModule.join(",").toString(),
                "locale": event.locale,
                "tenantId": event.tenantId,
              },
            );
            // Update Hive box with fetched localization data
            if (event.locale == LanguageEnum.en_IN.name) {
              if (result.messages.isNotEmpty) {
                final List<Localization> newLocalizationList = result.messages
                    .map((e) => Localization()
                      ..message = e.message
                      ..code = e.code
                      ..locale = e.locale
                      ..module = e.module)
                    .toList();
                // Add English localizations to box
                final List<KeyValueModel> localizationList =
                    box.values.toList();
                final ll = localizationList
                    .firstWhere((element) => element.locale == "en_IN");

                //await box.addAll(newLocalizationList);

                for (int i = 0; i < localizationList.length; i++) {
                  if (localizationList[i].locale == "en_IN") {
                    // Update the desired fields of the object

                    localizationList[i]
                        .localizationsList!
                        .addAll(newLocalizationList);

                    // Put the updated list back into the Hive box
                    box.putAll(
                        {for (var obj in localizationList) obj.key: obj});

                    break; // Exit the loop since we found and updated the object
                  }
                }
              }
            } else {
              final List<Localization> newLocalizationList = result.messages
                  .map((e) => Localization()
                    ..message = e.message
                    ..code = e.code
                    ..locale = e.locale
                    ..module = e.module)
                  .toList();
              final List<KeyValueModel> localizationList = box.values.toList();
              final ll = localizationList
                  .firstWhereOrNull((element) => element.locale == "or_IN");

              if (ll == null) {
                KeyValueModel keyValueModel = KeyValueModel()
                  ..locale = "or_IN"
                  ..localizationsList = newLocalizationList;
                await box.add(keyValueModel);
              } else {
                // Add Odia localizations to box
                //  await odiaBox.addAll(newLocalizationList);
                for (int i = 0; i < localizationList.length; i++) {
                  if (localizationList[i].locale == "or_IN") {
                    // Update the desired fields of the object

                    localizationList[i]
                        .localizationsList!
                        .addAll(newLocalizationList);

                    // Put the updated list back into the Hive box
                    box.putAll(
                        {for (var obj in localizationList) obj.key: obj});

                    break; // Exit the loop since we found and updated the object
                  }
                }
              }
            }

            final List codes = event.locale.split('_');
            await _loadLocale(codes, event.locale);

            emit(value.copyWith(moduleStatus: ss, languages: configLanguage));
          } else {
            // If no modules are selected, emit updated state without fetching new data
            final List codes = event.locale.split('_');
            await _loadLocale(codes, event.locale!);

            emit(value.copyWith(moduleStatus: ss, languages: configLanguage));
          }
        },
      );
    } on DioError catch (e) {
      // Handle Dio errors and emit error state
      LocalizationState.error(e.response?.data['Errors'][0]['code']);
    }
  }

  FutureOr<void> _loadLocale(List codes, String locale) async {
    await AppLocalizations(Locale(codes.first, codes.last))
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
    List<Languages>? languages,
    List<ModuleStatus>? moduleStatus,
  ) = _Loaded;
  const factory LocalizationState.error(String? error) = _Error;
}
