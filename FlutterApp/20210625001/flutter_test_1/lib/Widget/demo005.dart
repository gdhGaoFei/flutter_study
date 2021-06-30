//底部的选项卡

import 'package:flutter/material.dart';
import 'package:flutter_test_1/Widget/demo001.dart';
import 'package:flutter_test_1/Widget/demo003.dart';
import 'package:flutter_test_1/Widget/demo004.dart';

class BottomNavBarDemo extends StatefulWidget {
  //const BottomNavBarDemo({ Key? key }) : super(key: key);

  List<Widget> tabs = [
    PageDemo(),
    RowDemo(),
    WarpDemo(),
    TextDemo(),
  ];

  @override
  _BottomNavBarDemoState createState() => _BottomNavBarDemoState();
}

class _BottomNavBarDemoState extends State<BottomNavBarDemo> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("底部选项卡"),
      // ),

      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.my_library_add),
      //       label: "我的",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "首页",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.hail),
      //       label: "消息",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: "列表",
      //     ),
      //   ],
      //   currentIndex: _index,
      //   onTap: (v) {
      //     setState(() {
      //       _index = v;
      //     });
      //   },
      // ),

      // body: Center(
      //   child: Text(_index.toString()),
      // ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor, //Colors.lightGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            SizedBox(),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
            // Icon(Icons.my_library_add),
          ],
        ),
      ),
      body: widget.tabs[_index],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm_outlined),
        onPressed: () {
          print("object");
        },
      ),
    );
  }
}
