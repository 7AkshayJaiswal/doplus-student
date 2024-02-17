import 'package:flutter/material.dart';
import 'package:student/app/global_widget/cards/card_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

class AssignmentCard extends StatelessWidget {
  final String type;

  const AssignmentCard({
    super.key,
    required this.type,
  });

  bool get isDone => (type == "covered".tr);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: ColorHelper.white,
      type: MaterialType.card,
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor: ColorHelper.splash,
        onTap: () {},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Container(
                width: 16,
                height: 92,
                color: isDone ? ColorHelper.success : Colors.yellow,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Hindi",
                                style: TextStyleHelper.bold16,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "${"view".tr} >>",
                          style: TextStyleHelper.grey10.copyWith(
                            color: ColorHelper.primary,
                            fontSize: 9,
                            decoration: TextDecoration.underline,
                            decorationColor:
                                ColorHelper.primary.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 3),
                    menuDivider,
                    const SizedBox(height: 3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${"teacher".tr}: ",
                                      style: TextStyleHelper.grey12,
                                    ),
                                    TextSpan(
                                      text: "Mayank Shukla",
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
                                      text: "${"postedDate".tr}: ",
                                      style: TextStyleHelper.grey12,
                                    ),
                                    TextSpan(
                                      text: "May 12, 23",
                                      style: TextStyleHelper.normal12,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 2),
                              InkWell(
                                onTap: () {},
                                onLongPress: () {},
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 1, horizontal: 4),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(4)),
                                      border: Border.all(
                                        color: ColorHelper.success
                                            .withOpacity(0.4),
                                        width: 0.8,
                                      )),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.download,
                                        color: ColorHelper.success
                                            .withOpacity(0.6),
                                        size: 12,
                                      ).marginOnly(right: 4, top: 2),
                                      Text(
                                        "downloadFile".tr,
                                        style: TextStyleHelper.grey10.copyWith(
                                          color: ColorHelper.success,
                                          fontSize: 11,
                                          decoration: TextDecoration.underline,
                                          decorationColor: ColorHelper.success
                                              .withOpacity(0.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${"totalUnit".tr}: ",
                                      style: TextStyleHelper.grey12,
                                    ),
                                    TextSpan(
                                      text: "98",
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
                                      text: "${"coveredUnit".tr}: ",
                                      style: TextStyleHelper.grey12,
                                    ),
                                    TextSpan(
                                      text: "80",
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
                                      text: "${"restUnit".tr}: ",
                                      style: TextStyleHelper.grey12,
                                    ),
                                    TextSpan(
                                      text: "18",
                                      style: TextStyleHelper.normal12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.2,
      );
}
