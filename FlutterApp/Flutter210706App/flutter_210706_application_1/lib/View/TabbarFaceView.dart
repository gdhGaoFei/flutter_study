// 美颜

import 'package:flutter/material.dart';

class TabbarFaceView extends StatefulWidget {
  //const TabbarFaceView({ Key? key }) : super(key: key);

  @override
  _TabbarFaceViewState createState() => _TabbarFaceViewState();
}

class _TabbarFaceViewState extends State<TabbarFaceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美颜"),
        centerTitle: true,
      ),
    );
  }
}
