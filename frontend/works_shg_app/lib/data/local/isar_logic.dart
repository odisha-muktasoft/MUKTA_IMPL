// // ignore_for_file: public_member_api_docs, sort_constructors_first
// //  LocalizationModel result = await localizationRepository.search(
// //           url: Urls.initServices.localizationSearch,
// //           queryParameters: {
// //             "module": filteredList.join(',').toString(),
// //             "locale": event.locale,
// //             "tenantId": event.tenantId,
// //           },
// //         );

// import 'package:isar/isar.dart';

// import '../schema/localization.dart';

// class IsarLogic {
//   final Isar _isar;
//   const IsarLogic(
//     this._isar,
//   );

//   Future<bool> loadLocalizationToIsar({
//     required String locale,
//     required String module,
//     required String tenantId,
//     required LocalizationWrapper localizationWrapper,
//   }) async {
//     // final List<LocalizationWrapper> localizationList = await _isar
//     //     .localizationWrappers
//     //     .filter()
//     //     .localeEqualTo(locale)
//     //     .findAll();

//     // final localizationWrapper = LocalizationWrapper()
//     //   ..locale = locale
//     //   ..localization = newLocalizationList;

//     try {
//       await _isar.writeTxn(() async {
//         await _isar.localizationWrappers.put(localizationWrapper);
//         // insert & update
//       });
//       return true;
//     } catch (e) {
//       return true;
//     }
//   }
  
// }
