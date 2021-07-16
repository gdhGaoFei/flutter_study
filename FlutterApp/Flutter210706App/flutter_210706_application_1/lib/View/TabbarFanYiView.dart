// 翻译

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class TabbarFanYiView extends StatefulWidget {
  //const TabbarFanYiView({ Key? key }) : super(key: key);

  @override
  _TabbarFanYiViewState createState() => _TabbarFanYiViewState();
}

class _TabbarFanYiViewState extends State<TabbarFanYiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("翻译"),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _logout,
            child: Text("退出登录"),
          ),
        ],
      ),
    );
  }

  // 退出登录
  void _logout() {
    EasyLoading.show();
    new Timer(Duration(seconds: 3), () {
      Navigator.of(context).popAndPushNamed("/");
      EasyLoading.dismiss();
    });
  }
}
