// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ViaProfileAdapter extends TypeAdapter<ViaProfile> {
  @override
  final int typeId = 3;

  @override
  ViaProfile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ViaProfile(
      name: fields[1] as String,
    )
      ..uid = fields[0] as String
      ..profileTasks = (fields[2] as List).cast<ViaProfileTask>();
  }

  @override
  void write(BinaryWriter writer, ViaProfile obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profileTasks);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViaProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
