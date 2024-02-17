import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:get/get.dart';

class AssignmentDetailsController extends GetxController {
  final uploadedList = <UploadedFileDetails>[].obs;

  List<UploadedFileDetails> get imageList =>
      uploadedList.where((p0) => p0.type == "image").toList();

  List<String> get imageUrlList => imageList.map((e) => e.url ?? "").toList();

  List<UploadedFileDetails> get videoList =>
      uploadedList.where((p0) => p0.type == "video").toList();

  List<UploadedFileDetails> get pdfList =>
      uploadedList.where((p0) => p0.type == "pdf").toList();

  List<UploadedFileDetails> get audioList =>
      uploadedList.where((p0) => p0.type == "audio").toList();

  @override
  void onInit() {
    super.onInit();
    getDetailFromStorage();
  }

  void getDetailFromStorage() {
    List<UploadedFileDetails> data = Storage.getUploadedFileList;
    uploadedList.addAll(data);
  }
}
