import 'dart:developer';

import 'package:alarm_app/core/helpers/audio_helper.dart';
import 'package:alarm_app/core/helpers/color_helper.dart';
import 'package:alarm_app/core/helpers/text_style_helper.dart';
import 'package:alarm_app/cubits/add_alarm_cubit/add_alarm_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';


class RingSelection extends StatefulWidget {
  const RingSelection({super.key});

  @override
  State<RingSelection> createState() => _RingSelectionState();
}

class _RingSelectionState extends State<RingSelection> {

  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DropdownMenu(
          menuHeight: 250,
          width: MediaQuery.of(context).size.width - 100,
          initialSelection: 0,
          textStyle: AppTextStyleHelper.font16whiteMedium,
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                  (states) => AppColorHelper.disableColor,
            ),
          ),
          onSelected: (int? value) {
            audioPlayer.setAsset(audioMap[value!]!);
            context.read<AddAlarmCubit>().selectedTone = audioMap[value]!.replaceFirst('assets/alarm_sounds/', '');
            log(context.read<AddAlarmCubit>().selectedTone);
          },
          dropdownMenuEntries: dropDownItemMaker(items: [
            'Ring 1',
            'Ring 2',
            'Ring 3',
          ]),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {
            isPlaying ? audioPlayer.pause() :  audioPlayer.play();
            setState(() {
              isPlaying = !isPlaying;
            });
          },
          icon: Icon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            color: AppColorHelper.yellowColor,
            size: 40,
          ),
        ),
      ],
    );
  }

  List<DropdownMenuEntry<int>> dropDownItemMaker({required List items}) {
    List<DropdownMenuEntry<int>> dropDownItems = [];

    for (int i = 0; i < items.length; i++) {
      dropDownItems.add(
        DropdownMenuEntry(
          value: i,
          label: items[i],
          labelWidget: Text(
            items[i].toString(),
            style: AppTextStyleHelper.font16whiteMedium,
          ),
        ),
      );
    }

    return dropDownItems;
  }

  Map<int,String> audioMap = {
    0: AppAudioHelper.audio1Path,
    1: AppAudioHelper.audio2Path,
    2: AppAudioHelper.audio3Path,
  };

}
