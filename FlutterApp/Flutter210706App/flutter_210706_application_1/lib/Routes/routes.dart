// 所有的路由

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/View/LoginView.dart';
import 'package:flutter_210706_application_1/View/RegisteredView.dart';
import 'package:flutter_210706_application_1/View/TabbarView.dart';

Map<String, WidgetBuilder> routes = {
  "/": (BuildContext context) => LoginView(),
  "tabbar": (BuildContext context) => TabbarView(),
  "register": (BuildContext context) => RegisteredView(),
};
