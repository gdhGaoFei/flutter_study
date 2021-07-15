// 导航栏

import 'package:flutter/material.dart';

Widget getBaseNavBar(String title) {
  return AppBar(
    title: Text(title),
    elevation: 10,
    centerTitle: true,
  );
}
