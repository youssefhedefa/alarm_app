import 'dart:math';
import 'package:alarm_app/core/helpers/audio_helper.dart';
import 'package:alarm_app/cubits/add_alarm_cubit/add_alarm_states.dart';
import 'package:alarm_app/data/model/alarm_model.dart';
import 'package:alarm_app/data/repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAlarmCubit extends Cubit<AddAlarmStates> {
  final AlarmRepo alarmRepo;

  AddAlarmCubit({required this.alarmRepo}) : super(AddAlarmInitial());

  TextEditingController alarmTitleController = TextEditingController();
  DateTime selectedTime = DateTime.now();
  String selectedTone = AppAudioHelper.audio1Path;


  void addAlarm({
    required DateTime alarmTime,
    required String alarmTitle,
    required String alarmTone,
  }) async {
    emit(AddAlarmLoading());
    final result = await alarmRepo.addAlarm(
      alarm: AlarmModel(
        id: DateTime.now().millisecondsSinceEpoch + Random().nextInt(1000),
        alarmTime: alarmTime,
        alarmTitle: alarmTitle,
        alarmTone: alarmTone,
        alarmActive: true,
      ),
    );
    result.fold(
      (error) => emit(AddAlarmError(error)),
      (success) => emit(AddAlarmSuccess()),
    );
  }
}
