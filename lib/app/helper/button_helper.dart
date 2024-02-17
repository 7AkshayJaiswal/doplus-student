import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';

class ButtonHelper {
  static ButtonStyle get iconButtonModernStyle => IconButton.styleFrom(
    shape: RoundedHelper.roundWith12by6,
    hoverColor: ColorHelper.success,
    backgroundColor: Colors.white,
  );
}