import 'package:flutter/material.dart';
import 'package:hm_demo/base/view.dart';

class HMMessageView extends StatefulWidget {
  const HMMessageView({Key key}) : super(key: key);

  @override
  _HMMessageViewState createState() => _HMMessageViewState();
}

class _HMMessageViewState extends State<HMMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("消息"),
      body: Center(
        child: Text("消息"),
      ),
    );
  }
}
