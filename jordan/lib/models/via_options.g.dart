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
    return ViaOptions()
      ..endOfDay = fields[0] as DateTime
      ..historySize = fields[1] as int;
  }

  @override
  void write(BinaryWriter writer, ViaOptions obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.endOfDay)
      ..writeByte(1)
      ..write(obj.historySize);
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
