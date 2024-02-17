import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleHelper {

  // NORMAL TEXT
  static TextStyle get normal10 => normalText(10);
  static TextStyle get normal12 => normalText(12);
  static TextStyle get normal14 => normalText(14);
  static TextStyle get normal16 => normalText(16);
  static TextStyle get normal18 => normalText(18);

  static TextStyle normalText(double fontSize) => GoogleFonts.raleway(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: ColorHelper.normal,
        decoration: TextDecoration.none,
      );

  // BOLD TEXT
  static TextStyle get bold10 => boldText(10);
  static TextStyle get bold12 => boldText(12);
  static TextStyle get bold14 => boldText(14);
  static TextStyle get bold16 => boldText(16);
  static TextStyle get bold18 => boldText(18);

  static TextStyle boldText(double fontSize) => GoogleFonts.raleway(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: ColorHelper.bold,
        decoration: TextDecoration.none,
      );

  // GREY TEXT
  static TextStyle get grey10 => greyText(10);
  static TextStyle get grey12 => greyText(12);
  static TextStyle get grey14 => greyText(14);
  static TextStyle get grey16 => greyText(16);
  static TextStyle get grey18 => greyText(18);

  static TextStyle greyText(double fontSize) => GoogleFonts.raleway(
    fontSize: fontSize,
    fontWeight: FontWeight.normal,
    color: ColorHelper.grey,
    decoration: TextDecoration.none,
  );


  // LIGHT TEXT
  static TextStyle get light10 => lightText(10);
  static TextStyle get light12 => lightText(12);
  static TextStyle get light14 => lightText(14);
  static TextStyle get light16 => lightText(16);
  static TextStyle get light18 => lightText(18);

  static TextStyle lightText(double fontSize) => GoogleFonts.raleway(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    decoration: TextDecoration.none,
  );

  // PRIMARY TEXT
  static TextStyle get primary10 => primaryText(10);
  static TextStyle get primary12 => primaryText(12);
  static TextStyle get primary14 => primaryText(14);
  static TextStyle get primary16 => primaryText(16);
  static TextStyle get primary18 => primaryText(18);

  static TextStyle primaryText(double fontSize) => GoogleFonts.raleway(
    fontSize: fontSize,
    fontWeight: FontWeight.bold,
    color: ColorHelper.primary,
    decoration: TextDecoration.none,
  );
}
