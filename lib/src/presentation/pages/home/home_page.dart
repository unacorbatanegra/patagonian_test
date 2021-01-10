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
      () => Scaffold(
        appBar: CustomAppBar(
          artistName: controller.artistName,
          songName: controller.songName,
          canSearch: controller.canSearch,
          search: controller.searchCallBack,
          onHistory: controller.onHistory,
        ),
        body: Obx(
          () => controller.isLoading
              ? circularIndicator
              : Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      gap8,
                      gap8,
                      Visibility(
                        visible: controller.hasPreviousResults,
                        child: PreviusResults(
                          lastSearch: controller.lastSearch,
                          onTap: controller.onTapPrevious,
                        ),
                      ),
                      Expanded(
                        child: controller.isSearching
                            ? controller.notFound
                                ? const _InfoWidget(
                                    'We cannot find your song :(')
                                : controller.hasError
                                    ? _InfoWidget(controller.errorMessage)
                                    : SearchWidget(
                                        search: controller.response,
                                        onTap: controller.onTapResult,
                                      )
                            : const _InfoWidget(
                                'Introduce some artist and song to search'),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class _InfoWidget extends StatelessWidget {
  final String label;
  const _InfoWidget(
    this.label, {
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(label));
  }
}
