import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/static/background.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/helper/validator.dart';

import 'package:get/get.dart';

import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      hideBackAction: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: Get.height * 0.3,
              maxHeight: Get.height * 0.6,
            ),
            child: Hero(
              tag: "LOGO",
              child: Image.asset(
                AssetHelper.doplusText,
                width: Get.width * 0.5,
                height: Get.height * 0.18,
              ),
            ),
          ),
          Expanded(
            child: Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(
                      () => Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10.0),
                          Text(
                            "contactUS".tr.toUpperCase(),
                            style: TextStyleHelper.primaryText(20).copyWith(
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Container(
                            height: 4,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.deepOrangeAccent,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: controller.nameController,
                            decoration: InputDecoration(
                              labelText: 'name'.tr,
                              border: const OutlineInputBorder(),
                            ),
                            validator: Validator.validateName,
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            controller: controller.emailController,
                            decoration: InputDecoration(
                              labelText: 'email'.tr,
                              border: const OutlineInputBorder(),
                            ),
                            validator: Validator.validateEmail,
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            controller: controller.numberController,
                            decoration: InputDecoration(
                                labelText: 'mobileNumber'.tr,
                                border: const OutlineInputBorder(),
                                counterText: ""),
                            maxLength: 10,
                            validator: Validator.validatePassword,
                          ),
                          const SizedBox(height: 12.0),
                          TextFormField(
                            controller: controller.desController,
                            decoration: InputDecoration(
                              labelText: 'description'.tr,
                              border: const OutlineInputBorder(),
                            ),
                            maxLines: 3,
                            minLines: 2,
                            validator: Validator.validateRequirement,
                          ),
                          const SizedBox(height: 12.0),
                          PrimaryButton(
                            fullWidth: true,
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
            ),
          ),
        ],
      ),
    );
  }
}
