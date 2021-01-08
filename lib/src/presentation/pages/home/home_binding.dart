import 'package:connectivity/connectivity.dart';
import 'package:get/instance_manager.dart';

import '../controllers.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<Connectivity>(Connectivity(), permanent: true);
  }
}
