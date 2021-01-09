import 'package:get/instance_manager.dart';

import '../../../domain/domains.dart';
import '../controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchDomain>(
      () => SearchDomain(),
    );
    Get.put<HomeController>(
      HomeController(),
      permanent: true,
    );
  }
}
