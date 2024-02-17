import 'package:flutter/material.dart';
import 'package:student/app/global_widget/buttons/primary_button.dart';
import 'package:student/app/global_widget/cards/card_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PopUpForLanguageSelection extends StatelessWidget {
  final RxString selectedLanguage;
  final Function onSubmit;

  const PopUpForLanguageSelection({
    required this.selectedLanguage,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return _buildChild(context);
  }

  Widget textUnderline(Widget child) => Container(
        padding: const EdgeInsets.only(bottom: 1),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: ColorHelper.primary,
          width: 1,
        ))),
        child: child,
      );

  Widget itemViewForInvoiceType(
    context,
    String text,
    bool isSelected,
    Function()? onPressed,
  ) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: CardHelper(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          side: isSelected
              ? BorderSide(
                  width: 0.6,
                  color: ColorHelper.primary.withOpacity(0.8),
                )
              : BorderSide(
                  width: 0.4,
                  color: ColorHelper.grey.withOpacity(0.6),
                ),
          onPressed: onPressed,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  child: isSelected
                      ? Icon(
                          FontAwesomeIcons.solidCircleCheck,
                          color: ColorHelper.primary.withOpacity(0.8),
                          size: 20,
                        )
                      : Icon(
                          FontAwesomeIcons.circleCheck,
                          color: ColorHelper.grey.withOpacity(0.4),
                          size: 20,
                        ),
                ).paddingOnly(right: 6),
                Text(
                  text,
                  style: TextStyleHelper.normal14,
                ),
              ],
            ),
          ),
        ),
      );

  _buildChild(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: ColorHelper.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "selectLanguage".tr,
                              style: Theme.of(context).textTheme.caption,
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
                      const SizedBox(height: 12),
                      itemViewForInvoiceType(
                        context,
                        "English",
                        selectedLanguage.value == "en",
                        () => selectedLanguage.value = "en",
                      ),
                      itemViewForInvoiceType(
                        context,
                        "हिन्दी",
                        selectedLanguage.value == "hi",
                        () => selectedLanguage.value = "hi",
                      ),
                      itemViewForInvoiceType(
                        context,
                        "తెలుగు",
                        selectedLanguage.value == "te",
                        () => selectedLanguage.value = "te",
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  PrimaryButton(
                    isLoading: false,
                    onPressed: () => onSubmit(selectedLanguage.value),
                    text: "changeLanguage".tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
