import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';
import 'lyrics_controller.dart';

class LyricsPage extends GetView<LyricsController> {
  const LyricsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lyrics'),
        leading: IconButton(
          icon: const Icon(
            Ionicons.ios_arrow_back,
            color: Palette.primary,
          ),
          onPressed: Get.back,
        ),
      ),
      // in this case, this stateMixin usage is just a showcase of what
      // can be done with GetX
      body: controller.obx(
        (state) => Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24.0),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(controller.lyrics.artistName),
                  subtitle: Text(controller.lyrics.songName),
                ),
                const Divider(),
                const SizedBox(height: 6.0),
                Text(controller.lyrics.lyrics),
                const SizedBox(height: 56.0)
              ],
            ),
          ),
        ),
        onLoading: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
