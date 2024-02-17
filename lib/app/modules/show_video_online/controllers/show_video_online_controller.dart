import 'package:student/app/data/aupload_file.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShowVideoOnlineController extends GetxController {
  UploadedFileDetails get data => Get.arguments as UploadedFileDetails;
  late VideoPlayerController videoPlayerController;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    videoPlayerController = VideoPlayerController.networkUrl(
      Uri.parse(data.url!),
    );
    videoPlayerController.initialize().then((_) => isLoading(false));
  }

  onEditAction() {}
}
