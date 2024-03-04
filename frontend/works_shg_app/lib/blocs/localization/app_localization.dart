import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:isar/isar.dart';
import 'package:universal_html/html.dart' as html;
import 'package:works_shg_app/blocs/localization/localization.dart';

import '../../data/schema/localization.dart';
import '../../models/localization/localization_model.dart';
import '../../services/local_storage.dart';
import '../../utils/constants.dart';
import 'app_localizations_delegate.dart';

class AppLocalizations {
  final Locale locale;
  

  AppLocalizations(this.locale, );
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static List<dynamic> localizedStrings = <dynamic>[];

  static LocalizationsDelegate<AppLocalizations> getDelegate(
    
  ) =>
       const AppLocalizationsDelegate();

  Future<bool> load({required String locale}) async {
    localizedStrings.clear();
    // final List<LocalizationWrapper> localizationList = await isar
    //     .localizationWrappers
    //     .filter()
    //     .localeEqualTo('${locale.languageCode}_${locale.countryCode}')
    //     .findAll();
     
if (locale=="en") {
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
