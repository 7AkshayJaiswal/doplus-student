import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/pick_image/pick_image_direct.dart';
import 'package:student/app/global_widget/pick_image/picked_image_show.dart';
import 'package:student/app/global_widget/pick_pdf_show/picked_pdf_show.dart';
import 'package:student/app/global_widget/pick_video/pick_pdf_direct.dart';
import 'package:student/app/global_widget/pick_video/picked_video_show.dart';
import 'package:student/app/global_widget/custom_recorder.dart';
import 'package:student/app/global_widget/static/background_simple.dart';
import 'package:student/app/helper/button_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

import 'package:get/get.dart';

import '../../../global_widget/picked_audio_show.dart';
import '../controllers/create_assignment_controller.dart';

class CreateAssignmentView extends GetView<CreateAssignmentController> {
  const CreateAssignmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: PrimaryButton(
            onPressed: controller.onSubmit,
            text: 'submit'.tr,
            isLoading: controller.allUploading.value,
          ),
        ),
      ),
      body: BackgroundSimple(
        titleText: 'Create Assignment'.tr,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Obx(
            () => ListView(
              padding: EdgeInsets.zero,
              children: [
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
                                "Choose Images",
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
                          IconButton.filled(
                            style: ButtonHelper.iconButtonModernStyle,
                            onPressed: controller.openPdfAction,
                            icon: Text(
                              "Convert as PDF",
                              style: TextStyleHelper.primary12,
                            ),
                          )
                        ],
                      ),
                      menuDivider.marginOnly(bottom: 6),
                      Wrap(
                        children: [
                          PickImageAction(
                            pickImageAction: controller.pickImageActionByChoice,
                          ),
                          ...List.generate(
                            controller.fileImages.length,
                            (i) => PickedImageShow(
                              i: i,
                              file: controller.fileImages[i],
                              actionExpand: controller.actionExpand,
                              actionRemove: controller.actionRemove,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                                "Choose Video",
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
                          PickImageAction(
                            pickImageAction: controller.pickActionByChoiceVideo,
                            typeOfActionImage: false,
                          ),
                          ...List.generate(
                            controller.fileVideo.length,
                            (i) => PickedVideoShow(
                              i: i,
                              videoImageFile: controller.fileVideo[i],
                              actionExpand: controller.actionVideoExpand,
                              actionRemove: controller.actionVideoRemove,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                                "Record",
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
                      CustomRecorder(
                        onRecordDone: controller.onRecordDone,
                      ),
                      ...List.generate(
                        controller.recordings.length,
                        (i) => PickedAudioShow(
                          i: i,
                          recording: controller.recordings[i],
                          actionRemove: controller.actionAudioRemove,
                        ).marginOnly(top: 6),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                          PickPdfAction(
                            pickPdfAction: controller.pickPdfAction,
                          ),
                          ...List.generate(
                            controller.filePdfList.length,
                            (i) => PickedPdfShow(
                              i: i,
                              pdfFile: controller.filePdfList[i],
                              actionRemove: controller.actionPdfRemove,
                              actionExpand: controller.actionPdfExpand,
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
