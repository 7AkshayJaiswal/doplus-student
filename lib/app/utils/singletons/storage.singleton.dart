import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/api/models/profile/profile_data_model.dart';
import 'package:student/app/data/aupload_file.dart';
import 'package:student/app/data/enums/roles_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Storage._internal();

  static final Storage _instance = Storage._internal();

  static Storage get instance => _instance;

  static late final SharedPreferences prefs;

  static Future<SharedPreferences> init() async =>
      prefs = await SharedPreferences.getInstance();

  static Future<bool> setBool(String key, bool value) =>
      prefs.setBool(key, value);

  static bool? getBool(String key) => prefs.getBool(key);

  static Future<bool> setString(String key, String value) =>
      prefs.setString(key, value);

  static String? getString(String key) => prefs.getString(key);

  static Future<bool> setStringList(String key, List<String> value) =>
      prefs.setStringList(key, value);

  static List<String>? getStringList(String key) => prefs.getStringList(key);

  static Future<void> clearLogin() async {
    await setBool("isLoggedIn", false);
  }

  static Future<void> clearRememberValue() async {
    await setBool("rememberValue", false);
  }

  static Future<void> saveLogin({
    required String email,
    required String pass,
  }) async {
    await setString("rememberEmail", email);
    await setString("rememberPass", pass);
    await setBool("rememberValue", true);
    await setBool("isLoggedIn", true);
  }

  static Future<void> saveData({
    required LoginDataModel response,
  }) async {
    await setString(
        "accessToken", response.apiToken?.original?.accessToken ?? "");
    await setString("loginData", json.encode(response.toJson()));
  }

  static LoginDataModel get loginData =>
      LoginDataModel.fromJson(json.decode(getString("loginData") ?? ""));

  static Future<void> saveProfile({
    required ProfileDataModel response,
  }) async {
    debugPrint("profileData::: ${response.toJson()}");
    await setString("profileData", json.encode(response.toJson()));
  }

  static ProfileDataModel? get profileData =>
      (getString("profileData") ?? "").isEmpty ? null : ProfileDataModel.fromJson(json.decode(getString("profileData") ?? ""));

  static String get currentUserPrimaryId => loginData.id!.toString();

  static String get accessToken => getString("accessToken") ?? "";

  static String get rememberEmail => getString("rememberEmail") ?? "";

  static String get rememberPass => getString("rememberPass") ?? "";

  static bool get rememberValue => getBool("rememberValue") ?? false;

  static bool get isLoggedIn => getBool("isLoggedIn") ?? false;

  static Future<void> setUploadedFileList(
      List<UploadedFileDetails> list) async {
    List<String> upList = [];
    for (UploadedFileDetails e in list) {
      String data = jsonEncode(e.toJson());
      upList.add(data);
    }
    debugPrint("upList:: ${upList.join(";")}");
    await setString("UploadedFileList", upList.join(";"));
  }

  static List<UploadedFileDetails> get getUploadedFileList {
    List<UploadedFileDetails> list = [];
    List<String> localList = (getString("UploadedFileList") ?? "").split(";");
    for (String e in localList) {
      list.add(UploadedFileDetails.fromJson(jsonDecode(e)));
      debugPrint("upList::.. $e");
    }
    return list;
  }
}
