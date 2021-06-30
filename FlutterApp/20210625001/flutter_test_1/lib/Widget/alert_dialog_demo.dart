// 弹窗 AlertView

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogDemo extends StatefulWidget {
  //const AlertDialogDemo({ Key? key }) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
//列表弹窗提示的数据源
  List<int> _datas = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化数据源
    for (var i = 0; i < 30; i++) {
      _datas.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗-AlertView"),
      ),
      body: Column(
        children: [
          RaisedButton(
            onPressed: _showAlertView,
            child: Text("点击弹窗"),
          ),
          RaisedButton(
            onPressed: _showSimpleDialog,
            child: Text("列表的弹窗"),
          ),
        ],
      ),
    );
  }

  // 列表弹窗
  void _showSimpleDialog() async {
    print("列表弹窗");
    var result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        //CupertinoAlertDialog;
        return SimpleDialog(
          title: Text("列表弹窗提示"),
          children: _datas
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    print(e);
                    Navigator.of(context).pop(e);
                  },
                  child: Text(e.toString()),
                ),
              )
              .toList(),
        );
      },
    );
    print("result ---> $result");
  }

  // ignore: missing_return
  void _showAlertView() async {
    print("object");
    var result = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        //CupertinoAlertDialog
        return AlertDialog(
          title: Text("弹窗提示"),
          content: Text("提示的内容，是否要删除？"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("取消"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
    print(result);
  }
}
