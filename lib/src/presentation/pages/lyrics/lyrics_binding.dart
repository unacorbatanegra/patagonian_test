import 'package:get/instance_manager.dart';

import 'lyrics_controller.dart';

class LyricsBinding extends Bindings {
  @override
  void dependencies() => Get.put<LyricsController>(LyricsController());
}
