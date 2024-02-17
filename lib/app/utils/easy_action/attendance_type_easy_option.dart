import 'package:flutter/material.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:get/get.dart';

const String isPresent = "Present";
const String isAbsent = "Absent";
const String isLeave = "Leave";
const String isNone = "";

class AttendanceTypeEasyOption {
  final selectedAttendance = "".obs;

  bool get hasSelected => selectedAttendance.isNotEmpty;
  bool get isPresentSelected => selectedAttendance.value == isPresent;
  bool get isAbsentSelected => selectedAttendance.value == isAbsent;
  bool get isLeaveSelected => selectedAttendance.value == isLeave;
  bool get isNoneSelected => selectedAttendance.value == isNone;

  Widget showWidget() {
    return Obx(
      () => Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          isPresent,
          isAbsent,
          isLeave,
        ]
            .map(
              (t) => InkWell(
                onTap: () => selectedAttendance.value = t,
                child: Container(
                  decoration: RoundedHelper.roundComplete6Grey,
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(4),
                  child: Column(
                    children: [
                      Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: const VisualDensity(
                          horizontal: VisualDensity.minimumDensity,
                          vertical: VisualDensity.minimumDensity,
                        ),
                        groupValue: selectedAttendance.value,
                        value: t,
                        onChanged: (v) => selectedAttendance.value = v ?? "",
                        activeColor: basedOnType(t),
                      ),
                      Text(
                        t,
                        style: TextStyleHelper.greyText(8),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Color basedOnType(String type) {
    if (isPresent == type) {
      return ColorHelper.success;
    } else if (isAbsent == type) {
      return ColorHelper.error;
    } else if (isLeave == type) {
      return ColorHelper.warning;
    }
    return ColorHelper.grey;
  }
}
