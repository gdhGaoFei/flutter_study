import 'package:flutter/material.dart';
import 'package:hm_demo/main.dart';

// 将date 转化成 yyyy-DD-mm的字符串
String getYYYYmmDD(DateTime result) {
  var selYear = result.year;
  var selMonth = result.month;
  var selDay = result.day;

  var month = selMonth < 10 ? "0" + selMonth.toString() : selMonth.toString();
  var day = selDay < 10 ? "0" + selDay.toString() : selDay.toString();

  // var month = sprintf("%d", selMonth);
  var ymd = selYear.toString() + "-" + month + "-" + day;
  return ymd;
}

//选择月份的alert
Future showMonthList(List list) async {
  return await showDialog(
    context: navigatorKey.currentContext,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text("选择统计月份"),
        children: list.map((e) {
          return SimpleDialogOption(
            child: Text(e.toString() + "月"),
            onPressed: () {
              Navigator.pop(context, e);
            },
          );
        }).toList(),
      );
    },
    barrierDismissible: false,
  );
}

// 展示选择文本alert
Future showObjectAlertDialog(List list, String title, String content) async {
  return await showDialog(
    context: navigatorKey.currentContext,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text(title),
        children: list.asMap().keys.map((e) {
          return SimpleDialogOption(
            child: Text(list[e][content]),
            onPressed: () {
              Navigator.pop(context, e);
            },
          );
        }).toList(),
      );
    },
    barrierDismissible: false,
  );
}
