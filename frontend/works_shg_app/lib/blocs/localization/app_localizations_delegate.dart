import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import 'app_localization.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  //final Isar isar;
  const AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi', 'pn'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(
    Locale locale,
  ) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load(locale: locale.languageCode);

    return appLocalizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
