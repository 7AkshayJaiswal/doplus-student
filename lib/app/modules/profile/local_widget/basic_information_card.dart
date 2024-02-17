import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/app/api/models/profile/profile_data_model.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/modules/profile/local_widget/information_details_item_card.dart';

class BasicInformationCard extends StatelessWidget {
  final ProfileDataModel? userDetails;

  const BasicInformationCard({
    super.key,
    this.userDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        ExpansionTileBorderItem(
          title: Text(
            "basicInformation".tr,
            style: TextStyleHelper.grey14,
          ),
          expendedBorderColor: ColorHelper.primary.withOpacity(0.25),
          children: [
            InformationDetailsItemCard(
              title: "Student ID",
              des: userDetails?.enrollmentId ?? "N/A",
            ),
            InformationDetailsItemCard(
              title: "Email",
              des: (userDetails?.email ?? "").isEmpty ? "N/A" : (userDetails?.email ?? ""),
            ),
            InformationDetailsItemCard(
              title: "Mobile",
              des: userDetails?.mobile ?? "N/A",
            ),
            InformationDetailsItemCard(
              title: "Session",
              des: userDetails?.academicSessionId.toString() ?? "N/A",
            ),
            InformationDetailsItemCard(
              title: "Session",
              des: userDetails?.academicSession?.name ?? "N/A",
            ),
            const InformationDetailsItemCard(
              title: "House",
              des: "N/A",
            ),
          ],
        ),
        const SizedBox(height: 12),
        ExpansionTileBorderItem(
          title: Text(
            "Advance Information".tr,
            style: TextStyleHelper.grey14,
          ),
          expendedBorderColor: ColorHelper.primary.withOpacity(0.25),
          children: [
            InformationDetailsItemCard(
              title: "DOB",
              des: userDetails?.enrollmentId ?? "N/A",
            ),
            const InformationDetailsItemCard(
              title: "DOA",
              des: "N/A",
            ),
            InformationDetailsItemCard(
              title: "Address",
              des: userDetails?.defaultAddress ?? "N/A",
            ),
            const InformationDetailsItemCard(
              title: "Father Name",
              des: "N/A",
            ),
            const InformationDetailsItemCard(
              title: "Mother name",
              des: "N/A",
            ),
            const InformationDetailsItemCard(
              title: "Father contact no",
              des: "N/A",
            ),
            const InformationDetailsItemCard(
              title: "Mother contact no",
              des: "N/A",
            ),
          ],
        ),
      ],
    );
  }
}
