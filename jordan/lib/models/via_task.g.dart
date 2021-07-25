// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViaTaskAdapter extends TypeAdapter<ViaTask> {
  @override
  final int typeId = 0;

  @override
  ViaTask read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViaTask(
      uid: fields[0] as String,
      name: fields[1] as String?,
      link: fields[3] as String?,
      repeat: fields[4] as String?,
    )..done = fields[2] as bool;
  }

  @override
  void write(BinaryWriter writer, ViaTask obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.done)
      ..writeByte(3)
      ..write(obj.link)
      ..writeByte(4)
      ..write(obj.repeat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViaTaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
