import 'dart:convert';

import 'package:student/app/api/api_component/api_client.dart';
import 'package:student/app/api/api_component/api_constant.dart';
import 'package:student/app/api/api_component/response_handler.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/api/models/session_by_school_code.dart';
import 'package:student/app/data/enums/roles_enum.dart';
import 'package:student/app/utils/constant/app_config_constant.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:http/http.dart' as http;

class AuthApiHelper {
  static Future<ResponseData<SchoolDataModel>> sessionBySchoolId({
    required String schoolCode,
  }) async {
    String url = ApiConstant.sessionBySchoolCode(schoolCode: schoolCode);
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
          data: SchoolDataModel.fromJson(jsonData),
        );
    } else {
      return ResponseData(
        statusSuccess: false,
        statusCode: response.statusCode,
        errorMessage: "Invalid School Code",
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
        'org_code': orgCode,
        'email': username,
        'password': password,
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
        await APIClient.getRequest(Uri.parse(url));
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
