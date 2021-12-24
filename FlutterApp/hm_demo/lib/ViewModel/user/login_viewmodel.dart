import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hm_demo/Global/Global.dart';
import 'package:hm_demo/Untils/rsa/rsa_utils.dart';
import 'package:hm_demo/Untils/user_untils.dart';

class LoginViewModel extends ChangeNotifier {
  bool _isLogin = false; // 是否是登录状态
  TextEditingController _user; // 账户
  String pwd = ""; // 密码

  bool get getIsLogin {
    return _isLogin;
  }

  void setIsLogin(bool value) {
    _isLogin = value;
    notifyListeners();
  }

  TextEditingController get getUser {
    if (_user == null) {
      _user = TextEditingController();
    }
    return _user;
  }

  // void setUser(String v) {
  //   _user = v;
  //   notifyListeners();
  // }

  // 请求数据
  void load_denglu() async {
    var u_str = _user.text;
    if (u_str.isEmpty) {
      EasyLoading.showError("请输入账号");
      return;
    }
    if (pwd.isEmpty) {
      EasyLoading.showError("请输入密码");
      return;
    }

    setIsLogin(true);
    // 加密的pwdEn
    var pwdEn = await encodeString(pwd);

    var result = await Global().dio.post(
      "zxw/user",
      queryParameters: {
        "password": pwdEn,
        "username": u_str,
      },
    );
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      dynamic da = data['data'];
      loginSuccessSaveData(da);
      EasyLoading.showSuccess(data['msg']);
      // 登录成功
      loginSuccess();
      pwd = '';
    } else {
      EasyLoading.showError(data['msg']);
    }
    setIsLogin(false);
  }

  // 验证 token 的 有效性
  void zxw_user_token() async {
    var result = await Global().dio.get(
          "zxw/user",
        );
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      var da = data['data'];
      var token = await getUserToken();
      data = {'user': da, "token": token};
      loginSuccessSaveData(data);
    } else {
      EasyLoading.showError(data['msg']);
      logoutClearData();
    }
  }
}
