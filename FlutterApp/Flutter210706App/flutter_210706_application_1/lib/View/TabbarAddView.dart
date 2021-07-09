//添加视图

import 'package:flutter/material.dart';

class TabbarAddView extends StatefulWidget {
  //const TabbarAddView({ Key? key }) : super(key: key);

  @override
  _TabbarAddViewState createState() => _TabbarAddViewState();
}

class _TabbarAddViewState extends State<TabbarAddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("添加"),
        centerTitle: true,
      ),
    );
  }
}
