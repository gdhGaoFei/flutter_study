import 'package:flutter/material.dart';
import 'package:flutter_test_1/Dio/dio_demo1.dart';
import 'package:flutter_test_1/Performance/p_countProvider.dart';
import 'package:flutter_test_1/Performance/p_debugDemo.dart';
import 'package:flutter_test_1/Performance/p_demo1.dart';
import 'package:flutter_test_1/Performance/p_provider.dart';
import 'package:flutter_test_1/Widget/Demo001.dart';
import 'package:flutter_test_1/Widget/alert_dialog_demo.dart';
import 'package:flutter_test_1/Widget/cart_demo.dart';
import 'package:flutter_test_1/Widget/demo002.dart';
import 'package:flutter_test_1/Widget/demo003.dart';
import 'package:flutter_test_1/Widget/demo004.dart';
import 'package:flutter_test_1/Widget/demo005.dart';
import 'package:flutter_test_1/Widget/demo006.dart';
import 'package:flutter_test_1/Widget/grid_view_demo.dart';
import 'package:flutter_test_1/Widget/table_demo.dart';
import 'package:provider/provider.dart';

main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CountProvider(),
      ),
    ],
    child: MyApp(),
  )
      // ChangeNotifierProvider(
      //   create: (context) => CountProvider(),
      //   child: MyApp(),
      // ),
      );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => LoginPage(),
        // "menu": (context) => MenuPage(),
        "layout": (context) => RowDemo(), // 布局
        "page": (context) => PageDemo(), // 分页 顶部的视图
        "bottomNav": (context) => BottomNavBarDemo(), // 底部tabbar
        "listView": (context) => ListViewDemo(), // 列表 listView
        "gridView": (context) => GridViewDemo(), // 网格布局
        "alertView": (context) => AlertDialogDemo(), // 弹窗 alert
        "table": (context) => TableDemo(), //表格
        "cart": (context) => CartViewDemo(), // 卡片

        ///性能优化
        "pDemo1": (context) => PODemo1(), // 性能优化
        "debug": (context) => PODebugDemo(), // 调试

        // 全局变量
        "provider": (context) => POProviderDemo(), // 全局变量
        "provider2": (context) => POTestProviderDemo(), // 测试全局状态变量

        // dio 网络相关
        "dio1": (context) => DioDemo1(), // 网络请求--dio
      },
      initialRoute: "dio1",
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      onGenerateRoute: (RouteSettings s) {
        print(s.name);
        switch (s.name) {
          case "menu":
            return MaterialPageRoute(
              builder: (context) {
                return MenuPage();
              },
              settings: s, //RouteSettings(name: "菜单", arguments: "路由的拦截"),
            );
            break;
          default:
        }
      },
      // initialRoute: "menu",
      // home: LoginPage(), //HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Test"),
        centerTitle: true,
        elevation: 10.0,
      ),
      body:
          InputDemo(), //GesClickDemo(), //ProgressDemo(), //SwitchDemo(), //ImageIconDemo(), //ButtonDemo(), //TextDemo(), //CountPage(),
    );
  }
}

class CountPage extends StatefulWidget {
  //const CountPage({Key? key}) : super(key: key);

  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        RaisedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("点击"),
        )
      ],
    );
  }
}
