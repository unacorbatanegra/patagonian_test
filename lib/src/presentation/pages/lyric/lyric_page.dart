import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'lyric_controller.dart';

class LyricPage extends GetView<LyricController> {
  const LyricPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lyric'),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(controller.lyric.artistName),
                        subtitle: Text(controller.lyric.songName),
                      ),
                      const Divider(),
                      const SizedBox(height: 6.0),
                      Text(controller.lyric.lyrics),
                      const SizedBox(height: 56.0)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
