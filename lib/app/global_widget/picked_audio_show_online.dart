import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:voice_message_package/voice_message_package.dart';

class PickedAudioShowOnline extends StatelessWidget {
  final UploadedFileDetails details;

  const PickedAudioShowOnline({
    super.key,
    required this.details,
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
      child: VoiceMessageView(
        controller: VoiceController(
          isFile: false,
          audioSrc: details.url!,
          maxDuration: const Duration(hours: 12),
          onComplete: () {},
          onPause: () {},
          onPlaying: () {},
        ),
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
