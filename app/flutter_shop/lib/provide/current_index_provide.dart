import 'package:flutter/material.dart';

/// 切换底部导航栏 tabbar
class CurrentIndexProvide with ChangeNotifier {
  ///当前选中的是哪个下标界面
  int currentIndex = 0;

  ///更改选中的下标界面 更改完成之后，需要通知监听这个值的界面
  void changeIndex(int newIndex) {
    this.currentIndex = newIndex;
    notifyListeners();
  }
}
