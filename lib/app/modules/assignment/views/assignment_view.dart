import 'package:flutter/material.dart';
import 'package:student/app/global_widget/choice_chip/choice_filter.dart';
import 'package:student/app/global_widget/load_more_widget/load_more_widget.dart';
import 'package:student/app/global_widget/shimmer/assginment_shimmer.dart';
import 'package:student/app/global_widget/static/background_with_searchbar.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/modules/assignment/local_widget/assignment_card.dart';

import 'package:get/get.dart';

import '../controllers/assignment_controller.dart';

class AssignmentView extends GetView<AssignmentController> {
  const AssignmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWithSearchBar(
        titleText: 'assignmentList'.tr,
        filterAction: () {},
        sortAction: () {},
        searchAction: (s) {},
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "selectTypeFilter".tr,
                          style: TextStyleHelper.normal14,
                        ),
                        Text(
                          "${"total".tr}: ${controller.count}",
                          style: TextStyleHelper.grey12,
                        ),
                      ],
                    ),
                    ChoiceFilter(
                      choicesList: ["all".tr, "covered".tr, "rest".tr],
                      defaultChoiceTitle: controller.selectedFilter.value,
                      selectedChoice: controller.selectedFilterAction,
                    ),
                  ],
                ),
                menuDivider,
                Expanded(
                  child: controller.isLoading.isTrue
                      ? const AssignmentShimmer()
                      : RefreshIndicator(
                          onRefresh: controller.refreshData,
                          child: EasyLoadMore(
                            isFinished: controller.count >= 120,
                            onLoadMore: controller.loadMore,
                            runOnEmptyResult: false,
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              separatorBuilder: ((context, index) =>
                                  const SizedBox(height: 16.0)),
                              itemBuilder: (BuildContext context, int index) {
                                bool isOddValue = index.isOdd;
                                String filterValue =
                                    controller.selectedFilter.value;
                                String typeValue = "";
                                if (filterValue == "all".tr) {
                                  typeValue = isOddValue ? "covered".tr : "rest".tr;
                                } else {
                                  typeValue = filterValue;
                                }
                                return AssignmentCard(
                                  type: typeValue,
                                );
                              },
                              itemCount: controller.count,
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get menuDivider => Container(
        color: ColorHelper.grey.withOpacity(0.2),
        width: double.infinity,
        height: 0.4,
      );
}
