 import 'package:isar/isar.dart';
 import 'package:hive/hive.dart';

part 'localization.g.dart';

// part 'localization.g.dart';

// @Collection()
// class LocalizationWrapper {
//   Id id = Isar.autoIncrement;

//   late String locale;

//   late List<Localization>? localization;
// }

// @embedded
// class Localization {
//   late String code;

//   late String message;

//   late String module;

//   late String locale;
// }




@HiveType(typeId: 0)
class EnglishLocalization {
  @HiveField(0)
  String? code;

  @HiveField(1)
  String? message;

  @HiveField(2)
  String? module;

  @HiveField(3)
  String? locale;
}



 //class Localization {
//   late String code;

//   late String message;

//   late String module;

//   late String locale;
// }




@HiveType(typeId: 1)
class OdiaLocalization {
  @HiveField(0)
  String? code;

  @HiveField(1)
  String? message;

  @HiveField(2)
  String? module;

  @HiveField(3)
  String? locale;
}