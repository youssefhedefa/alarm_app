import 'package:alarm_app/helpers/audio_helper.dart';
import 'package:alarm_app/helpers/color_helper.dart';
import 'package:alarm_app/helpers/text_style_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({super.key});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {

  late AudioPlayer audioPlayer;
  bool isPlaying = false;

  @override
  void initState() {
    audioPlayer = AudioPlayer();
    super.initState();
  }

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
                    minimumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.dateAndTime,
                    onDateTimeChanged: (DateTime dateTime) {
                      print(dateTime);
                    },
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
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
                Row(
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
                ),
                const SizedBox(height: 24),
                MaterialButton(
                  onPressed: () async {
                    audioPlayer.play();
                    //playAudio();
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
        color: AppColorHelper.disableColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
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
