import 'package:alarm_app/helpers/color_helper.dart';
import 'package:alarm_app/routing/routing_constances.dart';
import 'package:alarm_app/ui/widgets/alarm_item.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.backgroundColor,
      floatingActionButton: buildFAB(context),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const AlarmItem();
          },
        ),
      ),
    );
  }

  Widget buildFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColorHelper.yellowColor,
      onPressed: () {
        Navigator.pushNamed(context, AppRoutingConstances.addAlarm);
      },
      child: const Icon(
          Icons.add,
        size: 34,
        color: AppColorHelper.backgroundColor,
      ),
    );
  }

}
