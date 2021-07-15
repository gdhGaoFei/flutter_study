// 美颜

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';

class TabbarFaceView extends StatefulWidget {
  //const TabbarFaceView({ Key? key }) : super(key: key);

  @override
  _TabbarFaceViewState createState() => _TabbarFaceViewState();
}

class _TabbarFaceViewState extends State<TabbarFaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("美颜"),
    );
  }
}
