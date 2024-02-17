
import 'dart:developer';
import 'package:amplify_flutter/amplify_flutter.dart';

class ImageApiHelper {
  static Future<String?> uploadImage({
    required String path,
    required String endName,
  }) async {
    try {
      //String time = "${DateTime.now().millisecondsSinceEpoch}.png";
      await Amplify.Storage.uploadFile(
        localFile: AWSFile.fromPath(path),
        key: endName,
        onProgress: (p) =>
            log('Uploading: ${p.transferredBytes}/${p.totalBytes}'),
      ).result;
      log("endName: $endName");
      String imagePath =
          "https://doplusstorage03001-dev.s3.ap-south-1.amazonaws.com/public/$endName";
      log("imagePath: $imagePath");
      return imagePath;
    } on StorageException catch (e) {
      log("Error uploading file - ${e.message}");
      return null;
    }
  }
}
