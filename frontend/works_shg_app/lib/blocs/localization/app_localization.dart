import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:works_shg_app/data/schema/localization.dart';

import 'app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(
    this.locale,
  );
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static List<dynamic> localizedStrings = <dynamic>[];

// Returns instance of custom localizations delegate
  static LocalizationsDelegate<AppLocalizations> getDelegate() =>
      const AppLocalizationsDelegate();

/* it fetches data from hive box based on the locale selection:
  - store the list of data to localizedStrings
  - for searching increasing efficiency
*/
  Future<bool> load({required String locale}) async {
    // Clear the list before loading localized strings
    localizedStrings.clear();

    // Check if locale is English
    if (locale == "en") {
      // Get box for English localization
      final box = Hive.box<KeyValueModel>('keyValueModel');
      // Convert values to list
      final List<KeyValueModel> ll = box.values.toList();
      if (ll.isNotEmpty) {
        final localizationList =
            ll.firstWhere((element) => element.locale == "en_IN");
        // Add English localized strings to list
        if (localizationList.localizationsList != null) {
          localizedStrings.addAll(localizationList.localizationsList!);
        }
      }
      } else {
        final box = Hive.box<KeyValueModel>('keyValueModel');
      // Convert values to list
      final List<KeyValueModel> ll = box.values.toList();
       if (ll.isNotEmpty) {
        final localizationList =
            ll.firstWhere((element) => element.locale == "or_IN");
        // Add English localized strings to list
        if (localizationList.localizationsList != null) {
          localizedStrings.addAll(localizationList.localizationsList!);
        }
      }
      
    }

    return true;
  }

  translate(
    String localizedValues,
  ) {
    // Find index of localized string
    var index =
        localizedStrings.indexWhere((medium) => medium.code == localizedValues);
    // Return localized string if found, otherwise return original value
    return index != -1 ? localizedStrings[index].message : localizedValues;
  }
}
