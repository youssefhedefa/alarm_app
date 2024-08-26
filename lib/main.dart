import 'package:alarm_app/alarm_app.dart';
import 'package:alarm_app/routing/routing_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp(
    routingManager: AppRoutingManager(),
  ));
}

