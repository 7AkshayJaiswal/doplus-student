import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/square_card_helper.dart';
import 'package:student/app/global_widget/pick_image/pick_image_bottom_sheet.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class PickPdfAction extends StatelessWidget {
  final Function()? pickPdfAction;

  const PickPdfAction({
    super.key,
    required this.pickPdfAction,
  });

  @override
  Widget build(BuildContext context) {
    return SquareCardHelper(
      borderColor: ColorHelper.primary.withOpacity(0.2),
      onPressed: pickPdfAction,
      child: Icon(
        FontAwesomeIcons.plus,
        color: ColorHelper.primary.withOpacity(0.4),
        size: 24,
      ),
    );
  }
}
