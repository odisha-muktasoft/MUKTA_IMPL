import 'package:hive/hive.dart';

part 'localization.g.dart';

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
