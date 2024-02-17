import 'package:get/get.dart';

import '../controllers/assignment_details_controller.dart';

class AssignmentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentDetailsController>(
      () => AssignmentDetailsController(),
    );
  }
}
