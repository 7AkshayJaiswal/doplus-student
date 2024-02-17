import 'dart:io';

import 'package:another_audio_recorder/another_audio_recorder.dart';
import 'package:student/app/api/image_api_helper.dart';
import 'package:student/app/data/video_image_file.dart';

class AUploadFile<T> {
  final T file;
  String uploadedUrl;
  bool hasUploaded;
  UploadedFileDetails? uploadedFileDetails;

  AUploadFile({
    required this.file,
    this.uploadedUrl = "",
    this.hasUploaded = false,
    this.uploadedFileDetails,
  });

  bool get isFile => T == File;
  bool get isRecording => T == Recording;
  bool get isVideoImageFile => T == VideoImageFile;

  Future<bool> uploadImage(String fileType) async {
    if (hasUploaded == false) {
      String uploadFilePath = "";
      String uploadFileThumbnailPath = "";
      if (isFile) {
        uploadFilePath = (file as File).path;
      } else if (isRecording) {
        uploadFilePath = (file as Recording).path ?? "";
      } else if (isVideoImageFile) {
        uploadFilePath = (file as VideoImageFile).videoFile.path;
        uploadFileThumbnailPath = (file as VideoImageFile).thumbnailFile.path;
      }
      if (uploadFilePath.isNotEmpty) {
        String endName = Uri.file(uploadFilePath).pathSegments.last;
        String? url = await ImageApiHelper.uploadImage(
          path: uploadFilePath,
          endName: endName,
        );
        if (url != null) {
          uploadedUrl = url;
          hasUploaded = true;

          String thumbnailPath = "";
          if (isVideoImageFile) {
            String endName = Uri.file(uploadFileThumbnailPath).pathSegments.last;
            thumbnailPath = await ImageApiHelper.uploadImage(
              path: uploadFileThumbnailPath,
              endName: endName,
            ) ?? "";
          }
          uploadedFileDetails = UploadedFileDetails(
            fileName: endName,
            thumbnail: thumbnailPath,
            url: uploadedUrl,
            type: fileType,
          );
          return hasUploaded;
        }
      }
    }
    return false;
  }
}

extension FileToAUploadFile on File {
  AUploadFile<File> toAUploadFile() {
    return AUploadFile<File>(file: this);
  }
}

extension VideoImageFileToAUploadFile on VideoImageFile {
  AUploadFile<VideoImageFile> toAUploadFile() {
    return AUploadFile<VideoImageFile>(file: this);
  }
}

extension RecordingToAUploadFile on Recording {
  AUploadFile<Recording> toAUploadFile() {
    return AUploadFile<Recording>(file: this);
  }
}

class UploadedFileDetails {
  String? url;
  String? thumbnail;
  String? fileName;
  String? type;

  UploadedFileDetails({this.url, this.thumbnail, this.fileName, this.type});

  UploadedFileDetails.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    thumbnail = json['thumbnail'];
    fileName = json['file_name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['thumbnail'] = thumbnail;
    data['file_name'] = fileName;
    data['type'] = type;
    return data;
  }
}
