import 'package:get/get.dart';

import '../controllers/show_video_online_controller.dart';

class ShowVideoOnlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowVideoOnlineController>(
      () => ShowVideoOnlineController(),
    );
  }
}
