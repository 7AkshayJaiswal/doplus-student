import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/auth_api_helper.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/api/models/session_by_school_code.dart';
import 'package:student/app/helper/snackbar_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController(text: "ins1");
  final passwordController = TextEditingController(text: "9971436263");
  final isLoading = false.obs;
  final isRememberValue = false.obs;
  final sessionBySchoolCode = Get.arguments as SchoolDataModel;

  @override
  void onInit() {
    super.onInit();
    rememberValuesFromStorage();
    debugPrint('sessionBySchoolCode: ${sessionBySchoolCode.toJson()}');
  }

  void contactUsAction() {
    Get.toNamed(Routes.CONTACT_US);
  }

  void submitAction() async {
    if (formKey.currentState!.validate()) {
      debugPrint('Email: ${emailController.text}');
      debugPrint('Password: ${passwordController.text}');
      String? token = await FirebaseMessaging.instance.getToken();
      isLoading.value = true;
      ResponseData<LoginDataModel> result = await AuthApiHelper.login(
        orgCode:  sessionBySchoolCode.orgCode.toString(),
        username: emailController.text.trim(),
        password: passwordController.text.trim(),
        token: token ?? "",
      );
      if (result.statusSuccess) {
        LoginDataModel responseData = result.data!;
        if (isRememberValue.isTrue) {
          await Storage.saveLogin(
            email: emailController.text.trim(),
            pass: passwordController.text.trim(),
          );
        } else {
          await Storage.clearRememberValue();
        }
        await Storage.saveData(response: responseData);
        Get.offAllNamed(
          Routes.HOME,
          arguments: result.data!,
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBarHelper.errorShow("${result.errorMessage}"),
        );
      }
      isLoading.value = false;
    }
  }

  void forgotPasswordAction() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  void signUpAction() {
    Get.toNamed(Routes.SIGNUP);
  }

  void rememberValuesFromStorage() {
    if (Storage.rememberValue) {
      isRememberValue.value = Storage.rememberValue;
      emailController.text = Storage.rememberEmail;
      passwordController.text = Storage.rememberPass;
    }
  }

  changeRememberStatus() {
    if (isRememberValue.value) {
      isRememberValue.value = false;
    } else {
      isRememberValue.value = true;
    }
    print('isRememberValue: ${isRememberValue.value}');
  }
}
