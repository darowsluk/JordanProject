// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_profileTask.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViaProfileTaskAdapter extends TypeAdapter<ViaProfileTask> {
  @override
  final int typeId = 4;

  @override
  ViaProfileTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViaProfileTask(
      uid: fields[0] as String,
      name: fields[1] as String?,
      link: fields[2] as String?,
    )
      ..priority = fields[3] as int
      ..untilDone = fields[4] as bool
      ..frequency = fields[5] as int
      ..repeatWeekday = fields[6] as int
      ..repeatDayOfMonth = fields[7] as int
      ..repeatDateDay = fields[8] as int
      ..repeatDateMonth = fields[9] as int;
  }

  @override
  void write(BinaryWriter writer, ViaProfileTask obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.link)
      ..writeByte(3)
      ..write(obj.priority)
      ..writeByte(4)
      ..write(obj.untilDone)
      ..writeByte(5)
      ..write(obj.frequency)
      ..writeByte(6)
      ..write(obj.repeatWeekday)
      ..writeByte(7)
      ..write(obj.repeatDayOfMonth)
      ..writeByte(8)
      ..write(obj.repeatDateDay)
      ..writeByte(9)
      ..write(obj.repeatDateMonth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViaProfileTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
