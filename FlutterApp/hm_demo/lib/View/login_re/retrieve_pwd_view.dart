import 'package:flutter/material.dart';
import 'package:hm_demo/base/view.dart';

class RetrievePwdView extends StatefulWidget {
  const RetrievePwdView({Key key}) : super(key: key);

  @override
  _RetrievePwdViewState createState() => _RetrievePwdViewState();
}

class _RetrievePwdViewState extends State<RetrievePwdView> {
  // 选中的哪个视图
  var _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("找回密码"),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
          ),
        ],
        currentIndex: _curIndex,
        onTap: (value) {
          setState(() {
            _curIndex = value;
          });
        },
      ),
      body: Center(
        child: Text(
          _curIndex.toString(),
        ),
      ),
    );
  }
}
