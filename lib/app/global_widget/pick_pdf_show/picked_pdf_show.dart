import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PickedPdfShow extends StatelessWidget {
  final AUploadFile<File> pdfFile;
  final int i;
  final double dimension;
  final Function(int i, AUploadFile<File> pdfFile)? actionRemove;
  final Function(int i, AUploadFile<File> pdfFile)? actionExpand;

  const PickedPdfShow({
    super.key,
    this.dimension = 60,
    required this.actionRemove,
    required this.pdfFile,
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
                actionExpand!(i, pdfFile);
              },
              child: circleIcon(FontAwesomeIcons.expand),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: InkWell(
              onTap: () {
                actionRemove!(i, pdfFile);
              },
              child: circleIcon(Icons.cancel_outlined),
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
