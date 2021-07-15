// 注册的界面

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';

class RegisteredView extends StatefulWidget {
  //const RegisteredView({ Key? key }) : super(key: key);

  @override
  _RegisteredViewState createState() => _RegisteredViewState();
}

class _RegisteredViewState extends State<RegisteredView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("注册"),
    );
  }
}
