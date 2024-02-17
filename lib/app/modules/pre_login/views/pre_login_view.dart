import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/cards/card_helper.dart';
import 'package:student/app/global_widget/static/background.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/helper/validator.dart';

import 'package:get/get.dart';

import '../controllers/pre_login_controller.dart';

class PreLoginView extends GetView<PreLoginController> {
  const PreLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      hideBackAction: true,
      child: ListView(
        children: [
          Hero(
            tag: "LOGO",
            child: Image.asset(
              AssetHelper.doplusText,
              width: Get.width * 0.8,
              height: Get.height * 0.3,
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
                        "schoolCode".tr.toUpperCase(),
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
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: controller.schoolCodeController,
                        textCapitalization: TextCapitalization.characters,
                        onFieldSubmitted: (s) => controller.submitAction(),
                        decoration: InputDecoration(
                          labelText: 'enterSchoolCode'.tr,
                          border: const OutlineInputBorder(),
                          counterText: ""
                        ),
                        maxLength: 7,
                        validator: Validator.validateSchoolCode,
                      ),
                      const SizedBox(height: 20.0),
                      Obx(
                        () => PrimaryButton(
                          onPressed: controller.submitAction,
                          text: 'login'.tr,
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                      changeLanguage.marginOnly(top: 8),
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
  Widget get changeLanguage {
    return CardHelper(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      onPressed: controller.onChangeLanguage,
      side: BorderSide.none,
      child: Row(
        children: [
          //circleIcon(Icons.g_translate_rounded),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: ColorHelper.primary.withOpacity(0.2),
                width: 0.4,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                AssetHelper.language,
                height: 20,
                width: 20,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "changeLanguage".tr,
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
}
