// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_options.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViaOptionsAdapter extends TypeAdapter<ViaOptions> {
  @override
  final int typeId = 5;

  @override
  ViaOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViaOptions(
      endOfDay: fields[0] as DateTime?,
      historySize: fields[1] as int?,
      languageCode: fields[2] as String?,
      countryCode: fields[3] as String?,
      safetyCheck: fields[4] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ViaOptions obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.endOfDay)
      ..writeByte(1)
      ..write(obj.historySize)
      ..writeByte(2)
      ..write(obj.languageCode)
      ..writeByte(3)
      ..write(obj.countryCode)
      ..writeByte(4)
      ..write(obj.safetyCheck);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViaOptionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
