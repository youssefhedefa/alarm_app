import 'package:alarm_app/data/model/alarm_model.dart';

abstract class GetAlarmsStates {}

class GetAlarmsInitial extends GetAlarmsStates {}

class GetAlarmsLoading extends GetAlarmsStates {}

class GetAlarmsSuccess extends GetAlarmsStates {
  final List<AlarmModel> alarms;

  GetAlarmsSuccess({required this.alarms});
}

class GetAlarmsFailed extends GetAlarmsStates {
  final String error;

  GetAlarmsFailed({required this.error});
}
