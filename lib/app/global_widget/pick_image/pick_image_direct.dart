import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/square_card_helper.dart';
import 'package:student/app/global_widget/pick_image/pick_image_bottom_sheet.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';


class PickImageAction extends StatelessWidget {
  final Function(bool isCamera)? pickImageAction;
  final bool typeOfActionImage;

  const PickImageAction({
    super.key,
    required this.pickImageAction,
    this.typeOfActionImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return SquareCardHelper(
      borderColor: ColorHelper.primary.withOpacity(0.2),
      onPressed: (){
        showModalBottomSheet(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          backgroundColor: Colors.white,
          context: Get.context!,
          builder: (c) => PickImageBottomSheet(
            pickImageAction: pickImageAction,
            typeOfActionImage: typeOfActionImage,
          ),
        );
      },
      child: Icon(
        FontAwesomeIcons.plus,
        color: ColorHelper.primary.withOpacity(0.4),
        size: 24,
      ),
    );
  }
}
