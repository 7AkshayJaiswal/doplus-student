import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:student/app/utils/services/loacal_notification_service.dart';
import 'package:student/app/utils/singletons/connection_status.singleton.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController {
  final showLogo = false.obs;
  final connectionStatus = ConnectionStatusSingleton.instance;

  @override
  void onInit() {
    super.onInit();
    connectionStatus.initialize();
    connectionStatus.myStream.listen((event) {
      startLogoAnimation();
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        LocalNotificationService.display(message);
      }
    });
    FirebaseMessaging.onMessage.listen((message) {
      LocalNotificationService.display(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      LocalNotificationService.display(message);
    });
    requestPermissions();

  }

  Future<void> requestPermissions() async {
    var status = await Permission.notification.request();
    if (status.isGranted) {
      // Notification permissions granted
    } else if (status.isDenied) {
      // Notification permissions denied
    } else if (status.isPermanentlyDenied) {
      await openAppSettings();
    }
  }

  void startLogoAnimation() async {
    await Future.delayed(const Duration(seconds: 1));
    showLogo.value = true;

    await Future.delayed(const Duration(seconds: 2));
    if (connectionStatus.hasConnection) {
      if (Storage.isLoggedIn) {
        Get.offNamed(Routes.HOME);
      }else {
        Get.offNamed(Routes.PRE_LOGIN);
      }
    }
  }
}
