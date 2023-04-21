import 'package:flutter/material.dart';
import 'package:hm_demo/View/home/date_range/hmdate_add.dart';
import 'package:hm_demo/View/home/date_range/hmdate_list.dart';

class HMDateRangeView extends StatefulWidget {
  const HMDateRangeView({Key key}) : super(key: key);

  @override
  _HMDateRangeViewState createState() => _HMDateRangeViewState();
}

class _HMDateRangeViewState extends State<HMDateRangeView>
    with SingleTickerProviderStateMixin {
  // tabbarcontroller
  TabController _controller;
  // widget
  List<Widget> _widgets = [];

  @override
  void initState() {
    // 初始化数据
    HMDateAlertListView list = HMDateAlertListView(
      blockClickInt: (value) {
        setState(() {
          print('object - ====== 添加 提醒事项');
          _controller.index = 1;
        });
      },
    );
    _widgets = [list, HMDateAlertAddView()];
    // 初始化Controller
    _controller = TabController(length: _widgets.length, vsync: this);

    // TODO: implement initState
    super.initState();
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
        title: Text('提醒事项'),
        elevation: 10,
        centerTitle: true,
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(
              text: '列表',
            ),
            Tab(
              text: '添加',
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: _widgets,
        controller: _controller,
      ),
    );
  }
}
