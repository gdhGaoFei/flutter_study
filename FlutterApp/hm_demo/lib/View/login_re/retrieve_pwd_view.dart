import 'package:flutter/material.dart';
import 'package:hm_demo/base/view.dart';

class RetrievePwdView extends StatefulWidget {
  const RetrievePwdView({Key key}) : super(key: key);

  @override
  _RetrievePwdViewState createState() => _RetrievePwdViewState();
}

class _RetrievePwdViewState extends State<RetrievePwdView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("找回密码"),
    );
  }
}
