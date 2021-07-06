// 性能优化

import 'package:flutter/material.dart';

class PODemo1 extends StatefulWidget {
  //const PODemo1({ Key? key }) : super(key: key);

  @override
  _PODemo1State createState() => _PODemo1State();
}

class _PODemo1State extends State<PODemo1> {
  // 改变数据
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("性能优化-不容易啊"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.amber,
            child: GestureDetector(
              child: Text("1"),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.blue,
            child: PODemoCount(),
            // child: GestureDetector(
            //   child: Text("$_count"),
            //   onTap: () {
            //     setState(() {
            //       _count++;
            //     });
            //   },
            // ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.cyan,
            child: GestureDetector(
              child: Text("2"),
            ),
          ),
        ],
      ),
    );
  }
}

// 优化第一步
class PODemoCount extends StatefulWidget {
  //const PODemoCount({ Key? key }) : super(key: key);

  @override
  _PODemoCountState createState() => _PODemoCountState();
}

class _PODemoCountState extends State<PODemoCount> {
  // 改变的数据
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        count.toString(),
      ),
      onTap: () {
        setState(() {
          count++;
        });
      },
    );
  }
}
