import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'application.dart';

class NavigatorUtils {
  static void push(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
//      TransitionType transition = TransitionType.cupertino,
      TransitionType transition = TransitionType.native,
      Duration transitionDuration = const Duration(milliseconds: 300),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }

  static void goBack(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }
}
