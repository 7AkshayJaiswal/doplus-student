import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/library/dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:student/app/modules/home/local_widget/dashboard_item_card.dart';

class DashboardItemList extends StatelessWidget {
  const DashboardItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(
          color: ColorHelper.primary.withOpacity(0.2),
          width: 0.4,
        ),
      ),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Feature".tr,
            style: TextStyleHelper.bold12,
          ),
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.deepOrangeAccent,
            ),
          ).marginOnly(bottom: 6),
          DynamicHeightGridView(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: listOfItemDashboard.length,
            builder: (c, i) {
              return listOfItemDashboard[i];
            },
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
          ),
        ],
      ),
    );
  }
}

List<DashboardItemCard> get listOfItemDashboard => [
      DashboardItemCard(
        text: "Class",
        iconData: const Icon(
          Icons.class_rounded,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Assignment",
        iconData: const Icon(
          Icons.assignment_outlined,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Leave",
        onClick: () {},
        iconData: const Icon(
          Icons.explore_off_outlined,
          size: 16,
        ),
      ),
      DashboardItemCard(
        text: "Gallery",
        iconData: const Icon(
          Icons.photo_library_rounded,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Fee",
        showUpcoming: true,
        iconData: const Icon(
          Icons.currency_rupee_rounded,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Transport",
        showUpcoming: true,
        iconData: const Icon(
          Icons.emoji_transportation_rounded,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Notes",
        showUpcoming: true,
        iconData: const Icon(
          Icons.note_add_rounded,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Schedule",
        showUpcoming: true,
        iconData: const Icon(
          Icons.date_range_rounded,
          size: 16,
        ),
        onClick: () {},
      ),
      DashboardItemCard(
        text: "Event",
        showUpcoming: true,
        iconData: const Icon(
          Icons.emoji_events,
          size: 16,
        ),
        onClick: () {},
      ),
    ];
