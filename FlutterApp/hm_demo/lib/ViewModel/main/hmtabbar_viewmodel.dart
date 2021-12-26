import 'package:flutter/material.dart';
import 'package:hm_demo/Untils/user_untils.dart';

class HMTabbarViewModel extends ChangeNotifier {
  // 用户头像
  String _head = "";
  // 用户名称
  String _name = "";
  // 用户联系方式
  String _phone = "";
  // 支出上限
  String _maxMoney = "0";
  // 注册时间
  String _date = "";

  HMTabbarViewModel() {
    setHead(
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z9211616415M2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642918095&t=72957dec1961ae660861d0b024df884f");

    // 初始化数据
    _initData();
  }

  // 初始化数据
  void _initData() async {
    dynamic da = await getCurrentUserData();
    var user = da['user'];
    setName(user['name']);
    setPhone(user['phone']);
    setMaxMoney(user['money'].toString());
    setDate(user['date']);
  }

  // 用户头像 get
  String get getHead {
    return _head;
  }

  // 用户头像 set
  void setHead(String v) {
    _head = v;
    notifyListeners();
  }

  // 支出上限 get
  String get getMaxMoney {
    return _maxMoney;
  }

  // 支出上限 set
  void setMaxMoney(String v) {
    _maxMoney = v;
    notifyListeners();
  }

  // 用户名 get
  String get getName {
    return _name;
  }

  // 用户名 set
  void setName(String v) {
    _name = v;
    notifyListeners();
  }

  // 用户联系方式 get
  String get getPhone {
    return _phone;
  }

  // 用户联系方式 set
  void setPhone(String v) {
    _phone = v;
    notifyListeners();
  }

  // 用户注册时间 get
  String get getDate {
    return _date;
  }

  // 用户注册时间 set
  void setDate(String v) {
    _date = v;
    notifyListeners();
  }
}
