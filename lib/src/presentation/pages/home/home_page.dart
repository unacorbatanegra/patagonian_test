import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/previus_results_widget.dart';
import 'widgets/search_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key key}) : super(key: key);
  static const circularIndicator = Center(child: CircularProgressIndicator());
  @override
  Widget build(BuildContext context) {
    const gap8 = SizedBox(height: 8.0);
    return Obx(
      () => SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            artistName: controller.artistName,
            songName: controller.songName,
            canSearch: controller.canSearch,
            search: controller.search,
            onHistory: controller.onHistory,
          ),
          body: Obx(
            () => controller.isLoading
                ? Container(
                    color: Colors.white,
                    child: circularIndicator,
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        gap8,
                        gap8,
                        Visibility(
                          visible: controller.hasPreviusResults,
                          child: PreviusResults(
                            lastSearch: controller.lastSearch,
                            onTap: controller.onTapPrevius,
                          ),
                        ),
                        Expanded(
                          child: controller.isSearching
                              ? controller.notFound
                                  ? Center(
                                      child: const Text(
                                        'We cannot find your song :(',
                                      ),
                                    )
                                  : controller.hasError
                                      ? Center(
                                          child: Text(controller.errorMessage),
                                        )
                                      : SearchWidget(
                                          search: controller.response,
                                          onTap: controller.onTapResult,
                                        )
                              : Center(
                                  child: const Text(
                                    'Introduce some artist to search',
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
