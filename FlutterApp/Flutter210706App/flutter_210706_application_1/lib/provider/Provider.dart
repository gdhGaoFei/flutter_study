// 全局状态管理

import 'package:flutter/foundation.dart';

class ProviderDemo extends ChangeNotifier {
  int _count = 0;
  get count => _count;

  void add() {
    _count++;
    notifyListeners();
  }

  //是否登录了
  bool _isLogin = false;
  bool get isLogin {
    return _isLogin;
  }

  //登录成功
  void loginOrLogout() {
    _isLogin = !_isLogin;
    notifyListeners();
    print(_isLogin ? "登录成功" : "退出登录成功");
  }
}
