import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hm_demo/Global/Global.dart';
import 'package:hm_demo/Untils/rsa/rsa_utils.dart';
import 'package:hm_demo/main.dart';

class RegisterViewModel extends ChangeNotifier {
  // 用户名
  String user = "";
  // 手机号码
  String phone = "";
  // 验证码
  String code = "";
  // 登录密码
  String pwd = "";
  // 中文姓名
  String cnUser = "";
  // 性别 性别0=男1=女
  bool _sex = false;
  // 出生日期
  String _date = "";
  // 阴历阳历 出生日期0=阳历1=阴历
  bool _dateStyle = false;
  // 开始倒计时的时间
  int _countTime = 60;
  // 倒计时的工具栏
  Timer _timer;
  // 倒计时的文本
  String _countDown = "获取验证码";

  /// 初始化数据
  void initData() {
    _date = "";
    _countDown = "获取验证码";
  }

  bool get getSex {
    return _sex;
  }

  void setSex(bool v) {
    _sex = v;
    notifyListeners();
  }

  bool get getDateStyle {
    return _dateStyle;
  }

  void setDateStyle(bool v) {
    _dateStyle = v;
    notifyListeners();
  }

  // 日期的get方法
  String get getDate {
    if (_date.isEmpty) {
      return "请选择出生日期";
    }
    return _date;
  }

  // 日期的set
  void setDate(String v) {
    _date = v;
    notifyListeners();
  }

  // 开始倒计时的 文本
  String get getCountDown {
    return _countDown;
  }

  // set 方法
  void setCountDown(int v) {
    _countDown = "${_countTime}s后重新获取";
    if (_countTime == 60) {
      _countDown = "重新获取";
    }
    notifyListeners();
  }

  // 开始注册
  Future load_register() async {
    if (user.isEmpty) {
      EasyLoading.showError("请输入登录账号");
      return;
    }

    if (phone.isEmpty) {
      EasyLoading.showError("请输入手机号码");
      return;
    }

    if (code.isEmpty) {
      EasyLoading.showError("请输入验证码");
      return;
    }

    if (pwd.isEmpty) {
      EasyLoading.showError("请输入登录密码");
      return;
    }

    if (cnUser.isEmpty) {
      EasyLoading.showError("请输入中文姓名");
      return;
    }

    if (_date.isEmpty) {
      EasyLoading.showError("请选择出生日期");
      return;
    }
    print("开始注册的接口");

    // 密码加密
    var pwdEn = await encodeString(pwd);

    // 入参
    var params = {
      "username": user,
      "password": pwdEn,
      "phone": phone,
      "name": cnUser,
      "gender": _sex ? "1" : "0",
      "birthday": _date,
      "solar": _dateStyle ? "1" : "0",
    };

    // 开始请求数据
    var result = await Global().dio.post(
      "zxw/user/register",
      queryParameters: {
        "json": json.encode(params),
      },
    );

    // 解析数据
    dynamic data = result.data;
    var suc = data["success"];
    if (suc) {
      EasyLoading.showSuccess(data['msg']);
      Navigator.pop(navigatorKey.currentContext, user);
    } else {
      EasyLoading.showError(data['msg']);
    }
  }

  // 发送验证码
  void load_sendMesCode() {
    if (_countTime < 60) {
      return;
    }
    if (phone.isEmpty) {
      EasyLoading.showError("请输入手机号码");
      return;
    }
    EasyLoading.show(status: "Loading...");
    Timer(Duration(seconds: 2), () {
      EasyLoading.dismiss();
      // 开始倒计时
      _startCountDown();
    });
  }

  // 开始倒计时   //倒计时方法
  void _startCountDown() {
    final callback = (timer) {
      if (_countTime < 2) {
        _timer.cancel();
        //_timer = null;
        _countTime = 60;
      } else {
        _countTime--;
      }
      setCountDown(_countTime);
    };
    _timer = Timer.periodic(Duration(seconds: 1), callback);
  }
}
