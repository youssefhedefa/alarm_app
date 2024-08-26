class AlarmModel{
  int id;
  String alarmTime;
  String alarmTitle;
  String alarmTone;
  bool alarmActive;

  AlarmModel({
    required this.id,
    required this.alarmTime,
    required this.alarmTitle,
    required this.alarmTone,
    required this.alarmActive,
  });

}