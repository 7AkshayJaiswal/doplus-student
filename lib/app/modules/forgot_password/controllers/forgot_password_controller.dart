import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final schoolCodeController = TextEditingController();
  final schoolIdController = TextEditingController();
  final acaYearController = TextEditingController();
  final stdContactController = TextEditingController();
  final isLoading = false.obs;

  void submitAction() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 4));
      isLoading.value = false;
    }
  }
}
