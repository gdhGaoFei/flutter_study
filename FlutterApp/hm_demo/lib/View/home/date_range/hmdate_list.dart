import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hm_demo/Global/Global.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HMDateAlertListView extends StatefulWidget {
  // 点击 返回数据
  ValueSetter<int> blockClickInt;

  HMDateAlertListView({Key key, this.blockClickInt}) : super(key: key);

  @override
  _HMDateAlertListViewState createState() => _HMDateAlertListViewState();
}

class _HMDateAlertListViewState extends State<HMDateAlertListView> {
  // 刷新时的Controller
  RefreshController _refreshController;
  // itemCount
  int itemCount = 10;
  // 页面是否 退出了
  bool _isPageIn = true;

  // 初始化的时候 进行加载数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshController = RefreshController();
    _isPageIn = true;
    // 加载数据
    _loadAdd();
  }

  // 销毁时
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _isPageIn = false;
    if (_refreshController != null) {
      _refreshController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: ClassicFooter(
          loadStyle: LoadStyle.ShowAlways,
          completeDuration: Duration(microseconds: 50),
        ),
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(30),
              child: Text('${index}'),
            );
          },
        ),
        onRefresh: _loadAdd,
        onLoading: _loadMore,
        controller: _refreshController,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert_sharp),
        onPressed: () {
          if (widget.blockClickInt != null) {
            widget.blockClickInt(1);
          }
        },
      ),
    );
  }

  // 加载数据
  Future<Null> _loadAdd() async {
    /*
    var token = await getUserToken();
    print(token);
    var result = await Global().dio.get(
      "zxw/DateMessage",
      queryParameters: {
        "type": "0",
        'token': token,
      },
    );
    print("=================" + result.toString() + "======>:" + token);
    */
    //
    // var result1 = await Global().dio.get(
    //     "https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/home_page.json");
    // print(result1);

    _refreshController.resetNoData();
    return Future.delayed(Duration(seconds: 5), () {
      if (_isPageIn) {
        // 延迟5s完成刷新
        setState(() {
          itemCount = 20;
          print('object ============= 加载数据 - 刷新中');
        });
      }
      _refreshController.refreshCompleted();
    });
    // var result = await Global().dio.get(
    //   'zxw/DateMessage',
    //   queryParameters: {
    //     'type': '0',
    //   },
    // );
    // print(result);
  }

  // 加载更多 -
  void _loadMore() async {
    return Future.delayed(Duration(seconds: 5), () {
      //实例化Random类并赋值给变量rng；
      var rang = Random();
      //打印变量 rng，随机数范围(0-99);
      var isNoData = rang.nextInt(2) == 0;
      if (_isPageIn) {
        setState(() {
          itemCount = isNoData ? 15 : 35;
          print("object = ----- 加载更多");
        });
      }
      // 随机
      isNoData
          ? _refreshController.loadNoData()
          : _refreshController.loadComplete();
    });
  }
}
