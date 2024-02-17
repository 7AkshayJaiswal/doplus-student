import 'package:get/get.dart';

import '../controllers/create_assignment_controller.dart';

class CreateAssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateAssignmentController>(
      () => CreateAssignmentController(),
    );
  }
}
