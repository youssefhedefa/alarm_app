import 'package:alarm_app/core/helpers/color_helper.dart';
import 'package:alarm_app/core/helpers/text_style_helper.dart';
import 'package:alarm_app/core/routing/routing_constances.dart';
import 'package:alarm_app/cubits/get_alarms/get_alarms_cubit.dart';
import 'package:alarm_app/cubits/get_alarms/get_alarms_states.dart';
import 'package:alarm_app/ui/widgets/alarm_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.backgroundColor,
      floatingActionButton: buildFAB(context),
      body: SafeArea(
        child: BlocBuilder<GetAlarmsCubit, GetAlarmsStates>(
            builder: (context, state) {
          if (state is GetAlarmsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetAlarmsFailed) {
            return Center(child: Text(state.error));
          }
          if (state is GetAlarmsSuccess) {
            if (state.alarms.isEmpty) {
              return const Center(
                child: Text(
                  'No alarms yet',
                  style: AppTextStyleHelper.font36WhiteMedium,
                ),
              );
            } else {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: state.alarms.length,
                itemBuilder: (context, index) {
                  return AlarmItem(
                    alarm: state.alarms[index],
                  );
                },
              );
            }
          }
          return const SizedBox();
        }),
      ),
    );
  }

  Widget buildFAB(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColorHelper.yellowColor,
      onPressed: () {
        // get alarm data
        Navigator.pushNamed(context, AppRoutingConstances.addAlarm)
            .then((value) => context.read<GetAlarmsCubit>().getAlarms());
      },
      child: const Icon(
        Icons.add,
        size: 34,
        color: AppColorHelper.backgroundColor,
      ),
    );
  }
}
