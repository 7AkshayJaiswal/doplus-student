import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class SelectRoleCard extends StatelessWidget {
  final String defaultChoiceTitle;
  final List<String> choicesList;
  final Function(String selectedChoice) selectedChoice;

  const SelectRoleCard({
    super.key,
    required this.defaultChoiceTitle,
    required this.choicesList,
    required this.selectedChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List<Widget>.generate(
        choicesList.length,
        (int index) {
          String localChoiceTitle = choicesList[index];
          bool selected = defaultChoiceTitle == localChoiceTitle;
          return ChoiceChip(
            checkmarkColor: Colors.white,
            pressElevation: 0.0,
            selectedColor: ColorHelper.primary,
            backgroundColor: ColorHelper.grey.withOpacity(0.2),
            label: Text(
              localChoiceTitle,
              style:
                  selected ? TextStyleHelper.light14 : TextStyleHelper.normal14,
            ),
            selected: defaultChoiceTitle == localChoiceTitle,
            onSelected: (bool selected) {
              if (selected) {
                selectedChoice(localChoiceTitle);
              }
            },
          );
        },
      ).toList(),
    );
  }
}
