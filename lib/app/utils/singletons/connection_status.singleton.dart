import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ConnectionStatusSingleton {
  ConnectionStatusSingleton._internal();

  static final ConnectionStatusSingleton _instance =
      ConnectionStatusSingleton._internal();

  static ConnectionStatusSingleton get instance => _instance;

  bool hasConnection = false;
  bool isInitial = true;

  Connectivity connectivity = Connectivity();

  StreamController controller = StreamController.broadcast();

  Stream get myStream => controller.stream;

  bool isDialogOpen = false;

  void showOfflinePopup() async {
    if (!hasConnection && !isDialogOpen) {
      isDialogOpen = true;
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
          onWillPop: () async => false,
          child: ShowOfflinePopup(),
        ),
      ).then((value) => isDialogOpen = false);
    } else {
      if (isDialogOpen && hasConnection) {
        isDialogOpen = false;
        Navigator.pop(Get.context!);
      }
    }
  }

  void initialize() async {
    ConnectivityResult result = await connectivity.checkConnectivity();
    _checkStatus(result);
    controller.sink.add(hasConnection);
    connectivity.onConnectivityChanged.listen((result) {
      _checkStatus(result);
    });
  }

  Future<bool> getConnectionStatus() async {
    return _checkStatus(await connectivity.checkConnectivity());
  }

  Future<bool> _checkStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      hasConnection = false;
      controller.sink.add(hasConnection);
      showOfflinePopup();
      return hasConnection;
    }

    bool previousConnection = hasConnection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else
        hasConnection = false;
    } on SocketException catch (_) {
      hasConnection = false;
    }
    if (previousConnection != hasConnection || isInitial) {
      isInitial = false;
      controller.sink.add(hasConnection);
      showOfflinePopup();
    }
    return hasConnection;
  }

  void disposeStream() => controller.close();
}

class ShowOfflinePopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Lottie.asset(AssetHelper.noConnection, height: Get.height * 0.4),
              Text(
                'noInternet'.tr,
                style: TextStyleHelper.boldText(24).copyWith(
                  letterSpacing: 2,
                ),
              ).marginOnly(top: 24, bottom: 12),
              Text(
                'noInternetDes'.tr,
                style: TextStyleHelper.grey14,
                textAlign: TextAlign.center,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 0.5,
                    color: ColorHelper.primary.withOpacity(0.4),
                  ),
                ),
                onPressed: () {
                  AppSettings.openAppSettings(type: AppSettingsType.wifi);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.settings_outlined,
                      size: 16,
                      color: ColorHelper.primary,
                    ).marginOnly(right: 6),
                    Text(
                      "openSetting".tr,
                      style: TextStyleHelper.primary14,
                    ),
                  ],
                ),
              ).marginOnly(top: 24),
            ],
          ),
        ),
      ),
    );
  }
}
