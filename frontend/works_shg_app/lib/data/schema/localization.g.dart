// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EnglishLocalizationAdapter extends TypeAdapter<EnglishLocalization> {
  @override
  final int typeId = 0;

  @override
  EnglishLocalization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EnglishLocalization()
      ..code = fields[0] as String?
      ..message = fields[1] as String?
      ..module = fields[2] as String?
      ..locale = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, EnglishLocalization obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.module)
      ..writeByte(3)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnglishLocalizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OdiaLocalizationAdapter extends TypeAdapter<OdiaLocalization> {
  @override
  final int typeId = 1;

  @override
  OdiaLocalization read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OdiaLocalization()
      ..code = fields[0] as String?
      ..message = fields[1] as String?
      ..module = fields[2] as String?
      ..locale = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, OdiaLocalization obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.module)
      ..writeByte(3)
      ..write(obj.locale);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OdiaLocalizationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
