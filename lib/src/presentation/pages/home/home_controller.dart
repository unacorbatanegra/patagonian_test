import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'extension.dart';

class HomeController extends GetxController {
  final conectivity = Get.find<Connectivity>();
  final _isLoading = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    _isLoading.toggle();

    conectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.none) {
          Get.showSnackBar(
            SnackBar(
              content: const Text('No connection :('),
              duration: const Duration(days: 1),
            ),
          );
        } else {
          Get.hideSnackBar();
        }
      },
    );
    _isLoading.toggle();
  }

  bool get isLoading => _isLoading.value;

  @override
  void onClose() {
    super.onClose();
  }
}
