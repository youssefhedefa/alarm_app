import 'package:hive/hive.dart';
part 'alarm_model.g.dart';

@HiveType(typeId: 0)
class AlarmModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  DateTime alarmTime;
  @HiveField(2)
  String alarmTitle;
  @HiveField(3)
  String alarmTone;
  @HiveField(4)
  bool alarmActive;

  AlarmModel({
    required this.id,
    required this.alarmTime,
    required this.alarmTitle,
    required this.alarmTone,
    required this.alarmActive,
  });

}