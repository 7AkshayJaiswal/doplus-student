import 'package:flutter/material.dart';
import 'package:student/app/data/student_model.dart';
import 'package:student/app/global_widget/buttons/swiped_primary_button.dart';
import 'package:student/app/global_widget/search_page/search_appbar.dart';
import 'package:student/app/global_widget/static/background_card.dart';
import 'package:student/app/helper/text_style_helper.dart';
import 'package:student/app/modules/take_attendance/local_widget/take_attendance_card.dart';

import 'package:get/get.dart';
import 'package:sticky_az_list/sticky_az_list.dart';

import '../controllers/take_attendance_controller.dart';

class TakeAttendanceView extends GetView<TakeAttendanceController> {
  const TakeAttendanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SwipedPrimaryButton(
                isLoading: controller.isLoading.value,
                onPressed: controller.onPageSubmit,
                text: "Submit",
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Text(
                    controller.showTextOfType,
                  style: TextStyleHelper.primary10,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            const BackgroundCard(),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SearchAppBar(
                    titleText: "Take Attendance",
                    filterAction: () {},
                    searchAction: controller.onSearchChange,
                    sortAction: null,
                    sortByAZAction: controller.sortByAZActionChange,
                    isSortByAZEnabled: controller.isSortByAZEnabled.value,
                    cancelAction: controller.onSearchCancel,
                  ),
                ).paddingOnly(
                  top: 36,
                  left: 16,
                  right: 16,
                  bottom: 16,
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onPanDown: (_) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: StickyAzList<StudentModel>(
                      items: controller.listData,
                      options: StickyAzOptions(
                        scrollBarOptions: ScrollBarOptions(
                          borderRadius: BorderRadius.circular(8),
                          background: Colors.blueGrey.shade100,
                          alignment: ScrollBarAlignment.center,
                          symbolBuilder: (
                            BuildContext context,
                            String symbol,
                            ScrollbarItemState state,
                          ) {
                            if (state == ScrollbarItemState.deactivated) {
                              return const SizedBox();
                            }
                            return AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              decoration: state == ScrollbarItemState.active
                                  ? BoxDecoration(
                                      color: Colors.blueGrey.shade400,
                                      shape: BoxShape.circle,
                                    )
                                  : null,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    state == ScrollbarItemState.active
                                        ? 4.0
                                        : 2,
                                  ),
                                  child: Text(
                                    symbol,
                                    style: state == ScrollbarItemState.active
                                        ? TextStyleHelper.bold12
                                        : TextStyleHelper.normal12,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        listOptions: ListOptions(
                          backgroundColor: Colors.grey.shade100,
                          headerColor: Colors.grey.shade200,
                        ),
                      ),
                      builder: (context, index, StudentModel item) {
                        return TakeAttendanceCard(model: item);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
