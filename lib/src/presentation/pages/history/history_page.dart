import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import '../home/widgets/search_widget.dart';
import 'history_controller.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: IconButton(
          icon: const Icon(
            Ionicons.ios_arrow_back,
            color: Palette.primary,
          ),
          onPressed: Get.back,
        ),
      ),
      body: Obx(
        () => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(24.0),
                child: controller.list.isNotEmpty
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            ...controller.list
                                .asMap()
                                .entries
                                .map(
                                  (e) => SearchWidget(
                                    search: e.value,
                                    onTap: () => controller.onTap(e.key),
                                  ),
                                )
                                .toList()
                          ],
                        ),
                      )
                    : const Center(
                        child: Text('No history yet'),
                      ),
              ),
      ),
    );
  }
}
