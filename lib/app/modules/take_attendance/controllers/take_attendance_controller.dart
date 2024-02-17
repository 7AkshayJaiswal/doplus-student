import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:student/app/data/student_model.dart';
import 'package:student/app/helper/snackbar_helper.dart';
import 'package:get/get.dart';

class TakeAttendanceController extends GetxController {
  final userList = <StudentModel>[];
  final faker = Faker();
  final searchText = "".obs;
  final isLoading = false.obs;
  final isSortByAZEnabled = false.obs;

  List<StudentModel> get listData {
    if (searchText.isNotEmpty) {
      List<StudentModel> listReport = userList
          .where((StudentModel p) =>
      (p.name).toLowerCase().contains(searchText.value.toLowerCase()) ||
          (p.rollNumber)
              .toLowerCase()
              .contains(searchText.value.toLowerCase()))
          .toList();
      return listReport.toList();
    }
    return userList.toList();
  }

  String get showTextOfType =>
      allListData == null ? "Ready To Submit" : allListData!;

  String? get allListData {
    int presentCount = 0;
    int absentCount = 0;
    int leaveCount = 0;
    int pendingCount = 0;
    int totalCount = userList.length;
    for (StudentModel s in userList) {
      if (s.attendanceTypeEasyOption.isPresentSelected) {
        presentCount++;
      } else if (s.attendanceTypeEasyOption.isAbsentSelected) {
        absentCount++;
      } else if (s.attendanceTypeEasyOption.isLeaveSelected) {
        leaveCount++;
      } else if (s.attendanceTypeEasyOption.isNoneSelected) {
        pendingCount++;
      }
    }
    if (totalCount == presentCount + absentCount + leaveCount) return null;
    return "Present($presentCount) Absent($absentCount) Leave($leaveCount) | Remaining($pendingCount)";
  }

  @override
  void onInit() {
    super.onInit();
    userList.addAll(
      List.generate(
        10,
            (index) =>
            StudentModel(
              name: faker.person.firstName(),
              rollNumber: index.toString(),
              profilePic: faker.image.image(keywords: ['people']),
            ),
      ),
    );
  }

  void onSearchChange(String value) {
    searchText.value = value;
  }

  void onSearchCancel() {
    FocusManager.instance.primaryFocus?.unfocus();
    searchText.value = "";
  }

  void onPageSubmit() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 3));
    if (allListData == null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBarHelper.successShow("Attendance Submitted"),
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBarHelper.errorShow("Please fill remaining attendance"),
      );
    }
    isLoading.value = false;
  }

  void sortByAZActionChange() {
    isSortByAZEnabled.value = !isSortByAZEnabled.value;
  }
}
