import 'package:flutter/material.dart';
import 'package:student/app/helper/rounded_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';

class InformationDetailsItemCard extends StatelessWidget {
  final String title;
  final String des;

  const InformationDetailsItemCard({
    super.key,
    required this.title,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: RoundedHelper.roundComplete6Grey,
      padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
      margin: const EdgeInsets.only(bottom: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyleHelper.grey10,
          ),
          Text(
            des,
            style: TextStyleHelper.normal14,
          ),
        ],
      ),
    );
  }
}
