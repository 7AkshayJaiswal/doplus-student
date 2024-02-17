import 'package:flutter/material.dart';
import 'package:student/app/api/models/login_token_response.dart';
import 'package:student/app/global_widget/cards/card_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:student/app/modules/home/local_widget/dashboard_item_list.dart';
import 'package:student/app/modules/home/local_widget/dashboard_slider_list.dart';
import 'package:student/app/utils/singletons/storage.singleton.dart';

class HomeDetailsView extends GetView<HomeController> {
  const HomeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).viewPadding.top + 8,
            left: 8,
            bottom: 8,
            right: 8,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {
                      controller.slidingDrawerKey.open();
                    },
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.bell,
                          color: ColorHelper.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                child: CardHelper(
                  side: BorderSide.none,
                  padding: const EdgeInsets.all(12),
                  onPressed: controller.openProfileAction,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          'https://avatars.githubusercontent.com/u/44025097',
                          fit: BoxFit.fill,
                          height: 80.0,
                          width: 60.0,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.userDetails.value?.name ?? "N/A",
                              style: TextStyleHelper.bold14,
                              maxLines: 1,
                            ),
                            const SizedBox(height: 6),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${"guardian".tr}: ",
                                    style: TextStyleHelper.grey12,
                                  ),
                                  TextSpan(
                                    text: "N/A",
                                    style: TextStyleHelper.normal12,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${"Session".tr}: ",
                                    style: TextStyleHelper.grey12,
                                  ),
                                  TextSpan(
                                    text: controller.userDetails.value
                                            ?.academicSession?.name ??
                                        "N/A",
                                    style: TextStyleHelper.normal12,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 2),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "${"School".tr}: ",
                                    style: TextStyleHelper.grey12,
                                  ),
                                  TextSpan(
                                    text: controller.userDetails.value
                                            ?.organization?.name ??
                                        "N/A",
                                    style: TextStyleHelper.normal12,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: ColorHelper.grey,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Card(
            margin: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: [
                    const DashboardItemList(),
                    DashboardSliderList(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
