import 'package:flutter/material.dart';
import 'package:student/app/routes/app_pages.dart';
import 'package:student/app/utils/constant/app_config_constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<ActionDetails> get getActionsByRoles {
  if (AppConstant.isAdmin) {
    return [
      Action.profile,
      Action.studentAttendance,
      Action.facultyAttendance,
      Action.holidayOrNews,
      Action.feesCollection,
      Action.leave,
      Action.facultyLeave,
      Action.feedback,
    ];
  } else if (AppConstant.isTeacher) {
    return [
      Action.profile,
      Action.studentAttendance,
      Action.attendance,
      Action.holidayOrNews,
      Action.leave,
      Action.feedback,
    ];
  } else {
    return [
      Action.profile,
      Action.attendance,
      Action.assignment,
      Action.fees,
      Action.holidayOrNews,
      Action.feedback,
      Action.leave,
    ];
  }
}

class Action {
  static ActionDetails get profile => ActionDetails(
        actionTitle: "profile",
        actionIcon: FontAwesomeIcons.user,
        actionRoute: Routes.PROFILE,
      );

  static ActionDetails get attendance => ActionDetails(
        actionTitle: "attendance",
        actionIcon: Icons.group_rounded,
        actionRoute: "",
      );

  static ActionDetails get fees => ActionDetails(
        actionTitle: "fees",
        actionIcon: FontAwesomeIcons.rupeeSign,
        actionRoute: "",
      );

  static ActionDetails get holidayOrNews => ActionDetails(
        actionTitle: "holidayAndNews",
        actionIcon: FontAwesomeIcons.newspaper,
        actionRoute: "",
      );

  static ActionDetails get feedback => ActionDetails(
        actionTitle: "feedback",
        actionIcon: Icons.support,
        actionRoute: "",
      );

  static ActionDetails get studentAttendance => ActionDetails(
        actionTitle: "studentAttendance",
        actionIcon: Icons.calendar_month_rounded,
        actionRoute: "",
      );

  static ActionDetails get leave => ActionDetails(
        actionTitle: "leave",
        actionIcon: Icons.calendar_month_rounded,
        actionRoute: "",
      );

  static ActionDetails get facultyAttendance => ActionDetails(
        actionTitle: "facultyAttendance",
        actionIcon: Icons.calendar_month_rounded,
        actionRoute: "",
      );

  static ActionDetails get feesCollection => ActionDetails(
        actionTitle: "feesCollection",
        actionIcon: FontAwesomeIcons.rupeeSign,
        actionRoute: "",
      );

  static ActionDetails get facultyLeave => ActionDetails(
        actionTitle: "facultyLeave",
        actionIcon: Icons.calendar_month_rounded,
        actionRoute: "",
      );

  static ActionDetails get assignment => ActionDetails(
        actionTitle: "assignment",
        actionIcon: Icons.assignment,
        actionRoute: Routes.ASSIGNMENT,
      );
}

class ActionDetails {
  final String actionTitle;
  final IconData actionIcon;
  final String actionRoute;

  ActionDetails({
    required this.actionTitle,
    required this.actionIcon,
    required this.actionRoute,
  });
}
