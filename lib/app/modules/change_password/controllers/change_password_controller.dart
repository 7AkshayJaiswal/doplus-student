import 'package:flutter/material.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/auth_api_helper.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final oldController = TextEditingController();
  final pwdController = TextEditingController();
  final pwdConfirmController = TextEditingController();
  final isLoading = false.obs;

  void submitAction() async {
    if (formKey.currentState!.validate()) {
      print('oldController: ${oldController.text}');
      print('pwdController: ${pwdController.text}');
      print('pwdConfirmController: ${pwdConfirmController.text}');
      isLoading.value = true;
      ResponseData<bool> result =
          await AuthApiHelper.changePassword(
        oldPassword: oldController.text.trim(),
        newPassword: pwdController.text.trim(),
      );
      if (result.statusSuccess) {
      } else {}
      isLoading.value = false;
    }
  }
}
