import 'package:alarm_app/core/routing/routing_constances.dart';
import 'package:alarm_app/cubits/add_alarm_cubit/add_alarm_cubit.dart';
import 'package:alarm_app/cubits/get_alarms/get_alarms_cubit.dart';
import 'package:alarm_app/data/repo.dart';
import 'package:alarm_app/ui/home_screen.dart';
import 'package:alarm_app/ui/widgets/add_alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutingManager{
  final alarmRepo = AlarmRepo();
  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutingConstances.home:
        return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => GetAlarmsCubit(alarmRepo: alarmRepo)..getAlarms(),
            child: const HomeScreen(),),);
      case AppRoutingConstances.addAlarm:
        return MaterialPageRoute(builder: (context) => BlocProvider(
          create: (context) => AddAlarmCubit(alarmRepo: alarmRepo),
            child: const AddAlarm(),),);
      default:
        return null;
    }
  }
}