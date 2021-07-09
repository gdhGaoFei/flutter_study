//船员

import 'package:flutter/material.dart';

class TabbarChuanYuanView extends StatefulWidget {
  //const TabbarChuanYuanView({ Key? key }) : super(key: key);

  @override
  _TabbarChuanYuanViewState createState() => _TabbarChuanYuanViewState();
}

class _TabbarChuanYuanViewState extends State<TabbarChuanYuanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("船员"),
        centerTitle: true,
      ),
    );
  }
}
