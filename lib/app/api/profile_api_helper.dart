import 'dart:convert';

import 'package:student/app/api/api_component/api_client.dart';
import 'package:student/app/api/api_component/api_constant.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/api/models/profile/profile_data_model.dart';
import 'package:student/app/api/models/session_by_school_code.dart';
import 'package:student/app/data/enums/roles_enum.dart';
import 'package:student/app/utils/constant/app_config_constant.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:http/http.dart' as http;

class ProfileApiHelper {
  static Future<ResponseData<ProfileDataModel>> get getProfile async {
    String url = ApiConstant.profile(
      id: Storage.currentUserPrimaryId,
      type: AppConstant.currentRole,
    );
    http.Response response = await APIClient.getRequest(Uri.parse(url));
    if (response.statusCode == 500) {
      return ResponseData(
        statusSuccess: false,
        statusCode: response.statusCode,
        errorMessage: "Internal server error",
      );
    }
    dynamic jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      return ResponseData(
        statusSuccess: true,
        statusCode: response.statusCode,
        data: ProfileDataModel.fromJson(jsonData["data"][0]),
      );
    } else {
      return ResponseData(
        statusSuccess: false,
        statusCode: response.statusCode,
        errorMessage: "Invalid Profile",
      );
    }
  }

  static Future<ResponseData<LoginDataModel>> login({
    required String username,
    required String password,
    required String orgCode,
    required String token,
  }) async {
    String url = ApiConstant.login;
    http.Response response = await APIClient.postRequest(
      Uri.parse(url),
      body: {
        'type': AppConstant.currentRole,
        'org_code': "INS10",
        'email': "ins1",
        'password': "9971436263",
        'token': token,
      },
    );
    if (response.statusCode == 500) {
      return ResponseData(
        statusSuccess: false,
        statusCode: response.statusCode,
        errorMessage: "Internal server error",
      );
    }
    dynamic jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      return ResponseData<LoginDataModel>(
        statusSuccess: true,
        statusCode: response.statusCode,
        data: LoginDataModel.fromJson(jsonData["data"]),
      );
    } else {
      return ResponseData(
        statusSuccess: false,
        statusCode: response.statusCode,
        errorMessage: jsonData["error"],
      );
    }
  }

  static Future<ResponseData<bool>> changePassword({
    required String newPassword,
    required String oldPassword,
  }) async {
    String url = ApiConstant.changePassword(
      newPass: newPassword,
      oldPass: oldPassword,
      schoolID: "1",
      studentID: "350509",
    );
    http.Response response =
        await APIClient.getRequest(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${Storage.accessToken}',
    });
    if (response.statusCode == 500) {
      return ResponseData(
        statusSuccess: false,
        statusCode: response.statusCode,
        errorMessage: "Internal server error",
      );
    }
    return ResponseData<bool>(
      statusSuccess: false,
      statusCode: response.statusCode,
      errorMessage: "Internal server error",
    );
  }
}
