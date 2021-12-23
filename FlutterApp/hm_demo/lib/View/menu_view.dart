import 'package:flutter/material.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/base/view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tdui/tdui.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("菜单"),
      body: Center(
        child: TdButton(
          Text("退出登录"),
          onClick: _logout,
        ),
      ),
    );
  }

  // 退出登录
  void _logout() {
    logoutClearData();
  }
}
