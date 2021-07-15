// 翻译

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';

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
            onPressed: () {
              setState(() {
                Navigator.of(context).popAndPushNamed("/");
              });
            },
            child: Text("退出登录"),
          ),
        ],
      ),
    );
  }
}
