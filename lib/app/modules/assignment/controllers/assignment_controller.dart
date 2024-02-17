import 'dart:developer';

import 'package:get/get.dart';

class AssignmentController extends GetxController {
  final isLoading = true.obs;
  final selectedFilter = "${"all".tr}".obs;
  final list = <int>[].obs;

  int get count => list.length;

  @override
  void onInit() {
    super.onInit();
    loadAfterInit();
  }

  Future<bool> loadMore() async {
    log("onLoadMore callback run");

    await Future.delayed(
      const Duration(
        seconds: 0,
        milliseconds: 2000,
      ),
    );

    loadItems();
    return true;
  }

  Future<void> refreshData() async {
    await Future.delayed(
      const Duration(
        seconds: 0,
        milliseconds: 2000,
      ),
    );

    list.clear();
    loadItems();
  }

  void loadItems() {
    log("loading items");
    list.addAll(List.generate(20, (i) => i + (1 + count)));
  }
  void loadAfterInit() async {
    await Future.delayed(const Duration(seconds: 4));
    isLoading.value = false;
    loadItems();
  }

  void selectedFilterAction(String selectedChoice) => selectedFilter.value = selectedChoice;
}
