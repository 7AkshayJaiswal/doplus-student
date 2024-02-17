import 'package:flutter/material.dart';
import 'package:student/app/global_widget/static/background_simple.dart';

import 'package:get/get.dart';
import 'package:video_player_control_panel/video_player_control_panel.dart';

import '../controllers/show_video_online_controller.dart';

class ShowVideoOnlineView extends GetView<ShowVideoOnlineController> {
  const ShowVideoOnlineView({Key? key}) : super(key: key);
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
