import 'package:flutter/material.dart';
import 'package:student/app/global_widget/static/background.dart';
import 'package:student/app/helper/asset_helper.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BackGround(
        hideBackAction: true,
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    opacity: controller.showLogo.value ? 1 : 0,
                    child: controller.showLogo.isFalse
                        ? null
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Text(
                                  "A Step Towards Education...",
                                  style: GoogleFonts.notoSansOldItalic(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                            ),
                          ],
                        ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    opacity: controller.showLogo.value ? 1 : 0,
                    child: controller.showLogo.isFalse
                        ? SizedBox(
                            width: Get.width * 0.8,
                            height: Get.height * 0.3,
                          )
                        : Hero(
                            tag: "LOGO",
                            child: Image.asset(
                              AssetHelper.doplusText,
                              width: Get.width * 0.9,
                              height: Get.height * 0.4,
                            ),
                          ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                    opacity: controller.showLogo.value ? 1 : 0,
                    child: controller.showLogo.isFalse
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                          )
                        : const Text(
                            "www.dopluserp.com",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white70,
                              decoration: TextDecoration.none,
                              letterSpacing: 4,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Center(
                child: Text(
                  "@ ALL RIGHT RESERVED DOPLUS TECHNOLOGIES P. LIMITED",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
