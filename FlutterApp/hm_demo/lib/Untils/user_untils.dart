import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hm_demo/Global/Global.dart';
import 'package:hm_demo/Model/user_model.dart';
import 'package:hm_demo/Routes/routes.dart';
import 'package:hm_demo/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 用户是否已经登录成功
Future<bool> isLogin() async {
  // 初始化数据
  var token = await getUserToken();
  Global().token = token;
  bool login = token.isNotEmpty;
  return login;
}

/// 获取登录用户的token
Future<String> getUserToken() async {
  // 初始化数据
  SharedPreferences prefes = await SharedPreferences.getInstance();
  var token = prefes.getString(kSharedPreferencesToken);
  if (token == null) {
    token = "";
  }
  return token;
}

/// 获取登录用户的id
Future<String> getUserId() async {
  dynamic user = await getCurrentUserData();
  String uid = user['user']['id'].toString();
  if (uid == null) {
    uid = "";
  }
  return uid;
}

// 登录成功
void loginSuccess() {
  // Navigator.of(navigatorKey.currentContext).pushAndRemoveUntil(
  //     new MaterialPageRoute(builder: routes['menu']), (route) => route == null);
}

// 登录成功时 保存数据
void loginSuccessSaveData(dynamic da) async {
  String daJson = json.encode(da);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(kSharedPreferencesUserInfo, daJson);
  String token = da['token'];
  if (token != null) {
    Global().token = token;
  }
  prefs.setString(kSharedPreferencesToken, token);
  print(da);
}

// 获取当前的用户信息
dynamic getCurrentUserData() async {
  // 初始化数据
  SharedPreferences prefes = await SharedPreferences.getInstance();
  String user = prefes.getString(kSharedPreferencesUserInfo);
  dynamic da = json.decode(user);

  // 测试 model
  var model = UserModelData.fromJson(da);
  print(model.user.money.runtimeType);

  var modelJson = model.toJson();
  print(modelJson.toString() + "爱仕达大所多");

  // print(da);
  return da;
}

// 退出登录
void logoutClearData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // prefs.remove(key); //删除指定键
  prefs.clear(); //清空键值对

  // 跳转到登录界面
  Navigator.of(navigatorKey.currentContext).pushAndRemoveUntil(
      new MaterialPageRoute(builder: routes['/']), (route) => route == null);
}
