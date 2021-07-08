// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_day.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViaDayAdapter extends TypeAdapter<ViaDay> {
  @override
  final int typeId = 1;

  @override
  ViaDay read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViaDay(
      date: fields[2] as DateTime,
      description: fields[1] as String,
    )
      ..uid = fields[0] as String
      ..viaDay = (fields[3] as List).cast<ViaTask>();
  }

  @override
  void write(BinaryWriter writer, ViaDay obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.viaDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViaDayAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
