import 'package:alarm_app/core/constances/boxs_constances.dart';
import 'package:alarm_app/data/model/alarm_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

class AlarmRepo{

  var notesBox = Hive.box<AlarmModel>(AppBoxsConstance.alarmBox);

  Future<Either<String,List<AlarmModel>>> getAlarms() async {
    try {
      notesBox = Hive.box<AlarmModel>(AppBoxsConstance.alarmBox);
      List<AlarmModel> alarms = notesBox.values.toList();
      return Right(alarms);
    } catch (error) {
      return Left(error.toString());
    }
  }
  Future<Either<String,bool>> addAlarm({required AlarmModel alarm}) async {
    try {
      notesBox = Hive.box<AlarmModel>(AppBoxsConstance.alarmBox);
      await notesBox.add(alarm);
      return const Right(true);
    } catch (error) {
      return Left(error.toString());
    }

  }
  Future<void> updateAlarm(AlarmModel alarm) async {
    // Update data in database
  }
  Future<void> deleteAlarm(AlarmModel alarm) async {

  }
}