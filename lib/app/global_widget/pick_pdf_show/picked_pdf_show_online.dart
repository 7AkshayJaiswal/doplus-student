import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PickedPdfShowOnline extends StatelessWidget {
  final UploadedFileDetails details;
  final double dimension;

  const PickedPdfShowOnline({
    super.key,
    this.dimension = 60,
    required this.details,
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
                Get.toNamed(Routes.SHOW_PDF, arguments: null);
              },
              child: circleIcon(FontAwesomeIcons.expand),
            ),
          ),
        ],
      ),
    );
  }

  Widget get showImage {
    return const Text("PDF");
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
