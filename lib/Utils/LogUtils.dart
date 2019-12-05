import 'package:flutter/services.dart';

class LogUtils {
  static const perform = const MethodChannel("flower_chart_io/log");

  static void v(String tag, String message) {
    perform.invokeMethod('logV', {'tag': tag, 'message': message});
  }
}