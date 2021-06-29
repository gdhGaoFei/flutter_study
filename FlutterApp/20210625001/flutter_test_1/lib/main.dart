import 'package:flutter/material.dart';
import 'package:flutter_test_1/Widget/Demo001.dart';
import 'package:flutter_test_1/Widget/demo002.dart';
import 'package:flutter_test_1/Widget/demo003.dart';
import 'package:flutter_test_1/Widget/demo004.dart';
import 'package:flutter_test_1/Widget/demo005.dart';

main() {
  runApp(MyApp());
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
        "layout": (context) => RowDemo(),
        "page": (context) => PageDemo(),
        "bottomNav": (context) => BottomNavBarDemo(),
      },
      initialRoute: "bottomNav",
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
