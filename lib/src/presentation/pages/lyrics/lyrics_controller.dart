import 'package:get/get.dart';

import '../../../models/models.dart';

class LyricsController extends GetxController {
  final _lyrics = Rx<Search>();
  final _isLoading = false.obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _isLoading.toggle();
    _lyrics.value = Get.arguments as Search;
    _isLoading.toggle();
  }

  Search get lyrics => _lyrics.value;
  bool get isLoading => _isLoading.value;
}
