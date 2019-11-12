import 'dart:ui';
import 'package:flutter/services.dart';

class AppUIStyle {
  static SystemUiOverlayStyle uiStyle = const SystemUiOverlayStyle(
    systemNavigationBarColor: const Color(0x00000000),
    systemNavigationBarDividerColor: null,
    statusBarColor: const Color(0x00000000),
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  );

  // 状态栏和header同色
  static appUIStyle() {
    SystemChrome.setSystemUIOverlayStyle(uiStyle);
  }
}
