// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_calendar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViaCalendarAdapter extends TypeAdapter<ViaCalendar> {
  @override
  final int typeId = 2;

  @override
  ViaCalendar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViaCalendar(
      name: fields[2] as String,
    )
      ..uid = fields[0] as String
      ..version = fields[1] as String
      ..viaCalendar = (fields[3] as List).cast<ViaDay>();
  }

  @override
  void write(BinaryWriter writer, ViaCalendar obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.version)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.viaCalendar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViaCalendarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
