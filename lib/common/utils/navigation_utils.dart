import 'package:flutter/material.dart';

class NavigationUtils {
  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, _route(widget));
  }

  static void push(BuildContext context, Widget widget) {
    Navigator.push(context, _route(widget));
  }

  static void pushAndRemove(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(context, _route(widget), (route) => false);
  }

  static MaterialPageRoute _route(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
