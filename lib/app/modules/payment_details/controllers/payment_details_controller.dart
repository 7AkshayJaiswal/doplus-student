import 'package:flutter/material.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../helper/asset_helper.dart';
import '../../../helper/color_helper.dart';

class PaymentDetailsController extends GetxController {
  //TODO: Implement PaymentDetailsController

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void actionSuccess() {
    showModalBottomSheet(
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Lottie.asset(AssetHelper.paymentSuccess, height: Get.height * 0.35),
            Text(
              "Payment successful!",
              style: TextStyleHelper.bold18.copyWith(
                color: ColorHelper.success,
              ),
            ).marginSymmetric(vertical: 12),
            Text(
              "We have received your payment.\nYour plan will be active soon",
              style: TextStyleHelper.grey10,
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              onPressed: () => Get.back(),
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(),
                side: BorderSide(
                  width: 0.4,
                  color: ColorHelper.grey.withOpacity(0.3),
                ),
              ),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 24,
                color: ColorHelper.grey.withOpacity(0.4),
              ),
            ).marginOnly(top: 8),
          ],
        ),
      ),
    );
  }

  void actionError() {
    showModalBottomSheet(
      context: Get.context!,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      builder: (context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Lottie.asset(AssetHelper.paymentFailure, height: Get.height * 0.35),
            Text(
              "Payment Failed",
              style: TextStyleHelper.bold18.copyWith(
                color: ColorHelper.error,
              ),
            ).marginSymmetric(vertical: 12),
            Text(
              "Don't worry. We'll try your payment again over the next few days.\nTo keep Spotify Premium you may need to update your payments details.",
              style: TextStyleHelper.grey10,
              textAlign: TextAlign.center,
            ),
            OutlinedButton(
              onPressed: () => Get.back(),
              style: OutlinedButton.styleFrom(
                shape: CircleBorder(),
                side: BorderSide(
                  width: 0.4,
                  color: ColorHelper.grey.withOpacity(0.3),
                ),
              ),
              child: Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 24,
                color: ColorHelper.grey.withOpacity(0.4),
              ),
            ).marginOnly(top: 8),
          ],
        ),
      ),
    );
  }
}
