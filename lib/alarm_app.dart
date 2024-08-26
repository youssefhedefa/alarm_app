import 'package:alarm_app/core/routing/routing_constances.dart';
import 'package:alarm_app/core/routing/routing_manager.dart';
import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routingManager});

  final AppRoutingManager routingManager;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      onGenerateRoute: routingManager.onGenerateRoute,
      initialRoute: AppRoutingConstances.home,
    );
  }
}