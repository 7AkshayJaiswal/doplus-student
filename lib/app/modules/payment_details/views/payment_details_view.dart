  import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/static/background_simple.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/payment_details_controller.dart';

class PaymentDetailsView extends GetView<PaymentDetailsController> {
  const PaymentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSimple(
        titleText: 'payment'.tr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                "Confirm Payment",
                style: TextStyleHelper.bold18,
              ).marginOnly(top: 16, bottom: 4),
              Text(
                "Confirm your plan before proceeding the payments, this subscription plan will be for three month.",
                style: TextStyleHelper.grey12,
              ),
              menuDivider.marginSymmetric(vertical: 12),
              orderOverview,
              menuDivider.marginSymmetric(vertical: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Subtotal",
                    style: TextStyleHelper.normal14,
                  ),
                  Text(
                    "₹999",
                    style: TextStyleHelper.normal14,
                  ),
                ],
              ).marginSymmetric(horizontal: 8),
              menuDivider.marginSymmetric(vertical: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Tax",
                    style: TextStyleHelper.normal14,
                  ),
                  Text(
                    "₹179",
                    style: TextStyleHelper.normal14,
                  ),
                ],
              ).marginSymmetric(horizontal: 8),
              menuDivider.marginSymmetric(vertical: 12),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Total",
                    style: TextStyleHelper.normal14,
                  ),
                  Text(
                    "₹1178",
                    style: TextStyleHelper.normal14,
                  ),
                ],
              ).marginSymmetric(horizontal: 8),
              menuDivider.marginSymmetric(vertical: 12),
              PrimaryButton(
                isLoading: false,
                onPressed: controller.actionSuccess,
                text: "Pay Now",
              ).marginOnly(top: 16),
              OutlinedButton(
                onPressed: controller.actionError,
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: BorderSide(
                    width: 0.4,
                    color: ColorHelper.grey.withOpacity(0.3),
                  ),
                ),
                child: Text(
                  "Later",
                  style: TextStyleHelper.grey14,
                ),
              ).marginOnly(top: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget get orderOverview => Container(
        margin: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(
            color: ColorHelper.primary.withOpacity(1),
            width: 0.6,
          ),
          color: ColorHelper.primary.withOpacity(0.05),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "3 Month",
                  style: TextStyleHelper.bold14
                      .copyWith(fontWeight: FontWeight.w400),
                ),
                Text(
                  "₹999",
                  style: TextStyleHelper.bold14
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ).marginOnly(bottom: 6),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Price per month",
                  style: TextStyleHelper.normal14,
                ),
                Text(
                  "₹399",
                  style: TextStyleHelper.normal14,
                ),
              ],
            ),
          ],
        ),
      );

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.4,
      );
}
