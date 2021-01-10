import 'package:flutter/material.dart';

class NoGlowingScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          showLeading: false,
          showTrailing: false,
          child: child,
          axisDirection: axisDirection,
          color: Color(0x0),
        );
      default:
        return super.buildViewportChrome(context, child, axisDirection);
    }
  }
}
