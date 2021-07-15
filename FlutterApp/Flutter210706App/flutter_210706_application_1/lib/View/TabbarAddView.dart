//添加视图

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';

class TabbarAddView extends StatefulWidget {
  //const TabbarAddView({ Key? key }) : super(key: key);

  @override
  _TabbarAddViewState createState() => _TabbarAddViewState();
}

class _TabbarAddViewState extends State<TabbarAddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("添加"),
    );
  }
}
