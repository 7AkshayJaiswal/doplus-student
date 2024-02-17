import 'package:flutter/material.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/auth_api_helper.dart';
import 'package:student/app/helper/snackbar_helper.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final desController = TextEditingController();
  final isLoading = false.obs;

  void submitAction() async {
    if (formKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      isLoading.value = true;
      // ResponseData<String> result = await AuthApiHelper.sendContactUsRequest(
      //   name: nameController.text.trim(),
      //   email: emailController.text.trim(),
      //   mobileNumber: numberController.text.trim(),
      //   description: desController.text.trim(),
      //   requestType: "contact_us",
      //
      // );
      // if (result.statusSuccess) {
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(
      //     SnackBarHelper.successShow("${result.data}"),
      //   );
      //   Get.back();
      // } else {
      //   ScaffoldMessenger.of(Get.context!).showSnackBar(
      //     SnackBarHelper.errorShow("${result.errorMessage}"),
      //   );
      // }
      isLoading.value = false;
    }
  }
}
