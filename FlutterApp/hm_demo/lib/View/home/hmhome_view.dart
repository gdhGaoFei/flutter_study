import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HMHomeView extends StatefulWidget {
  const HMHomeView({Key key}) : super(key: key);

  @override
  _HMHomeViewState createState() => _HMHomeViewState();
}

class _HMHomeViewState extends State<HMHomeView> {
  // // 选中的是哪个按钮
  // var _curSelIndex = 0;
  // // widgets body显示的
  // List<Widget> _widgets = [];

  @override
  Widget build(BuildContext context) {
    print('-=-=-==============>');
    return Scaffold(
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "首页",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "我的",
      //     ),
      //   ],
      //   currentIndex: _curSelIndex,
      //   onTap: (value) {
      //     setState(() {
      //       _curSelIndex = value;
      //     });
      //   },
      // ),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     //横轴元素个数
      //     crossAxisCount: 3,
      //     //水平单个子Widget之间间距
      //     mainAxisSpacing: 10.0.w,
      //     //垂直单个子Widget之间间距
      //     crossAxisSpacing: 10.0.h,
      //   ),
      //   itemBuilder: (BuildContext context, int index) {
      //     return _itemBuilderGridView(index);
      //   },
      //   itemCount: 10,
      // ),
      body: ListView(
        children: [
          Container(
            height: 264.h,
            child: _banner(),
          ),
          SizedBox(
            height: 10.h,
          ),
          // GridView.builder(
          //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //     //横轴元素个数
          //     crossAxisCount: 3,
          //     //水平单个子Widget之间间距
          //     mainAxisSpacing: 10.0.w,
          //     //垂直单个子Widget之间间距
          //     crossAxisSpacing: 10.0.h,
          //   ),
          //   itemBuilder: (BuildContext context, int index) {
          //     return _itemBuilderGridView(index);
          //   },
          //   itemCount: 10,
          // ),
          // GridView(gridDelegate: gridDelegate),
          ListTile(
            title: Text("记账"),
            leading: Icon(Icons.money),
            trailing: Icon(Icons.arrow_right_rounded),
          ),
        ],
      ),
    );
  }

  // // 当前选中的是哪个视图
  // Widget _getBodyWidget() {
  //   if (_curSelIndex < _widgets.length) {
  //     return _widgets[_curSelIndex];
  //   }
  //   Widget wid = null;
  //   if (_curSelIndex == 0) {
  //     wid = HMTabbarView();
  //   } else {
  //     wid = Center(
  //       child: Text(_curSelIndex.toString()),
  //     );
  //   }
  //   print(wid);
  //   _widgets.add(wid);
  //   return wid;
  // }

  Swiper _swiper;
  // 轮播图
  Swiper _banner() {
    if (_swiper == null) {
      print("object============Swiper");
      _swiper = Swiper(
        containerHeight: 264.h,
        scrollDirection: Axis.horizontal, // 方向 Axis.horizontal  Axis.vertical
        itemCount: 4, // 展示数量
        autoplay: true, // 自动翻页
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(imageUrl: "https://img1.baidu.com/it/u=4096154597,1152085153&fm=26&fmt=auto",
          fit: BoxFit.fill,);
          //   Image.network(
          //   "https://img1.baidu.com/it/u=4096154597,1152085153&fm=26&fmt=auto",
          //   fit: BoxFit.fill,
          // );
        }, // 布局构建
        onTap: (index) {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (BuildContext context) {
          //   // return RetrievePwdView();
          //   return ShowInputAlertWidget(
          //     title: "标题",
          //   );
          //   // return ShowInputAlertWidget((v) {
          //   //   print(v);
          //   // }, "提示", "请输入昵称");
          // }));
        }, // 点击时间
        pagination: SwiperPagination(), // 分页指示
        viewportFraction: 0.8, // 视窗比例
        layout: SwiperLayout.STACK, // 布局方式
        itemWidth: MediaQuery.of(context).size.width, // 条目宽度
        itemHeight: MediaQuery.of(context).size.height, // 条目高度
        autoplayDisableOnInteraction: true, // 用户进行操作时停止自动翻页
        loop: true, // 无线轮播
        // indicatorLayout: PageIndicatorLayout.SLIDE, // 指标布局 试了半天也没试出来这是啥
      );
    }
    return _swiper;
  }

// 创建每个单元格的样式
  Widget _itemBuilderGridView(int index) {
    return Center(
      child: Text(index.toString()),
    );
  }
}
