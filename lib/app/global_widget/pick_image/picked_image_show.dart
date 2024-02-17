import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'insta_image_viewer.dart';

class PickedImageShow extends StatelessWidget {
  final AUploadFile<File> file;
  final int i;
  final double dimension;
  final bool typeImage;
  final Function(int i, AUploadFile<File> file)? actionRemove;
  final Function(int i, AUploadFile<File> file)? actionExpand;

  const PickedImageShow({
    super.key,
    required this.file,
    this.dimension = 60,
    required this.actionRemove,
    required this.actionExpand,
    required this.i, this.typeImage = true,
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
          if (typeImage == false)
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  actionExpand!(i, file);
                },
                child: circleIcon(FontAwesomeIcons.expand),
              ),
            ),
          Align(
            alignment: typeImage ? Alignment.topRight : Alignment.bottomLeft,
            child: InkWell(
              onTap: () {
                actionRemove!(i, file);
              },
              child: circleIcon(Icons.cancel_outlined),
            ),
          ),
        ],
      ),
    );
  }

  Widget get showImage {
    if (typeImage) {
      return InstaImageViewer(
        backgroundColor: ColorHelper.white,
        child: Image.file(
          file.file,
          width: dimension,
          height: dimension,
        ),
      );
    }
    return Image.file(
      file.file,
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
