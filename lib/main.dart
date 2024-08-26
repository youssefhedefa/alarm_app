import 'package:alarm_app/alarm_app.dart';
import 'package:alarm_app/core/constances/boxs_constances.dart';
import 'package:alarm_app/core/routing/routing_manager.dart';
import 'package:alarm_app/data/model/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AlarmModelAdapter());
  await Hive.openBox<AlarmModel>(AppBoxsConstance.alarmBox);
  runApp(
    MyApp(
      routingManager: AppRoutingManager(),
    ),
  );
}
