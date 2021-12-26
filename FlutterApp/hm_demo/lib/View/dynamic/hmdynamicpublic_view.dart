import 'package:flutter/material.dart';
import 'package:hm_demo/base/view.dart';

class HMDynamicPublicView extends StatefulWidget {
  const HMDynamicPublicView({Key key}) : super(key: key);

  @override
  _HMDynamicPublicViewState createState() => _HMDynamicPublicViewState();
}

class _HMDynamicPublicViewState extends State<HMDynamicPublicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("发布动态"),
      body: Center(
        child: Text('发布动态'),
      ),
    );
  }
}
