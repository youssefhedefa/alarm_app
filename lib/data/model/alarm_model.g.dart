// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarm_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlarmModelAdapter extends TypeAdapter<AlarmModel> {
  @override
  final int typeId = 0;

  @override
  AlarmModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlarmModel(
      id: fields[0] as int,
      alarmTime: fields[1] as DateTime,
      alarmTitle: fields[2] as String,
      alarmTone: fields[3] as String,
      alarmActive: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AlarmModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.alarmTime)
      ..writeByte(2)
      ..write(obj.alarmTitle)
      ..writeByte(3)
      ..write(obj.alarmTone)
      ..writeByte(4)
      ..write(obj.alarmActive);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlarmModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
