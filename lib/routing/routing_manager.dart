import 'package:alarm_app/routing/routing_constances.dart';
import 'package:alarm_app/ui/home_screen.dart';
import 'package:alarm_app/ui/widgets/add_alarm.dart';
import 'package:flutter/material.dart';

class AppRoutingManager{
  Route? onGenerateRoute(RouteSettings settings){
    switch(settings.name){
      case AppRoutingConstances.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case AppRoutingConstances.addAlarm:
        return MaterialPageRoute(builder: (context) => const AddAlarm());
      default:
        return null;
    }
  }
}