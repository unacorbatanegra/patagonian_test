import 'package:get/get.dart';

import '../../../models/models.dart';

class LyricController extends GetxController {
  final _lyric = Rx<Search>();
  final _isLoading = false.obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _isLoading.toggle();
    _lyric.value = Get.arguments as Search;
    _isLoading.toggle();
  }

  Search get lyric => _lyric.value;
  bool get isLoading => _isLoading.value;
}
