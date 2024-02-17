import 'package:flutter/material.dart';
import 'package:student/app/global_widget/pick_image/picked_image_show_online.dart';
import 'package:student/app/global_widget/pick_pdf_show/picked_pdf_show_online.dart';
import 'package:student/app/global_widget/pick_video/picked_video_show_online.dart';
import 'package:student/app/global_widget/picked_audio_show_online.dart';
import 'package:student/app/global_widget/static/background_simple.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/library/gallery/galleryimage.dart';

import 'package:get/get.dart';

import '../controllers/assignment_details_controller.dart';

class AssignmentDetailsView extends GetView<AssignmentDetailsController> {
  const AssignmentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: BackgroundSimple(
        titleText: 'Assignment Details'.tr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Obx(
            () => ListView(
              padding: EdgeInsets.zero,
              children: [
                if (controller.imageList.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: RoundedHelper.roundComplete6,
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Images",
                                  style: TextStyleHelper.bold12,
                                ),
                                Container(
                                  height: 2,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorHelper.primary.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        menuDivider.marginOnly(bottom: 6),
                        // Wrap(
                        //   children: [
                        //     ...List.generate(
                        //       controller.imageList.length,
                        //       (i) => PickedImageShowOnline(
                        //         i: i,
                        //         details: controller.imageList[i],
                        //         dimension: 120,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        GalleryImage(
                          maxScale: 2,
                          minScale: 0.5,
                          closeWhenSwipeDown: true,
                          galleryBackgroundColor: Colors.grey.shade100,
                          showAppBar: false,
                          closeWhenSwipeUp: true,
                          imageUrls: controller.imageList,
                          numOfShowImages: controller.imageList.length > 3
                              ? 3
                              : controller.imageList.length,
                          titleGallery: "Images",
                        ),
                      ],
                    ),
                  ),
                if (controller.imageList.isNotEmpty) const SizedBox(height: 10),
                if (controller.videoList.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: RoundedHelper.roundComplete6,
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Video",
                                  style: TextStyleHelper.bold12,
                                ),
                                Container(
                                  height: 2,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorHelper.primary.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        menuDivider.marginOnly(bottom: 6),
                        Wrap(
                          children: [
                            ...List.generate(
                              controller.videoList.length,
                              (i) => PickedVideoShowOnline(
                                i: i,
                                details: controller.videoList[i],
                                dimension: 120,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (controller.videoList.isNotEmpty) const SizedBox(height: 10),
                if (controller.audioList.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: RoundedHelper.roundComplete6,
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Audio",
                                  style: TextStyleHelper.bold12,
                                ),
                                Container(
                                  height: 2,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorHelper.primary.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        menuDivider.marginOnly(bottom: 6),
                        ...List.generate(
                          controller.audioList.length,
                          (i) => PickedAudioShowOnline(
                            details: controller.audioList[i],
                          ).marginOnly(top: 6),
                        ),
                      ],
                    ),
                  ),
                if (controller.audioList.isNotEmpty) const SizedBox(height: 10),
                if (controller.pdfList.isNotEmpty)
                  Container(
                    width: double.infinity,
                    decoration: RoundedHelper.roundComplete6,
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "PDF",
                                  style: TextStyleHelper.bold12,
                                ),
                                Container(
                                  height: 2,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorHelper.primary.withOpacity(0.6),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        menuDivider.marginOnly(bottom: 6),
                        Wrap(
                          children: [
                            ...List.generate(
                              controller.pdfList.length,
                              (i) => PickedPdfShowOnline(
                                details: controller.pdfList[i],
                              ).marginOnly(top: 6),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.4,
      );
}
