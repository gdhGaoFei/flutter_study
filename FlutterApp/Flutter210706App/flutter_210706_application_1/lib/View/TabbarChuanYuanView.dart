//船员

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';

class TabbarChuanYuanView extends StatefulWidget {
  //const TabbarChuanYuanView({ Key? key }) : super(key: key);

  @override
  _TabbarChuanYuanViewState createState() => _TabbarChuanYuanViewState();
}

class _TabbarChuanYuanViewState extends State<TabbarChuanYuanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("船员"),
    );
  }
}
