import 'package:flutter/material.dart';
import 'package:student/app/data/student_model.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class TakeAttendanceCard extends StatelessWidget {
  final StudentModel model;

  const TakeAttendanceCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: RoundedHelper.roundComplete6Grey,
      margin: const EdgeInsets.only(top: 3, bottom: 3, left: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 2
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(model.profilePic),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name,
                  style: TextStyleHelper.normal14,
                ),
                Text(
                  "10${model.rollNumber}",
                  style: TextStyleHelper.grey12,
                ),
              ],
            ),
          ),
          Column(
            children: [
              model.attendanceTypeEasyOption.showWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
