import 'package:flutter/material.dart';
import 'package:hm_demo/base/view.dart';

class HMDynamicView extends StatefulWidget {
  const HMDynamicView({Key key}) : super(key: key);

  @override
  _HMDynamicViewState createState() => _HMDynamicViewState();
}

class _HMDynamicViewState extends State<HMDynamicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("动态"),
      body: Center(
        child: Text('动态'),
      ),
    );
  }
}
