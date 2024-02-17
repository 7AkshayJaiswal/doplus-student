import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

class OnBackPressed {
  static Future<bool> handleAppClose(context) async {
    if (ModalRoute.of(context)!.canPop) {
      return Future.value(true);
    }
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            title: Text(
              "doPlus".tr,
              style: TextStyleHelper.bold18,
            ),
            content: Text(
              "areYouSureMessage".tr,
              style: TextStyleHelper.normal14,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  "no".tr,
                  style: TextStyleHelper.normal14.copyWith(
                    color: ColorHelper.success,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  "yes".tr,
                  style: TextStyleHelper.normal14.copyWith(
                    color: ColorHelper.error,
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }
}
