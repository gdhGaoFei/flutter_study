// 网格布局 CollectionView

import 'package:flutter/material.dart';

class GridViewDemo extends StatefulWidget {
  //const GridViewDemo({ Key? key }) : super(key: key);

  @override
  _GridViewDemoState createState() => _GridViewDemoState();
}

class _GridViewDemoState extends State<GridViewDemo> {
  // 数据源
  List<int> datas = List();
  // 视图控制器
  ScrollController _scrollController;
  // 是否显示 置顶的按钮
  bool isShowBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 添加数据源
    for (var i = 0; i < 100; i++) {
      datas.add(i);
    }
    // 初始化视图
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      if (offset > 1500 && !isShowBtn) {
        setState(() {
          isShowBtn = true;
        });
      } else if (offset < 100 && isShowBtn) {
        setState(() {
          isShowBtn = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("网格布局-GridView"),
      ),
      floatingActionButton: isShowBtn
          ? FloatingActionButton(
              child: Icon(Icons.topic_sharp),
              onPressed: () {
                print("点击置顶");
                _scrollController.animateTo(
                  0,
                  duration: Duration(milliseconds: 250),
                  curve: Curves.ease,
                );
              },
            )
          : null,
      body: Scrollbar(
        child: RefreshIndicator(
          child: GridView(
            controller: _scrollController,
            // padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // childAspectRatio: 1.0,
              crossAxisCount: 3,
              crossAxisSpacing: 10, // 左右的间距
              mainAxisSpacing: 10, //上下的间距
            ),
            // shrinkWrap: true,//到顶时 是否还能滑动
            // scrollDirection: Axis.horizontal,// 左右滑动还是上下滑动
            children: datas
                .map(
                  (e) => Container(
                    // width: 100,
                    // height: 100,
                    color: Colors.amber,
                    child: Text(
                      e.toString(),
                    ),
                  ),
                )
                .toList(),
          ),
          onRefresh: _onRefresh,
        ),
      ),
    );
  }

  Future _onRefresh() async {
    await Future.delayed(
      Duration(seconds: 3),
      () {
        print("object");
      },
    );
  }
}
