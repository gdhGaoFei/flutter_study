import 'package:flutter/material.dart';

// main() {
//   print("main");
//   runApp(MyApp());
// }
main() => runApp(MyApp());

/// - ===== 一切皆 小部件(UIView)
// - ===== 类型
class MyApp extends StatelessWidget {
  String name = "我的手机APP";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("资讯学习flutter"),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text("添加资讯"),
                onPressed: () {},
              ),
            ),
            Card(
              child: Column(
                children: <Widget>[
                  Image.asset('assets/app_icon_1024.png'),
                  Text("全民语音-APP-icon")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // build(context) {
  //   return MaterialApp(
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: Text("资讯学习flutter"),
  //       ),
  //       body: Column(
  //         children: <Widget>[
  //           Container(
  //             margin: EdgeInsets.all(10.0),
  //             child: RaisedButton(
  //               child: Text("添加资讯"),
  //               onPressed: () {},
  //             ),
  //           ),
  //           Card(
  //             child: Column(
  //               children: <Widget>[
  //                 Image.asset('assets/app_icon_1024.png'),
  //                 Text("全民语音-APP-icon")
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}

class MyiPhoneApp extends MyApp {
  String name = "我的苹果手机";
}
