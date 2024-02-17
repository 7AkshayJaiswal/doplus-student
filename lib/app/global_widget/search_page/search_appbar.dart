import 'package:flutter/material.dart';
import 'package:student/app/helper/button_helper.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchAppBar extends StatelessWidget {
  final String titleText;
  final bool isSortByAZEnabled;

  // final TextEditingController searchController;
  final VoidCallback? filterAction;
  final VoidCallback? sortByAZAction;
  final VoidCallback? sortAction;
  final VoidCallback? cancelAction;
  final ValueChanged<String>? searchAction;

  const SearchAppBar({
    super.key,
    required this.titleText,
    this.filterAction,
    this.sortAction,
    this.cancelAction,
    this.searchAction,
    this.sortByAZAction,
    this.isSortByAZEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  ).marginOnly(left: 6, bottom: 4),
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
          menuDivider.paddingSymmetric(vertical: 6),
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  hintText: "searchHere...".tr,
                  onSubmitted: searchAction,
                  trailing: [
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      onPressed: cancelAction,
                      icon: Icon(
                        Icons.cancel_outlined,
                        color: ColorHelper.primary,
                        size: 16,
                      ),
                    ),
                  ],
                  hintStyle: MaterialStateProperty.resolveWith(
                    (s) => TextStyleHelper.grey12,
                  ),
                  padding: MaterialStateProperty.resolveWith(
                    (s) =>
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                  ),
                  constraints:
                      const BoxConstraints(minHeight: 40, maxHeight: 100),
                  shape: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.focused)) {
                        return RoundedRectangleBorder(
                          side: BorderSide(
                            width: 0.6,
                            color: ColorHelper.primary.withOpacity(0.6),
                          ),
                          borderRadius: RoundedHelper.borderRadius12,
                        );
                      }
                      return RoundedRectangleBorder(
                        side: BorderSide(
                          color: ColorHelper.primary.withOpacity(0.2),
                          width: 0.4,
                        ),
                        borderRadius: RoundedHelper.borderRadius12,
                      );
                    },
                  ),
                  elevation: MaterialStateProperty.resolveWith(
                    (s) => 0,
                  ),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return ColorHelper.primary;
                      }
                      return ColorHelper.white;
                    },
                  ),
                ),
              ),
              const SizedBox(width: 6),
              IconButton.filled(
                padding: EdgeInsets.zero,
                style: ButtonHelper.iconButtonModernStyle,
                onPressed: filterAction,
                icon: Icon(
                  FontAwesomeIcons.filter,
                  color: ColorHelper.primary,
                  size: 16,
                ),
              ),
              IconButton.filled(
                padding: EdgeInsets.zero,
                style: ButtonHelper.iconButtonModernStyle,
                onPressed: sortByAZAction,
                icon: isSortByAZEnabled
                    ? Icon(
                        FontAwesomeIcons.arrowDown19,
                        color: ColorHelper.primary,
                        size: 16,
                      )
                    : Icon(
                        Icons.sort_by_alpha_rounded,
                        color: ColorHelper.primary,
                        size: 16,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.4,
      );
}
