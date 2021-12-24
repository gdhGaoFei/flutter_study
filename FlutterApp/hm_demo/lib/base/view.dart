import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

// 统一的AppBar
AppBar getAppBar(String title) {
  return AppBar(
    title: Text(
      title,
      // style: TextStyle(fontSize: 10),
    ),
    elevation: 10,
    centerTitle: true,
  );
}

// 添加 左侧的 按钮
AppBar getAppBarLeftBar(String title, Widget leading) {
  return AppBar(
    title: Text(
      title,
      // style: TextStyle(fontSize: 10),
    ),
    elevation: 10,
    centerTitle: true,
    leading: leading,
  );
}

// 初始化 EasyLoading
void configEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  // ..customAnimation = CustomAnimation();
}
