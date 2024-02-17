import 'package:flutter/material.dart';
import 'package:student/app/global_widget/static/background_simple.dart';
import 'package:student/app/modules/show_video/controls_overlay.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_control_panel/video_player_control_panel.dart';

import '../controllers/show_video_controller.dart';

class ShowVideoView extends GetView<ShowVideoController> {
  const ShowVideoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSimple(
        titleText: 'Video'.tr,
        child: AspectRatio(
          aspectRatio: controller.videoPlayerController.value.aspectRatio,
          child: JkVideoControlPanel(
            controller.videoPlayerController,
            showClosedCaptionButton: true,
            showFullscreenButton: true,
            showVolumeButton: true,
          ),
        ),
      ),
    );
  }
}
