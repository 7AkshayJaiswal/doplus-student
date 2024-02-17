import 'package:flutter/material.dart';
import 'package:student/app/global_widget/static/background_card.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  final bool hideBackAction;

  const BackGround({
    super.key,
    required this.child,
    this.hideBackAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundCard(),
          child,
          if (hideBackAction == false)
            Padding(
              padding: const EdgeInsets.only(top: 40 + 10, left: 14),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 0.5, color: Colors.white),
                  minimumSize: const Size(0, 0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                ),
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.white,
                  size: 14,
                ),
                label: Text(
                  "back".tr,
                  style: TextStyleHelper.light10,
                ),
              ),
            )
        ],
      ),
    );
  }
}
