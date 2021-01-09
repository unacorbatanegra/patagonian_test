import 'package:get/instance_manager.dart';

import 'lyric_controller.dart';

class LyricBinding extends Bindings {
  @override
  void dependencies() => Get.put<LyricController>(LyricController());
}
