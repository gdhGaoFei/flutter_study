// 翻译

import 'package:flutter/material.dart';

class TabbarFanYiView extends StatefulWidget {
  //const TabbarFanYiView({ Key? key }) : super(key: key);

  @override
  _TabbarFanYiViewState createState() => _TabbarFanYiViewState();
}

class _TabbarFanYiViewState extends State<TabbarFanYiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("翻译"),
        centerTitle: true,
      ),
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
