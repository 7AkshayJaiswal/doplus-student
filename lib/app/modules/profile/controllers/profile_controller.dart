import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/api/models/profile/profile_data_model.dart';
import 'package:student/app/api/profile_api_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/snackbar_helper.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';

class ProfileController extends GetxController {
  final isLoading = false.obs;

  final userProfileImageFile = Rxn<File>();
  final userDetails = Rxn<ProfileDataModel?>();
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) _cropImage(pickedFile.path);
  }

  @override
  void onInit() {
    super.onInit();
    onGetProfile();
  }

  Future<void> _cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      compressFormat: ImageCompressFormat.jpg,
      compressQuality: 80,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Profile Pic',
          toolbarColor: ColorHelper.primary,
          toolbarWidgetColor: ColorHelper.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Profile Pic',
        ),
        WebUiSettings(
          context: Get.context!,
          presentStyle: CropperPresentStyle.dialog,
          boundary: const CroppieBoundary(
            width: 520,
            height: 520,
          ),
          viewPort:
              const CroppieViewPort(width: 480, height: 480, type: 'circle'),
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
      ],
    );
    if (croppedFile != null) {
      userProfileImageFile.value = File(croppedFile.path);
    }
  }

  openChangePasswordPage() {
    Get.toNamed(Routes.CHANGE_PASSWORD);
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
}
