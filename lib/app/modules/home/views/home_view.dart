import 'package:flutter/material.dart';
import 'package:student/app/global_widget/popup/popup_for_language_selection.dart';
import 'package:student/app/global_widget/static/background_card.dart';
import 'package:student/app/helper/color_helper.dart';
import 'package:student/app/modules/home/local_widget/menu_card.dart';
import 'package:student/app/modules/home/views/home_details_view.dart';
import 'package:student/app/utils/constant/app_config_constant.dart';
import 'package:student/app/utils/on_back_pressed.dart';
import 'package:flutter_sliding_drawer/flutter_sliding_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => OnBackPressed.handleAppClose(context),
      child: SlidingDrawer(
        settings: SlidingDrawerSettings(drawerWidth: Get.width * 0.7),
        key: controller.slidingDrawerKey,
        contentBuilder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: const Stack(
              children: [
                BackgroundCard(),
                HomeDetailsView(),
              ],
            ),
            // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            //   mini: true,
            //   backgroundColor: ColorHelper.white,
            //   shape: const CircleBorder(),
            //   child: const Icon(Icons.add),
            // ),
            bottomNavigationBar: Card(
              margin: EdgeInsets.zero,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorHelper.grey.withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              child: Obx(
                () => NavigationBar(
                  selectedIndex: controller.selectedPageIndex.value,
                  onDestinationSelected: (int index) {
                    controller.selectedPageIndex.value = index;
                    if (index == 2 && (!AppConstant.isAdmin)) {
                      controller.openAssignmentPage();
                    } else if (index == 1) {
                      controller.openCreateAssignment();
                    } else {
                      controller.openPaymentDetails();
                    }
                  },
                  elevation: 4,
                  animationDuration: const Duration(milliseconds: 1500),
                  destinations: bottomNavigationDestination,
                ),
              ),
            ),
          );
        },
        drawerBuilder: (context) {
          return Obx(
            () => MenuCard(
              onItemClick: (s) {
                controller.slidingDrawerKey.close();
                if (s == "onLanguageChangeOption") {
                  var local = Get.locale;
                  if (local != null) showLanguagePopup(local.languageCode);
                }
              },
              versionDetails: controller.versionDetails.value,
            ),
          );
        },
      ),
    );
  }

  void showLanguagePopup(String languageCode) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
      context: Get.context!,
      builder: (c) {
        return PopUpForLanguageSelection(
          selectedLanguage: "$languageCode".obs,
          onSubmit: changeLanguage,
        );
      },
    );
  }

  void changeLanguage(String popupResult) async {
    var local = Get.locale;
    if (popupResult.isNotEmpty && local!.languageCode != popupResult) {
      Get.updateLocale(Locale(popupResult));
    }
    Get.back();
  }

  List<NavigationDestination> get bottomNavigationDestination {
    if (AppConstant.isAdmin) {
      return [
        dashboardDest,
        leaveDest,
        feeCollectionDest,
        feedbackDest,
      ];
    } else if (AppConstant.isTeacher) {
      return [
        dashboardDest,
        leaveDest,
        assignmentDest,
        feedbackDest,
      ];
    } else {
      return [
        dashboardDest,
        syllabusDest,
        assignmentDest,
        feedbackDest,
      ];
    }
  }

  NavigationDestination get dashboardDest => NavigationDestination(
        selectedIcon: const Icon(Icons.home_rounded),
        icon: const Icon(Icons.home_outlined),
        label: 'dashboard'.tr,
      );

  NavigationDestination get syllabusDest => NavigationDestination(
        selectedIcon: const Icon(Icons.chrome_reader_mode),
        icon: const Icon(Icons.chrome_reader_mode_outlined),
        label: 'syllabus'.tr,
      );

  NavigationDestination get assignmentDest => NavigationDestination(
        selectedIcon: const Icon(Icons.bookmark_added),
        icon: const Icon(Icons.bookmark_added_outlined),
        label: 'assignment'.tr,
      );

  NavigationDestination get feedbackDest => NavigationDestination(
        selectedIcon: const Icon(Icons.attach_email),
        icon: const Icon(Icons.attach_email_outlined),
        label: 'feedback'.tr,
      );

  NavigationDestination get leaveDest => NavigationDestination(
        selectedIcon: const Icon(Icons.calendar_month_rounded),
        icon: const Icon(Icons.calendar_month_rounded),
        label: 'leave'.tr,
      );

  NavigationDestination get feeCollectionDest => NavigationDestination(
        selectedIcon: const Icon(FontAwesomeIcons.indianRupeeSign),
        icon: const Icon(FontAwesomeIcons.indianRupeeSign),
        label: 'feeCollection'.tr,
      );
}
