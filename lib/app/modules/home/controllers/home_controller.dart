import 'package:flutter/material.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/models/profile/profile_data_model.dart';
import 'package:student/app/api/profile_api_helper.dart';
import 'package:student/app/helper/snackbar_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final selectedPageIndex = 0.obs;
  final isLoading = true.obs;
  final userDetails = Rxn<ProfileDataModel?>();
  final slidingDrawerKey = GlobalKey<SlidingDrawerState>();
  final versionDetails = "".obs;

  @override
  void onInit() {
    super.onInit();
    hideLoading();
    getPackageName();
    onGetProfile();
  }

  void refetchDataFromStorage() => userDetails.value = Storage.profileData;

  void onGetProfile() async {
    refetchDataFromStorage();
    isLoading.value = true;
    ResponseData<ProfileDataModel> result = await ProfileApiHelper.getProfile;
    if (result.statusSuccess) {
      ProfileDataModel responseData = result.data!;
      await Storage.saveProfile(response: responseData);
      refetchDataFromStorage();
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBarHelper.errorShow("${result.errorMessage}"),
      );
    }
    isLoading.value = false;
  }

  void hideLoading() async {
    await Future.delayed(const Duration(seconds: 5));
    isLoading.value = false;
  }

  void openAssignmentPage() {
    Get.toNamed(Routes.ASSIGNMENT);
  }

  void openPaymentDetails() {
    Get.toNamed(Routes.PAYMENT_DETAILS);
  }

  void openCreateAssignment() {
    Get.toNamed(Routes.CREATE_ASSIGNMENT);
  }

  openProfileAction() {
    Get.toNamed(Routes.PROFILE);
  }

  void getPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    versionDetails.value = "App Version $version";
    debugPrint(
        "getPackageName: $appName, $packageName, $version, $buildNumber");
  }
}
