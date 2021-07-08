// 全局状态管理

import 'package:flutter/foundation.dart';

class ProviderDemo extends ChangeNotifier {
  int _count = 0;
  get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }
}
