import 'package:alarm_app/helpers/color_helper.dart';
import 'package:alarm_app/helpers/text_style_helper.dart';
import 'package:flutter/material.dart';

class AlarmItem extends StatefulWidget {
  const AlarmItem({super.key});

  @override
  State<AlarmItem> createState() => _AlarmItemState();
}

class _AlarmItemState extends State<AlarmItem> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF535377),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Alarm 1',
            style: AppTextStyleHelper.font16whiteMedium,
          ),
          const SizedBox(height: 8),
          const Row(
            children: [
              Text(
                '8:00',
                style: AppTextStyleHelper.font36WhiteMedium,
              ),
              SizedBox(width: 8),
              Text(
                'PM',
                style: AppTextStyleHelper.font18whiteMedium,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Switch(
              value: isSwitched,
              activeColor: Colors.white,
              activeTrackColor: AppColorHelper.yellowColor,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
