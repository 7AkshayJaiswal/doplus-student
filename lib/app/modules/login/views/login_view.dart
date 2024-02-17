import 'package:flutter/material.dart';
import 'package:student/app/data/enums/roles_enum.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/static/background.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/helper/validator.dart';
import 'package:student/app/modules/login/local_widgets/select_role_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackGround(
      child: ListView(
        children: [
          Hero(
            tag: "LOGO",
            child: Image.network(
              controller.sessionBySchoolCode.companyLogo ?? "",
              errorBuilder: (a,b,c) {
                return Image.asset(
                  AssetHelper.doplusText,
                  width: Get.width * 0.8,
                  height: Get.height * 0.25,
                );
              },
              width: Get.width * 0.8,
              height: Get.height * 0.25,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Obx(
                  () => Form(
                    key: controller.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10.0),
                        Text(
                          "login".tr.toUpperCase(),
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
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: 'email'.tr,
                            border: const OutlineInputBorder(),
                          ),
                          validator: Validator.validateEmail,
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: 'password'.tr,
                            border: const OutlineInputBorder(),
                          ),
                          obscureText: true,
                          validator: Validator.validatePassword,
                        ),
                        const SizedBox(height: 6.0),
                        InkWell(
                          onTap: controller.changeRememberStatus,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(seconds: 1),
                                  child: controller.isRememberValue.value
                                      ? Icon(
                                          FontAwesomeIcons.solidCircleCheck,
                                          color: ColorHelper.primary
                                              .withOpacity(0.8),
                                          size: 16,
                                        )
                                      : Icon(
                                          FontAwesomeIcons.circleCheck,
                                          color:
                                              ColorHelper.grey.withOpacity(0.4),
                                          size: 16,
                                        ),
                                ).paddingOnly(right: 6),
                                Text(
                                  "rememberMe".tr,
                                  style: TextStyleHelper.grey12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        PrimaryButton(
                          onPressed: controller.submitAction,
                          text: 'submit'.tr,
                          isLoading: controller.isLoading.value,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: controller.contactUsAction,
                              child: Text(
                                "contactUS".tr,
                                style: TextStyleHelper.primary12.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: controller.forgotPasswordAction,
                              child: Text(
                                "forgotPassword?".tr,
                                style: TextStyleHelper.primary12.copyWith(
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "---------------------- ${"or".tr.toUpperCase()} ----------------------",
                          style: TextStyleHelper.grey12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: controller.signUpAction,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "dontHaveAccount?".tr,
                                      style: TextStyleHelper.grey12,
                                    ),
                                    TextSpan(
                                      text: "createAccount".tr,
                                      style: TextStyleHelper.primary12.copyWith(
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
