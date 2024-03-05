
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

  static LocalizationsDelegate<AppLocalizations> getDelegate() =>
      const AppLocalizationsDelegate();

  Future<bool> load({required String locale}) async {
    localizedStrings.clear();

    if (locale == "en") {
      final box = Hive.box<EnglishLocalization>('englishLocalization');
      final List<EnglishLocalization> localizationList = box.values.toList();
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
    var index =
        localizedStrings.indexWhere((medium) => medium.code == localizedValues);
    return index != -1 ? localizedStrings[index].message : localizedValues;
  }
}
