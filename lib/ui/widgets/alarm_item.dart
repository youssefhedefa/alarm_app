import 'package:alarm_app/core/helpers/color_helper.dart';
import 'package:alarm_app/core/helpers/text_style_helper.dart';
import 'package:alarm_app/cubits/get_alarms/get_alarms_cubit.dart';
import 'package:alarm_app/data/model/alarm_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlarmItem extends StatefulWidget {
  const AlarmItem({
    super.key,
    required this.alarm,
  });

  final AlarmModel alarm;

  @override
  State<AlarmItem> createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {
  String alarmTime = '';
  String alarmDate = '';
  String amPm = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        alarmTime = '${timeFormat().toString().padLeft(2, '0')} : ${widget.alarm.alarmTime.minute.toString().padLeft(2, '0')}';
        alarmDate =
            '${widget.alarm.alarmTime.day}/${widget.alarm.alarmTime.month}/${widget.alarm.alarmTime.year}';
        amPm = widget.alarm.alarmTime.hour > 12 ? 'PM' : 'AM';
      });
    });
    super.initState();
  }

  timeFormat(){
    if(widget.alarm.alarmTime.hour == 0){
      return 12;
    }
    else{
      return widget.alarm.alarmTime.hour > 12 ? ((widget.alarm.alarmTime.hour / 2) - 2).toInt() : widget.alarm.alarmTime.hour;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.alarm.id);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF535377),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.alarm.alarmTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyleHelper.font16whiteMedium,
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  widget.alarm.delete();
                  context.read<GetAlarmsCubit>().getAlarms();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ],
          ),
          Text(
            alarmDate,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyleHelper.font16whiteMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                alarmTime,
                style: AppTextStyleHelper.font36WhiteMedium,
              ),
              const SizedBox(width: 8),
              Text(
                amPm,
                style: AppTextStyleHelper.font18whiteMedium,
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Switch(
              value: widget.alarm.alarmActive,
              activeColor: Colors.white,
              activeTrackColor: AppColorHelper.yellowColor,
              onChanged: (value) {
                setState(() {
                  widget.alarm.alarmActive = value;
                  widget.alarm.save();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
