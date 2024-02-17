import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:voice_message_package/voice_message_package.dart';

class PickedAudioShow extends StatelessWidget {
  final AUploadFile<Recording> recording;
  final int i;
  final Function(int i, AUploadFile<Recording> videoImageFile)? actionRemove;

  const PickedAudioShow({
    super.key,
    required this.recording,
    required this.actionRemove,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(12.0);
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: radius,
        side: BorderSide(
          color: ColorHelper.bold.withOpacity(0.6),
          width: 1,
        ),
      ),
      color: ColorHelper.white,
      type: MaterialType.card,
      child: Stack(
        children: [
          VoiceMessageView(
            controller: VoiceController(
              isFile: true,
              audioSrc: recording.file.path ?? "",
              maxDuration: recording.file.duration ?? const Duration(seconds: 10),
              onComplete: () {},
              onPause: () {},
              onPlaying: () {},
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () {
                actionRemove!(i, recording);
              },
              child: circleIcon(Icons.cancel_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget circleIcon(IconData icon) => Container(
        decoration: BoxDecoration(
          borderRadius: RoundedHelper.borderRadius6,
          color: ColorHelper.white,
          border: Border.all(
            color: ColorHelper.primary.withOpacity(0.2),
            width: 0.4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            icon,
            color: ColorHelper.primary.withOpacity(0.4),
            size: 18,
          ),
        ),
      );
}
