// 调试 debug

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PODebugDemo extends StatefulWidget {
  //const PODebugDemo({Key? key}) : super(key: key);

  @override
  _PODebugDemoState createState() => _PODebugDemoState();
}

class _PODebugDemoState extends State<PODebugDemo> {
  // 变量Count
  int _count = 0;

  //测试使用 字符串
  String test;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("调试-Debug"),
      ),
      // body: Text(
      //   _count.toString(),
      // ),
      body: Container(
        child: Column(
          children: [
            Text(
              _count.toString(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_outlined),
        onPressed: () {
          setState(() {
            _count++;
            if (_count == 15) {
              test = "========2->" * 2000;
              print(test);
            }
            if (_count == 15) {
              test = "aaaaa====>" * 2000;
              print(test);
            }
          });
        },
      ),
    );
  }
}
