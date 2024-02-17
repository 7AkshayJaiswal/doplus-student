import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/static/background.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/helper/validator.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: ListView(
        children: [
          Hero(
            tag: "LOGO",
            child: Image.asset(
              AssetHelper.doplusText,
              width: Get.width * 0.8,
              height: Get.height * 0.25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10.0),
                      Text(
                        "signup".tr.toUpperCase(),
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
                        controller: controller.schoolCodeController,
                        decoration: InputDecoration(
                          labelText: 'schoolCode'.tr,
                          border: const OutlineInputBorder(),
                        ),
                        validator: Validator.validateSchoolCode,
                      ),
                      const SizedBox(height: 12.0),
                      TextFormField(
                        controller: controller.schoolIdController,
                        decoration: InputDecoration(
                          labelText: 'schoolId'.tr,
                          border: const OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: Validator.validateSchoolId,
                      ),
                      const SizedBox(height: 12.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.schoolIdController,
                              decoration: InputDecoration(
                                labelText: 'academicYear'.tr,
                                border: const OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: Validator.validateAcaYear,
                            ),
                          ),
                          Text(
                            " - ${"or".tr.toUpperCase()} - ",
                            style: TextStyleHelper.grey12,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: controller.schoolIdController,
                              decoration: InputDecoration(
                                labelText: 'stdContact'.tr,
                                border: const OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: Validator.validateStdContact,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      Obx(
                        () => PrimaryButton(
                          onPressed: controller.submitAction,
                          text: 'submit'.tr,
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                    ],
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
