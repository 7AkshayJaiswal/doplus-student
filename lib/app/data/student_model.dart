import 'package:student/app/utils/easy_action/attendance_type_easy_option.dart';
import 'package:sticky_az_list/sticky_az_list.dart';

class StudentModel extends TaggedItem {
  final String name;
  final String profilePic;
  final String rollNumber;
  final AttendanceTypeEasyOption attendanceTypeEasyOption;

  StudentModel({
    required this.name,
    required this.profilePic,
    required this.rollNumber,
  }) : attendanceTypeEasyOption = AttendanceTypeEasyOption();

  @override
  String sortName() => name;

  @override
  String toString() => name;
}
