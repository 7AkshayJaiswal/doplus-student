
import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/data/video_image_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickedVideoShow extends StatelessWidget {
  final AUploadFile<VideoImageFile> videoImageFile;
  final int i;
  final double dimension;
  final Function(int i, AUploadFile<VideoImageFile> videoImageFile)? actionRemove;
  final Function(int i, AUploadFile<VideoImageFile> videoImageFile)? actionExpand;

  const PickedVideoShow({
    super.key,
    required this.videoImageFile,
    this.dimension = 60,
    required this.actionRemove,
    required this.actionExpand,
    required this.i,
  });

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(12.0);
    return SizedBox.square(
      dimension: dimension + 20,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: radius,
                side: BorderSide(
                  color: ColorHelper.bold.withOpacity(0.6),
                  width: 1,
                ),
              ),
              color: ColorHelper.white,
              type: MaterialType.card,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: SizedBox.square(
                  dimension: dimension,
                  child: Stack(
                    children: [showImage],
                  ),
                ),
              ),
            ),
          ),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  actionExpand!(i, videoImageFile);
                },
                child: circleIcon(FontAwesomeIcons.expand),
              ),
            ),
          Align(
            alignment: Alignment.bottomLeft,
            child: InkWell(
              onTap: () {
                actionRemove!(i, videoImageFile);
              },
              child: circleIcon(Icons.cancel_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget get showImage {
    return Image.file(
      videoImageFile.file.thumbnailFile,
      width: dimension,
      height: dimension,
    );
  }

  Widget circleIcon(IconData icon) => Container(
        decoration: BoxDecoration(
          borderRadius: RoundedHelper.borderRadius6,
          color: ColorHelper.white,
          border: Border.all(
            color: ColorHelper.primary.withOpacity(0.2),
            width: 0.4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            icon,
            color: ColorHelper.primary.withOpacity(0.4),
            size: 18,
          ),
        ),
      );
}
