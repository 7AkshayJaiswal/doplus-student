import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/square_card_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

class PickImageBottomSheet extends StatelessWidget {
  final Function(bool isCamera)? pickImageAction;
  final bool typeOfActionImage;

  const PickImageBottomSheet({
    super.key,
    this.pickImageAction,
    this.typeOfActionImage = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelper.white,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Choose Action".tr,
                      style: TextStyleHelper.grey12,
                    ),
                    const SizedBox(height: 6),
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
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SquareCardHelper(
                    borderColor: ColorHelper.primary.withOpacity(0.2),
                    dimension: 100,
                    onPressed: () {
                      pickImageAction!(true);
                    },
                    child: Icon(
                      typeOfActionImage
                          ? Icons.camera_alt_rounded
                          : Icons.video_camera_back_rounded,
                      color: ColorHelper.primary.withOpacity(0.6),
                      size: 36,
                    ),
                  ),
                  SquareCardHelper(
                    borderColor: ColorHelper.primary.withOpacity(0.2),
                    dimension: 100,
                    onPressed: () {
                      pickImageAction!(false);
                    },
                    child: Icon(
                      typeOfActionImage
                          ? Icons.photo_library_rounded
                          : Icons.video_collection_rounded,
                      color: ColorHelper.primary.withOpacity(0.6),
                      size: 36,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
