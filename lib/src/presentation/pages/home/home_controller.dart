import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import 'extension.dart';

class HomeController extends GetxController {
  final conectivity = Connectivity();
  final _isLoading = false.obs;
  final _isSearching = false.obs;
  final _canSearch = false.obs;
  final _internetAcces = true.obs;

  final artistName = TextEditingController();
  final songName = TextEditingController();
  final repository = Get.find<SearchDomain>();
  final _response = Rx<ApiResponse<Search>>();

  final _isNotSearchingYet = true.obs;
  @override
  void onInit() {
    init();
    artistName?.addListener(checkCanSearch);
    songName?.addListener(checkCanSearch);
    super.onInit();
  }

  void onHistory() => Get.toNamed(
        RouteName.history,
        arguments: SearchDomain.lastResults,
      );

  void init() async {
    _isLoading.toggle();
    conectivity.onConnectivityChanged.listen(
      (result) {
        _internetAcces.value = result != ConnectivityResult.none;
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

  void checkCanSearch() => _canSearch.value =
      artistName.text.isNotEmpty && songName.text.isNotEmpty && internetAccess;

  void search() async {
    if (!canSearch) return;
    _isSearching.value = true;
    _isLoading.toggle();
    if (isNotSearchingYet) _isNotSearchingYet.value = false;
    _response.value = await repository.fetch(
      Search(
        artistName: artistName.text.trim(),
        songName: songName.text.trim(),
      ),
    );
    _isNotSearchingYet.value = false;
    print(_response.value.data.lyrics);
    _isLoading.toggle();
  }

  bool get isLoading => _isLoading.value;
  bool get isSearching => _isSearching.value;
  bool get canSearch => _canSearch.value;
  Search get response => _response.value?.data;
  bool get isNotSearchingYet => _isNotSearchingYet.value;
  bool get internetAccess => _internetAcces.value;
  String get errorMessage => _response.value?.errorMessage ?? '';
  bool get hasError => _response.value?.hasError;
  bool get notFound =>
      (_response.value?.data?.lyrics?.isEmpty ?? true) && !isNotSearchingYet;

  bool get hasPreviusResults =>
      SearchDomain.lastResults.isNotEmpty &&
      SearchDomain.lastResults.last != response;

  Search get lastSearch =>
      hasPreviusResults ? SearchDomain?.lastResults?.last : null;

  void onTapResult() => Get.toNamed(RouteName.lyric, arguments: response);
  void onTapPrevius() => Get.toNamed(RouteName.lyric, arguments: lastSearch);

  @override
  void onClose() {
    super.onClose();
    artistName.dispose();
    songName.dispose();
  }
}
