import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/auth_api_helper.dart';
import 'package:student/app/api/models/session_by_school_code.dart';
import 'package:student/app/global_widget/popup/popup_for_language_selection.dart';
import 'package:student/app/helper/snackbar_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PreLoginController extends GetxController {
  final isLoading = false.obs;
  final formKey = GlobalKey<FormState>();
  final schoolCodeController = TextEditingController(
    text: kDebugMode ? "INS10" : "",
  );

  void submitAction() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      ResponseData<SchoolDataModel> result =
          await AuthApiHelper.sessionBySchoolId(
        schoolCode: schoolCodeController.text.trim(),
      );
      if (result.statusSuccess) {
        Get.toNamed(
          Routes.LOGIN,
          arguments: SchoolDataModel(orgCode: schoolCodeController.text.trim()),
        );
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBarHelper.errorShow("${result.errorMessage}"),
        );
      }
      isLoading.value = false;
    }
  }

  void onChangeLanguage() {
    var local = Get.locale;
    if (local != null) showLanguagePopup(local.languageCode);
  }

  void showLanguagePopup(String languageCode) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      context: Get.context!,
      builder: (c) {
        return PopUpForLanguageSelection(
          selectedLanguage: "$languageCode".obs,
          onSubmit: changeLanguage,
        );
      },
    );
  }

  void changeLanguage(String popupResult) async {
    var local = Get.locale;
    if (popupResult.isNotEmpty && local!.languageCode != popupResult) {
      Get.updateLocale(Locale(popupResult));
    }
    Get.back();
  }
}
