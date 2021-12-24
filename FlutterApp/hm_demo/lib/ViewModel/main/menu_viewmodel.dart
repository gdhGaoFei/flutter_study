import 'package:flutter/material.dart';

class MenuViewModel extends ChangeNotifier {
  // 用户头像
  String _head = "";

  // 用户头像 get
  String get getHead {
    return _head;
  }

  // 用户头像 set
  void setHead(String v) {
    _head = v;
    notifyListeners();
  }
}
