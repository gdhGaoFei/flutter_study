import 'package:flutter/material.dart';
import 'package:hm_demo/base/view.dart';

class HMMineView extends StatefulWidget {
  const HMMineView({Key key}) : super(key: key);

  @override
  _HMMineViewState createState() => _HMMineViewState();
}

class _HMMineViewState extends State<HMMineView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("我的"),
      body: Center(
        child: Text('我的'),
      ),
    );
  }
}
