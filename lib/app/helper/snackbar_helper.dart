import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class SnackBarHelper {
  static SnackBar errorShow(String errorMessage) => SnackBar(
        content: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: ColorHelper.primary.withOpacity(0.4),
                  width: 0.4,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: ColorHelper.primary,
                  size: 16,
                ),
              ),
            ),
            Expanded(
              child: Text(
                errorMessage,
                style: TextStyleHelper.light14.copyWith(
                  color: ColorHelper.error.withOpacity(0.8),
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: ColorHelper.warning),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        backgroundColor: ColorHelper.white,
      );

  static SnackBar successShow(String errorMessage) => SnackBar(
    content: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 6),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: ColorHelper.primary.withOpacity(0.4),
              width: 0.4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.check,
              color: ColorHelper.primary,
              size: 16,
            ),
          ),
        ),
        Expanded(
          child: Text(
            errorMessage,
            style: TextStyleHelper.light14.copyWith(
              color: ColorHelper.success.withOpacity(0.8),
            ),
          ),
        ),
      ],
    ),
    duration: const Duration(seconds: 5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(color: ColorHelper.success),
    ),
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    backgroundColor: ColorHelper.white,
  );
}
