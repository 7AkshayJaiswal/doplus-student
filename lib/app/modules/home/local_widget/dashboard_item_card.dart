import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class DashboardItemCard extends StatelessWidget {
  final Icon iconData;
  final String text;
  final VoidCallback onClick;
  final bool showUpcoming;

  const DashboardItemCard({
    super.key,
    required this.text,
    required this.iconData,
    required this.onClick,
    this.showUpcoming = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        showWidget(),
        if (showUpcoming)
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: const EdgeInsets.only(right: 2,left: 2),
              decoration: BoxDecoration(
                color: ColorHelper.primary,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                border: Border.all(
                  color: ColorHelper.primary,
                  width: 0.4,
                ),
              ),
              child: Text(
                "Upcoming".tr,
                style: TextStyleHelper.lightText(6),
              ),
            ),
          ),
      ],
    );
  }

  Widget showWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      width: double.infinity,
      child: Material(
        color: Colors.white,
        type: MaterialType.card,
        elevation: 0.15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: BorderSide(
            color: ColorHelper.primary.withOpacity(0.4),
            width: 0.4,
          ),
        ),
        child: InkWell(
          onTap: () => onClick(),
          borderRadius: BorderRadius.circular(6),
          splashColor: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: ColorHelper.primary.withOpacity(0.05),
                  radius: 18,
                  child: ColorHelper.colorIcon(
                    child: iconData,
                  ),
                ).marginOnly(bottom: 4),
                Text(
                  text,
                  style: TextStyleHelper.bold10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
