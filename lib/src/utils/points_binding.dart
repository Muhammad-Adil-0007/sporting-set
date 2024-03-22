import 'package:get/get.dart';
import 'package:sporting_set/src/utils/points_controller.dart';

class PointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PointsController());
  }
}