import 'package:flutter/material.dart';
import 'package:flutter_test_1/Widget/Demo001.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
