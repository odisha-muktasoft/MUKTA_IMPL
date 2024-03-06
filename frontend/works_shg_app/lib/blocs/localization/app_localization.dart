import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/schema/localization.dart';
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
      final box = Hive.box<EnglishLocalization>('englishLocalization');
      // Convert values to list
      final List<EnglishLocalization> localizationList = box.values.toList();
      // Add English localized strings to list
      if (localizationList.isNotEmpty) {
        localizedStrings.addAll(localizationList);
      }
    } else {
      final odiaBox = Hive.box<OdiaLocalization>('odiaLocalization');
      final List<OdiaLocalization> localizationList = odiaBox.values.toList();
      if (localizationList.isNotEmpty) {
        localizedStrings.addAll(localizationList);
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
