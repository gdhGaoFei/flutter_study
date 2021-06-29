import 'package:flutter/material.dart';

class PageDemo extends StatefulWidget {
  //const PageDemo({ Key? key }) : super(key: key);

  List<Widget> widgets = [
    FlutterView(),
    iOSView(),
    AndroidView(),
  ];

  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo>
    with SingleTickerProviderStateMixin {
  List tabs = ["Flutter", "iOS", "Android"];
  TabController _controller;
  int _index = 0;
  @override
  void initState() {
    // TODO: implement initState
    _controller = TabController(
      initialIndex: _index,
      length: tabs.length,
      vsync: this,
    );
    super.initState();
    _controller.addListener(() {
      setState(() {
        _index = _controller.index;
      });
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
        title: Text("顶部的Segment - Tabbar"),
        centerTitle: true, //文本是否居中
        elevation: 30, //阴影
        // leading: IconButton(
        //   icon: Icon(Icons.add),
        //   onPressed: () {
        //     print("点击点击");
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              print("home");
            },
          ),
          IconButton(
            icon: Icon(Icons.label),
            onPressed: () {
              print("第二个单击");
            },
          ),
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: tabs
              .map(
                (e) => Tab(
                  text: e,
                ),
              )
              .toList(),
        ),
      ),
      // body: widget.widgets[_index],
      body: TabBarView(
        children: widget.widgets,
        controller: _controller,
      ),
      drawer: DrawerDemoView(),
    );
  }
}

///抽屉View
class DrawerDemoView extends StatelessWidget {
  //const DrawerDemoView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 44,
              ),
              child: Text("抽屉第一个按钮"),
            ),
          ],
        ),
        removeTop: true,
      ),
    );
  }
}

class iOSView extends StatelessWidget {
  //const iOSView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("iOS"),
    );
  }
}

class AndroidView extends StatelessWidget {
  //const AndroidView({ Key? key }) : su//per(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Android"),
    );
  }
}

class FlutterView extends StatelessWidget {
  //const FlutterView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Flutter"),
    );
  }
}
