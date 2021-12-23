import 'package:flutter/material.dart';
import 'package:hm_demo/View/login_re/login_view.dart';
import 'package:hm_demo/View/menu_view.dart';
import 'package:hm_demo/View/login_re/register_view.dart';
import 'package:hm_demo/View/login_re/retrieve_pwd_view.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginView(),
  "menu": (BuildContext context) => MenuView(),
  "register": (BuildContext context) => RegisterView(),
  "retrieve_pwd_view": (BuildContext context) => RetrievePwdView(),
};

// 保存token的key
final String kSharedPreferencesToken = "SharedPreferencesToken_12345";
// 保存token的key
final String kSharedPreferencesUserInfo = "SharedPreferencesUserInfo_12345";
