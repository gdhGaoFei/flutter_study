import 'package:flutter/material.dart';
import 'package:hm_demo/View/login_re/login_view.dart';
import 'package:hm_demo/View/home/menu_view.dart';
import 'package:hm_demo/View/login_re/register_view.dart';
import 'package:hm_demo/View/login_re/retrieve_pwd_view.dart';
import 'package:hm_demo/View/home/settingTheme_view.dart';
import 'package:hm_demo/View/main/hmTabbar_view.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginView(),
  "tabbar": (BuildContext context) => HMTabbarView(),
  "menu": (BuildContext context) => MenuView(),
  "register": (BuildContext context) => RegisterView(),
  "retrieve_pwd_view": (BuildContext context) => RetrievePwdView(),
  'settingTheme': (BuildContext context) => SettingThemeView(),
};

// 保存token的key
final String kSharedPreferencesToken = "SharedPreferencesToken_12345";
// 保存userinfo的key
final String kSharedPreferencesUserInfo = "SharedPreferencesUserInfo_12345";

///保存主题色的key
final String kSharedPreferencesThemeColor = "SharedPreferencesThemeColor_12345";
