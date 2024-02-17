import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';

class RoundedHelper {
  static BorderRadiusGeometry get borderRadius24 => const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(6),
        topLeft: Radius.circular(6),
        topRight: Radius.circular(24),
      );

  static BorderRadiusGeometry get borderRadius6 => BorderRadius.circular(6);

  static BoxDecoration get roundComplete6 => BoxDecoration(
        borderRadius: borderRadius6,
        border: Border.all(
          color: ColorHelper.primary.withOpacity(0.4),
          width: 0.2,
        ),
      );

  static BoxDecoration get roundComplete6Grey => BoxDecoration(
        borderRadius: borderRadius6,
        border: Border.all(
          color: ColorHelper.grey.withOpacity(0.3),
          width: 0.3,
        ),
      );

  static BoxDecoration get roundComplete6GreyLight => BoxDecoration(
        borderRadius: borderRadius6,
        border: Border.all(
          color: ColorHelper.grey.withOpacity(0.1),
          width: 0.1,
        ),
      );

  static BorderRadiusGeometry get borderRadius12 => const BorderRadius.only(
        bottomLeft: Radius.circular(12),
        bottomRight: Radius.circular(6),
        topLeft: Radius.circular(6),
        topRight: Radius.circular(12),
      );

  static OutlinedBorder get roundWith12by6 => RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(6),
          topLeft: Radius.circular(6),
          topRight: Radius.circular(12),
        ),
        side: BorderSide(
          color: ColorHelper.primary.withOpacity(0.2),
          width: 0.4,
        ),
      );

  static OutlinedBorder get roundComplete => RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        side: BorderSide(
          color: ColorHelper.primary.withOpacity(0.2),
          width: 0.4,
        ),
      );

  static OutlinedBorder get roundSmooth => RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        side: BorderSide(
          color: ColorHelper.primary.withOpacity(0.2),
          width: 0.4,
        ),
      );

  static OutlinedBorder get roundOutline => RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(
          color: ColorHelper.primary,
          width: 1,
        ),
      );
}
