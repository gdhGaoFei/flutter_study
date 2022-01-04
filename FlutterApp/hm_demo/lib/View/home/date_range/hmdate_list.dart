import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hm_demo/Global/Global.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HMDateAlertListView extends StatefulWidget {
  const HMDateAlertListView({Key key}) : super(key: key);

  @override
  _HMDateAlertListViewState createState() => _HMDateAlertListViewState();
}

class _HMDateAlertListViewState extends State<HMDateAlertListView> {
  // 刷新时的Controller
  RefreshController _refreshController;
  // itemCount
  int itemCount = 10;

  // 初始化的时候 进行加载数据
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshController = RefreshController();
    // 加载数据
    _loadAdd();
  }

  // 销毁时
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _refreshController.dispose();
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
        onLoading: _loadAdd,
        controller: _refreshController,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_alert_sharp),
        onPressed: () {},
      ),
    );
  }

  // 加载数据
  Future<Null> _loadAdd() {
    return Future.delayed(Duration(seconds: 5), () {
      print('object =============');
      // 延迟5s完成刷新
      setState(() {
        itemCount = 20;
      });
    });
    // var result = await Global().dio.get(
    //   'zxw/DateMessage',
    //   queryParameters: {
    //     'type': '0',
    //   },
    // );
    // print(result);
  }
}
