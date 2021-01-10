import 'package:get/get.dart';

import '../../../models/models.dart';

class LyricsController extends GetxController with StateMixin<Search> {
  final _lyrics = Rx<Search>();
  final _isLoading = false.obs;
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    change(null, status: RxStatus.loading());
    _lyrics.value = Get.arguments as Search;
    change(lyrics, status: RxStatus.success());
  }

  Search get lyrics => _lyrics.value;
  bool get isLoading => _isLoading.value;
}
