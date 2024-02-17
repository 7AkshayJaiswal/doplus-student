import 'package:flutter/material.dart';
import 'package:student/app/global_widget/search_page/search_appbar.dart';
import 'package:student/app/global_widget/static/background_card.dart';
import 'package:student/app/helper/button_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

class BackgroundSimple extends StatelessWidget {
  final String titleText;
  final Widget child;

  const BackgroundSimple({
    super.key,
    required this.titleText,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    return Stack(
      children: [
        const BackgroundCard(),
        Column(
          children: [
            SizedBox(height: topPadding),
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: ColorHelper.white,
                  borderRadius: RoundedHelper.borderRadius24,
                  border: Border.all(
                    color: ColorHelper.primary.withOpacity(0.2),
                    width: 0.4,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton.filled(
                          style: ButtonHelper.iconButtonModernStyle,
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: ColorHelper.primary,
                            size: 18,
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              titleText,
                              style: TextStyleHelper.primary16.copyWith(
                                decoration: TextDecoration.none,
                              ),
                            ).marginOnly(left: 6,bottom: 4),
                            Container(
                              height: 4,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox.square(dimension: 40)
                      ],
                    ),
                  ],
                ),
              ),
            ).paddingAll(16),
            Expanded(
              child: Container(
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                ),
                child: child,
              ),
            ),
          ],
        )
      ],
    );
  }
}
