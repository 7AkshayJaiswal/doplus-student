import 'package:get/get.dart';

import '../controllers/show_video_controller.dart';

class ShowVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowVideoController>(
      () => ShowVideoController(),
    );
  }
}
