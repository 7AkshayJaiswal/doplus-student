import 'package:student/app/data/aupload_file.dart';

class GalleryItemModel {
  GalleryItemModel({
    required this.id,
    required this.imageUrl,
    required this.index,
    required this.uploadedFileDetails,
  });
  // index in list of image
  final int index;
  // id image (image url) to use in hero animation
  final String id;
  // image url
  final String imageUrl;
  final UploadedFileDetails uploadedFileDetails;
}