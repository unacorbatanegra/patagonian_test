import 'package:get/instance_manager.dart';

import 'history_controller.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() => Get.put<HistoryController>(HistoryController());
}
