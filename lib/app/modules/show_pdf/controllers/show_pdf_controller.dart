
import 'dart:typed_data';

import 'package:get/get.dart';

class ShowPdfController extends GetxController {
  Uint8List get data => Get.arguments as Uint8List;
}
