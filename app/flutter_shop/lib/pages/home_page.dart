import 'package:flutter/material.dart';
import '../config/string.dart';

/// - === 首页视图控制器
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(kString.homeTitle),
    );
  }
}
