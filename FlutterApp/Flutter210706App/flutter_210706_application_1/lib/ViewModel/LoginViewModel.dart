// 登录注册

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/Model/LoginModel.dart';
import 'package:json_annotation/json_annotation.dart';

// import 'package:flutter_210706_application_1/main.dart';
// import 'package:weui/weui.dart';

class LoginViewModel extends ChangeNotifier {
  //是否登录
  bool _isLogin = false;

  //get
  bool get getIsLogin {
    return _isLogin;
  }

  //set
  void setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  // 登录的数据
  void login_user(String name, String pwd) async {
    setIsLogin(true);
    if (name == null || name.isEmpty) {
      setIsLogin(false);
      // EasyLoading.showError("账号不能为空");
      return;
    } else if (pwd == null || pwd.length < 6 || pwd.length > 20) {
      setIsLogin(false);
      // EasyLoading.showError("密码必须为6-20位");
      return;
    }

    // var context = navigatorKey.currentContext;
    // print(context.toString());
    // WeToast.fail(context)(message: "奥术大师大大");

    // 开始请求数据
    var result = await LoginModel().login_user(name, pwd);
    // var data = LoginUserModel.fromJson(result);
    print(result);
    setIsLogin(false);
  }
}
