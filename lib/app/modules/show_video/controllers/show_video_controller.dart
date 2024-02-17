import 'package:student/app/data/video_image_file.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShowVideoController extends GetxController {
  VideoImageFile get data => Get.arguments as VideoImageFile;
  late VideoPlayerController videoPlayerController;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.file(
      data.videoFile,
    );
    videoPlayerController.initialize().then((_) => isLoading(false));
  }

  onEditAction(){

  }
}
