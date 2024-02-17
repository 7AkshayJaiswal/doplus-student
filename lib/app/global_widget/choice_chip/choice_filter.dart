import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

class ChoiceFilter extends StatelessWidget {
  final String defaultChoiceTitle;
  final List<String> choicesList;
  final Function(String selectedChoice) selectedChoice;

  const ChoiceFilter({
    super.key,
    required this.defaultChoiceTitle,
    required this.choicesList,
    required this.selectedChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List<Widget>.generate(
        choicesList.length,
        (int index) {
          String localChoiceTitle = choicesList[index];
          bool selected = defaultChoiceTitle == localChoiceTitle;
          return ChoiceChip(
            checkmarkColor: ColorHelper.success,
            pressElevation: 0.0,
            shape: RoundedHelper.roundComplete,
            side: selected
                ? BorderSide(
                    color: ColorHelper.success.withOpacity(0.4),
                    width: 0.8,
                  )
                : BorderSide(
                    color: ColorHelper.grey.withOpacity(0.2),
                    width: 0.4,
                  ),
            selectedColor: ColorHelper.white,
            backgroundColor: ColorHelper.grey.withOpacity(0.02),
            label: Text(
              localChoiceTitle,
              style: selected
                  ? TextStyleHelper.normal14.copyWith(
                      color: ColorHelper.success,
                      fontWeight: FontWeight.w500,
                    )
                  : TextStyleHelper.normal14,
            ),
            selected: defaultChoiceTitle == localChoiceTitle,
            onSelected: (bool selected) {
              if (selected) {
                selectedChoice(localChoiceTitle);
              }
            },
          ).marginOnly(right: 8);
        },
      ).toList(),
    );
  }
}
