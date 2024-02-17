import 'dart:io';

import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/data/video_image_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:video_thumbnail/video_thumbnail.dart';

class CreateAssignmentController extends GetxController {
  final fileImages = <AUploadFile<File>>[].obs;
  final fileImagesUploading = false.obs;
  final filePdfList = <AUploadFile<File>>[].obs;
  final filePdfListUploading = false.obs;
  final fileVideo = <AUploadFile<VideoImageFile>>[].obs;
  final fileVideoUploading = false.obs;
  final recordings = <AUploadFile<Recording>>[].obs;
  final recordingsUploading = false.obs;
  final allUploading = false.obs;

  void pickImageActionByChoice(bool isCamera) async {
    Get.back();
    if (isCamera) {
      XFile? cameraImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (cameraImage != null) {
        File? file = await cropImage(cameraImage.path);
        if (file != null) {
          fileImages.add(file.toAUploadFile());
        }
      }
    } else {
      List<XFile> listImage = await ImagePicker().pickMultiImage();
      for (var file in listImage) {
        fileImages.add(File(file.path).toAUploadFile());
      }
    }
  }

  void pickActionByChoiceVideo(bool isCamera) async {
    Get.back();
    XFile? video = await ImagePicker().pickVideo(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (video != null) {
      File videoFile = File(video.path);
      String? thumbnail = await VideoThumbnail.thumbnailFile(
        video: videoFile.path,
      );
      if (thumbnail != null) {
        fileVideo.add(
          VideoImageFile(
            videoFile: videoFile,
            thumbnailFile: File(thumbnail),
          ).toAUploadFile(),
        );
      } else {
        print("thumbnail has issues");
      }
    } else {
      print("No video selected");
    }
  }

  void actionExpand(int i, AUploadFile<File> file) {}

  void actionRemove(int i, AUploadFile<File> file) {
    fileImages.removeAt(i);
  }

  void openPdfAction() async {
    List<AUploadFile<File>> list = fileImages.value;
    final pdf = pw.Document();
    for (var file in list) {
      final image = pw.MemoryImage(
        File(file.file.path).readAsBytesSync(),
      );
      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(image),
            ); // Center
          },
        ),
      );
    }
    Uint8List data = await pdf.save();
    Get.toNamed(Routes.SHOW_PDF, arguments: data);
  }

  Future<File?> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 80,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'For Assignment',
          toolbarColor: ColorHelper.primary,
          toolbarWidgetColor: ColorHelper.white,
          initAspectRatio: CropAspectRatioPreset.original,
        ),
        IOSUiSettings(
          title: 'Profile Pic',
        ),
        WebUiSettings(
          context: Get.context!,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
          viewPort:
              const CroppieViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
  }

  actionVideoRemove(int i, AUploadFile<VideoImageFile> videoImageFile) {
    fileVideo.removeAt(i);
  }

  actionVideoExpand(int i, AUploadFile<VideoImageFile> videoImageFile) {
    Get.toNamed(Routes.SHOW_VIDEO, arguments: videoImageFile.file);
  }

  onRecordDone(Recording recording) {
    recordings.add(recording.toAUploadFile());
  }

  actionAudioRemove(int i, AUploadFile<Recording> videoImageFile) {
    recordings.removeAt(i);
  }

  pickPdfAction() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      for (var e in files) {
        filePdfList.add(e.toAUploadFile());
      }
    } else {
      // User canceled the picker
    }
  }

  actionPdfRemove(int i, AUploadFile<File> pdfFile) {
    filePdfList.removeAt(i);
  }

  actionPdfExpand(int i, AUploadFile<File> pdfFile) {
    Uint8List bytes = pdfFile.file.readAsBytesSync();
    Get.toNamed(Routes.SHOW_PDF, arguments: bytes);
  }

  void onSubmit() async {
    allUploading.value = true;
    List<UploadedFileDetails> listOfUploadFiles = [];
    if (fileImages.isNotEmpty) {
      fileImagesUploading.value = true;
      await Future.forEach<AUploadFile<File>>(fileImages, (file) async {
        await file.uploadImage("image");
        if (file.hasUploaded && file.uploadedFileDetails != null) {
          listOfUploadFiles.add(file.uploadedFileDetails!);
        }
      });
      fileImagesUploading.value = false;
    }
    if (filePdfList.isNotEmpty) {
      filePdfListUploading.value = true;
      await Future.forEach<AUploadFile<File>>(filePdfList, (file) async {
        await file.uploadImage("pdf");
        if (file.hasUploaded && file.uploadedFileDetails != null) {
          listOfUploadFiles.add(file.uploadedFileDetails!);
        }
      });
      filePdfListUploading.value = false;
    }
    if (fileVideo.isNotEmpty) {
      fileVideoUploading.value = true;
      await Future.forEach<AUploadFile<VideoImageFile>>(fileVideo,
          (file) async {
        await file.uploadImage("video");
        if (file.hasUploaded && file.uploadedFileDetails != null) {
          listOfUploadFiles.add(file.uploadedFileDetails!);
        }
      });
      fileVideoUploading.value = false;
    }
    if (recordings.isNotEmpty) {
      recordingsUploading.value = true;
      await Future.forEach<AUploadFile<Recording>>(recordings, (file) async {
        await file.uploadImage("audio");
        if (file.hasUploaded && file.uploadedFileDetails != null) {
          listOfUploadFiles.add(file.uploadedFileDetails!);
        }
      });
      recordingsUploading.value = false;
    }
    await Storage.setUploadedFileList(listOfUploadFiles);
    allUploading.value = false;

    Get.toNamed(Routes.ASSIGNMENT_DETAILS);
  }
}
