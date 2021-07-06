import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier {
  int _count = 0;

  get count {
    return _count;
  }

  //get count => _count;

  void add() {
    _count++;
    // 刷新所有的观察者
    notifyListeners();
  }
}
