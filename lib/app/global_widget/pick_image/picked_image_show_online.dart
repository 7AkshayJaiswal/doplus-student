import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'insta_image_viewer.dart';

class PickedImageShowOnline extends StatelessWidget {
  final UploadedFileDetails details;
  final double dimension;
  final int i;

  const PickedImageShowOnline({
    super.key,
    required this.details,
    this.dimension = 60,
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
        ],
      ),
    );
  }

  Widget get showImage {
    return InstaImageViewer(
      backgroundColor: ColorHelper.white,
      child: Image.network(
        details.url!,
        width: dimension,
        height: dimension,
      ),
    );
  }
}
