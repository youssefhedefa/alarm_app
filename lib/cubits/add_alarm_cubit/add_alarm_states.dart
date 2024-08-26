abstract class AddAlarmStates{}

class AddAlarmInitial extends AddAlarmStates{}

class AddAlarmLoading extends AddAlarmStates{}

class AddAlarmSuccess extends AddAlarmStates{}

class AddAlarmError extends AddAlarmStates{
  final String error;

  AddAlarmError(this.error);
}