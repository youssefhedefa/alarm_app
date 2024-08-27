import 'package:alarm_app/core/helpers/color_helper.dart';
import 'package:alarm_app/core/helpers/notify_helper.dart';
import 'package:alarm_app/core/helpers/text_style_helper.dart';
import 'package:alarm_app/cubits/add_alarm_cubit/add_alarm_cubit.dart';
import 'package:alarm_app/ui/widgets/ring_selection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAlarm extends StatelessWidget {
  const AddAlarm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColorHelper.disableColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: CupertinoDatePicker(
                    backgroundColor: AppColorHelper.disableColor,
                    //minimumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (DateTime dateTime) {
                      print(dateTime);
                      context.read<AddAlarmCubit>().selectedTime = dateTime;
                    },
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: context.read<AddAlarmCubit>().alarmTitleController,
                  style: AppTextStyleHelper.font16whiteMedium,
                  cursorColor: AppColorHelper.disableColor,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    hintStyle: AppTextStyleHelper.font16disableMedium,
                    border: buildBorder(),
                    enabledBorder: buildBorder(),
                    focusedBorder: buildBorder(),
                  ),
                ),
                const SizedBox(height: 24),
                const RingSelection(),
                const SizedBox(height: 24),
                MaterialButton(
                  onPressed: () {
                    context.read<AddAlarmCubit>().addAlarm(
                          alarmTime: context.read<AddAlarmCubit>().selectedTime,
                          alarmTitle:
                              context.read<AddAlarmCubit>().alarmTitleController.text,
                          alarmTone: context.read<AddAlarmCubit>().selectedTone,
                        );
                    AppNotifyHelper.showScheduledNotification(
                      time: context.read<AddAlarmCubit>().selectedTime,
                      tone: context.read<AddAlarmCubit>().selectedTone,
                    );
                    Navigator.pop(context,true);
                  },
                  color: AppColorHelper.yellowColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                  child: const Text(
                    'Save',
                    style: AppTextStyleHelper.font24BlackMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColorHelper.greyColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );
  }
}
