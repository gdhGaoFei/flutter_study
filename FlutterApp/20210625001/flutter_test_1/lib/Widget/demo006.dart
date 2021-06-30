// 滚动列表视图 TableView

import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  //const ListViewDemo({ Key? key }) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  // 数据源
  List<int> datas = List();
  // Controller
  ScrollController _controller;
  //🔝操作 置顶
  bool _isShowBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 200; i++) {
      datas.add(i);
    }
    _controller = ScrollController();
    //添加监听
    _controller.addListener(() {
      print(_controller);
      double offset = _controller.offset;
      if (offset > 1500 && !_isShowBtn) {
        setState(() {
          _isShowBtn = true;
        });
      } else if (offset < 200 && _isShowBtn) {
        setState(() {
          _isShowBtn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动视图-ListView"),
      ),
      floatingActionButton: _isShowBtn
          ? FloatingActionButton(
              child: Icon(Icons.access_alarm),
              onPressed: () {
                _controller.animateTo(0,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.bounceInOut);
              },
            )
          : null,
      body: Scrollbar(
        child: RefreshIndicator(
          // child: ListView(
          //   // shrinkWrap: true,
          //   // reverse: true,
          //   itemExtent: 44,
          //   children: datas
          //       .map(
          //         (e) => Text(
          //           e.toString(),
          //         ),
          //       )
          //       .toList(),
          // ),
          child: ListView.builder(
            itemBuilder: (BuildContext bContext, int index) {
              if (index == 3) {
                return Icon(Icons.ac_unit);
              }
              return Text(datas[index].toString());
            },
            itemExtent: 50,
            itemCount: datas.length,
            controller: _controller,
          ),
          onRefresh: _onRefresh,
        ),
      ),
    );
  }

  Future _onRefresh() async {
    // 延时3秒 模拟网络加载数据
    await Future.delayed(
      Duration(seconds: 3),
      () {
        print("object");
        //return "";
      },
    );
    //return "";
  }
}
