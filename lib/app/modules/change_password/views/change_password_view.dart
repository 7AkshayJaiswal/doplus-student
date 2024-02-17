import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/static/background_simple.dart';
import 'package:student/app/global_widget/static/background_with_searchbar.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/helper/validator.dart';

import 'package:get/get.dart';

import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundSimple(
        titleText: 'changePassword'.tr,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 16
          ),
          child: Obx(
            () => Form(
              key: controller.formKey,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Change Your Password",
                      style: TextStyleHelper.bold16,
                      textAlign: TextAlign.center,
                    ),
                  ).marginOnly(bottom: 6),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Your New Password must be different from your Current Password.",
                      style: TextStyleHelper.grey12,
                      textAlign: TextAlign.center,
                    ),
                  ).marginOnly(bottom: 16),
                  TextFormField(
                    controller: controller.oldController,
                    decoration: InputDecoration(
                      labelText: 'oldPassword'.tr,
                      border: const OutlineInputBorder(),
                    ),
                    validator: Validator.validateOldPassword,
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: controller.pwdController,
                    decoration: InputDecoration(
                      labelText: 'newPassword'.tr,
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: Validator.validateNewPassword,
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    controller: controller.pwdConfirmController,
                    decoration: InputDecoration(
                      labelText: 'newConfirmPassword'.tr,
                      border: const OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (String? v) => Validator.validateNewConfirmPassword(v, controller.pwdController.text),
                  ),
                  const SizedBox(height: 12.0),
                  PrimaryButton(
                    onPressed: controller.submitAction,
                    text: 'submit'.tr,
                    isLoading: controller.isLoading.value,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.4,
      );
}
