import 'package:flutter/material.dart';
import 'package:hm_demo/Global/global_theme.dart';

class SettingThemeViewModel extends ChangeNotifier {
  // 选中的是哪个color
  int _color = 0;

  // get 获取color
  int get getColor {
    return _color;
  }

  // set Color
  void setColor(int v) {
    if (v > themes.length - 1) {
      return;
    }
    _color = v;
    notifyListeners();
  }
}
