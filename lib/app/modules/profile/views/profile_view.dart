import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:student/app/global_widget/appbar/editable_image_app_bar.dart';
import 'package:student/app/global_widget/cards/card_helper.dart';
import 'package:student/app/global_widget/static/background_simple.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

import 'package:get/get.dart';
import 'package:student/app/modules/profile/local_widget/basic_information_card.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSimple(
        titleText: 'profile'.tr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Obx(
            () => ListView(
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              children: [
                EditableImageAppBar(
                  imagePath: controller.userProfileImageFile.value?.path,
                  imageFile: controller.userProfileImageFile.value,
                  getImage: controller.getImageFromGallery,
                  editable: true,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    controller.userDetails.value?.name ?? "N/A",
                    style: TextStyleHelper.bold16,
                  ),
                ),
                menuDivider.marginSymmetric(vertical: 12),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BasicInformationCard(
                      userDetails: controller.userDetails.value,
                    ),
                    const SizedBox(height: 8),
                    menuDivider.marginSymmetric(vertical: 12),
                    Text(
                      "security&Privacy".tr,
                      style: TextStyleHelper.grey14,
                    ),
                    bottomFocus,
                    const SizedBox(height: 8),
                    menuItemCard(
                      text: "changePassword".tr,
                      icon: Icons.lock_rounded,
                      onPressed: controller.openChangePasswordPage,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget menuItemCard({
    required IconData icon,
    required String text,
    required Function()? onPressed,
  }) {
    return CardHelper(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: onPressed,
      side: BorderSide.none,
      child: Row(
        children: [
          circleIcon(icon),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyleHelper.normal14,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: ColorHelper.grey,
            size: 12,
          ),
        ],
      ),
    );
  }

  Widget circleIcon(IconData icon) => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorHelper.primary.withOpacity(0.2),
            width: 0.4,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: ColorHelper.primary.withOpacity(0.4),
            size: 16,
          ),
        ),
      );

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.4,
      );

  Widget get bottomFocus => Container(
        height: 2,
        width: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorHelper.primary.withOpacity(0.6),
        ),
      );
}
