// TabbarView

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/View/TabbarAddView.dart';
import 'package:flutter_210706_application_1/View/TabbarChuanYuanView.dart';
import 'package:flutter_210706_application_1/View/TabbarFaceView.dart';
import 'package:flutter_210706_application_1/View/TabbarFanYiView.dart';

class TabbarView extends StatefulWidget {
  //const TabbarView({ Key? key }) : super(key: key);

  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  //选中的下标
  int _currentIndex = 0;

  // body
  List<Widget> _controllers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllers = [
      TabbarAddView(),
      TabbarFaceView(),
      TabbarFanYiView(),
      TabbarChuanYuanView(),
    ];
  }

  // 销毁时
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        // backgroundColor: Colors.amber, // tabbar的背景颜色
        selectedItemColor: Colors.blue, // item选中的颜色
        // fixedColor: Colors.red,// item选中的颜色
        unselectedItemColor: Colors.black, // item未选中的颜色
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            activeIcon: Icon(Icons.add_a_photo_rounded),
            label: "添加",
          ),
          BottomNavigationBarItem(
            label: "美颜",
            activeIcon: Icon(Icons.face_retouching_off_rounded),
            icon: Icon(Icons.face),
          ),
          BottomNavigationBarItem(
            label: "翻译",
            icon: Icon(Icons.g_translate),
          ),
          BottomNavigationBarItem(
            label: "船员",
            icon: Icon(Icons.nat),
          ),
        ],
      ),
      body: _controllers[_currentIndex],
    );
  }
}
