import 'package:alarm_app/core/helpers/color_helper.dart';
import 'package:alarm_app/core/helpers/text_style_helper.dart';
import 'package:alarm_app/data/model/alarm_model.dart';
import 'package:flutter/material.dart';

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
  //String alarmDate = '';
  String amPm = '';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        alarmTime = '${timeFormat().toString().padLeft(2, '0')} : ${widget.alarm.alarmTime.minute.toString().padLeft(2, '0')}';
        // alarmDate =
        //     '${widget.alarm.alarmTime.day}/${widget.alarm.alarmTime.month}/${widget.alarm.alarmTime.year}';
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
      return widget.alarm.alarmTime.hour > 12 ? (widget.alarm.alarmTime.hour - 12).toInt() : widget.alarm.alarmTime.hour;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) async {
        widget.alarm.delete();
      },
      background: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
            Icons.delete, color: Colors.white,
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF535377),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.alarm.alarmTitle,
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
                const Spacer(),
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
          ],
        ),
      ),
    );
  }
}
