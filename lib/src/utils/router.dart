import 'package:get/get.dart';

import '../presentation/pages/bindings.dart';
import '../presentation/pages/pages.dart';
import 'utils.dart';

mixin CustomRouter {
  static final routes = [
    GetPage(
      name: RouteName.main,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RouteName.lyric,
      page: () => LyricsPage(),
      binding: LyricsBinding(),
    ),
    GetPage(
      name: RouteName.history,
      page: () => HistoryPage(),
      binding: HistoryBinding(),
    ),
  ];
}
