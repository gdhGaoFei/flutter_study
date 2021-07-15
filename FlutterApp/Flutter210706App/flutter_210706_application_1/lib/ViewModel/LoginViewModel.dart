import 'package:flutter/material.dart';
// 登录注册

class LoginViewModel extends ChangeNotifier {
  //是否登录
  bool _isLogin = false;

  //get
  bool get getIsLogin {
    return _isLogin;
  }

  //set
  void set setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }
}
