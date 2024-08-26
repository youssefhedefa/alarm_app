import 'package:alarm_app/cubits/get_alarms/get_alarms_states.dart';
import 'package:alarm_app/data/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAlarmsCubit extends Cubit<GetAlarmsStates> {
  final AlarmRepo alarmRepo;

  GetAlarmsCubit({required this.alarmRepo}) : super(GetAlarmsInitial());

  getAlarms() async {
    emit(GetAlarmsLoading());
    final result = await alarmRepo.getAlarms();
    result.fold(
      (error) => emit(GetAlarmsFailed(error: error)),
      (alarms) => emit(GetAlarmsSuccess(alarms: alarms)),
    );
  }
}
