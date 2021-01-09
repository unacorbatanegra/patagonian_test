import 'package:get/get.dart';

import '../../../models/models.dart';
import '../../../utils/utils.dart';

class HistoryController extends GetxController {
  final list = <Search>[].obs;
  final _isLoading = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() {
    _isLoading.toggle();
    list.addAll(Get.arguments as List<Search>);
    _isLoading.toggle();
  }

  void onTap(int index) => Get.toNamed(RouteName.lyric, arguments: list[index]);

  bool get isLoading => _isLoading.value;
}
