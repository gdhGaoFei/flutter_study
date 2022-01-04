import 'package:flutter/material.dart';
import 'package:hm_demo/View/dynamic/hmdynamic_view.dart';
import 'package:hm_demo/View/dynamic/hmdynamicpublic_view.dart';
import 'package:hm_demo/View/home/accounting/hmaccounting_view.dart';
import 'package:hm_demo/View/home/accounting/hmaccountingadd_view.dart';
import 'package:hm_demo/View/home/accounting/hmaccountingchart_view.dart';
import 'package:hm_demo/View/home/date_range/hmdate_range.dart';
import 'package:hm_demo/View/home/love/hmloveImage_view.dart';
import 'package:hm_demo/View/login_re/login_view.dart';
import 'package:hm_demo/View/main/hmtabbar_view.dart';
import 'package:hm_demo/View/login_re/register_view.dart';
import 'package:hm_demo/View/login_re/retrieve_pwd_view.dart';
import 'package:hm_demo/View/home/settingTheme_view.dart';
import 'package:hm_demo/View/home/hmhome_view.dart';
import 'package:hm_demo/View/message/hmmessage_view.dart';
import 'package:hm_demo/View/mine/hmmine_view.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginView(),
  "tabbar": (BuildContext context) => HMHomeView(),
  "menu": (BuildContext context) => HMTabbarView(),
  "register": (BuildContext context) => RegisterView(),
  "retrieve_pwd_view": (BuildContext context) => RetrievePwdView(),
  'settingTheme': (BuildContext context) => SettingThemeView(),
  'accouting': (BuildContext context) => HMAccoutingView(),
  'accouting/chart': (BuildContext context) => HMAccountingChartView(),
  "accouting/add": (BuildContext context) => HMAccoutingAddView(),
  'love': (BuildContext context) => HMLoveImageView(),
  'dateAlert': (BuildContext context) => HMDateRangeView(),
  'message': (BuildContext context) => HMMessageView(),
  'dynamic': (BuildContext context) => HMDynamicView(),
  "dynamic_public": (BuildContext context) => HMDynamicPublicView(),
  'mine': (BuildContext context) => HMMineView(),
};

// 保存token的key
final String kSharedPreferencesToken = "SharedPreferencesToken_12345";
// 保存userinfo的key
final String kSharedPreferencesUserInfo = "SharedPreferencesUserInfo_12345";

///保存主题色的key
final String kSharedPreferencesThemeColor = "SharedPreferencesThemeColor_12345";
