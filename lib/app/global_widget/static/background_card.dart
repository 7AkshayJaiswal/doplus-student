import 'package:flutter/material.dart';
import 'package:student/app/helper/asset_helper.dart';
import 'package:get/get.dart';
import 'package:student/app/helper/color_helper.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: ColorHelper.iconGradient,
          ),
          height: Get.height,
          width: Get.width,
          // child: Image.asset(
          //   "assets/dopluserpback.png",
          //   fit: BoxFit.fill,
          // ),
        ),
        Positioned(
          top: -(Get.height * 0.45),
          left: -(Get.height * 0.2),
          child: Image.asset(
            AssetHelper.backOverlay,
            height: Get.height * 1.5,
            width: Get.width * 1.5,
          ),
        )
      ],
    );
  }
}
