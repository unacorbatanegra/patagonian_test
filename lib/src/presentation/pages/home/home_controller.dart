import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/domains.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import 'extension.dart';

class HomeController extends GetxController {
  final connectivity = Connectivity();
  final _isLoading = false.obs;
  final _isSearching = false.obs;
  final _canSearch = false.obs;
  final _internetAccess = true.obs;

  final artistName = TextEditingController();
  final songName = TextEditingController();
  final repository = Get.find<SearchDomain>();
  final _response = Rx<ApiResponse<Search>>();

  final _isNotSearchingYet = true.obs;
  final timer = Stopwatch();
  final _minRequestSeconds = 8;
  @override
  void onInit() {
    init();
    artistName?.addListener(checkCanSearch);
    songName?.addListener(checkCanSearch);
    super.onInit();
  }

  void onHistory() => Get.toNamed(
        RouteName.history,
        arguments: repository.lastResults,
      );

  void init() async {
    _isLoading.toggle();

    connectivity.onConnectivityChanged.listen(
      (result) {
        _internetAccess.value = result != ConnectivityResult.none;
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

  void _search() async {
    if (!canSearch || isTheSameRequest) return;
    if (!serverTimeIsAvailable && timer.isRunning) {
      DialogHelper.infoDialog('Woah there, too fast', '''
Must wait ${_minRequestSeconds - timer.elapsed.inSeconds} seconds to search again''');
      return;
    }
    final hasConnection = await connectivity.checkConnectivity();
    if (hasConnection == ConnectivityResult.none) {
      DialogHelper.infoDialog('INFORMATION', 'No internet connection :(');
      return;
    }
    _isSearching.value = true;
    _isLoading.toggle();
    if (isNotSearchingYet) _isNotSearchingYet.value = false;
    _response.value = await repository.fetch(
      Search(
        artistName: artistName.text.trim(),
        songName: songName.text.trim(),
      ),
    );
    timer.reset();
    timer.start();
    _isNotSearchingYet.value = false;
    _isLoading.toggle();
  }

  VoidCallback get searchCallBack => canSearch ? _search : null;

  bool get isLoading => _isLoading.value;
  bool get isSearching => _isSearching.value;
  bool get canSearch => _canSearch.value;
  Search get response => _response.value?.data;
  bool get isNotSearchingYet => _isNotSearchingYet.value;
  bool get internetAccess => _internetAccess.value;
  String get errorMessage => _response.value?.errorMessage ?? '';
  bool get hasError => _response.value?.hasError;
  bool get notFound =>
      (_response.value?.data?.lyrics?.isEmpty ?? true) && !isNotSearchingYet;
  bool get serverTimeIsAvailable =>
      timer.elapsed.inSeconds > _minRequestSeconds;
  bool get hasPreviousResults =>
      repository.lastResults.isNotEmpty &&
      repository.lastResults.first != response;
  bool get isTheSameRequest => response != null
      ? ((response?.artistName == artistName.text.trim()) &&
          (response?.songName == songName.text.trim()))
      : false;
  Search get lastSearch =>
      hasPreviousResults ? repository.lastResults?.first : null;

  void onTapResult() => Get.toNamed(RouteName.lyric, arguments: response);
  void onTapPrevious() => Get.toNamed(RouteName.lyric, arguments: lastSearch);

  @override
  void onClose() {
    super.onClose();
    artistName.dispose();
    songName.dispose();
  }
}
