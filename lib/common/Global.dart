import 'package:flutter/material.dart';

import 'FCColors.dart';

class Global {

  // 获取可以使用的颜色
  static List<MaterialColor> get colors => FCColors.colors();

  static Color color = Colors.black;
  static double width = 12.0;
}