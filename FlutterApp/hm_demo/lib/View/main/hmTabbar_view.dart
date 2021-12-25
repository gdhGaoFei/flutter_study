import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HMTabbarView extends StatefulWidget {
  const HMTabbarView({Key key}) : super(key: key);

  @override
  _HMTabbarViewState createState() => _HMTabbarViewState();
}

class _HMTabbarViewState extends State<HMTabbarView> {
  // // 选中的是哪个按钮
  // var _curSelIndex = 0;
  // // widgets body显示的
  // List<Widget> _widgets = [];

  @override
  Widget build(BuildContext context) {
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
      body: Column(
        children: [
          Container(
            height: 264.h,
            child: Swiper(
              scrollDirection:
                  Axis.horizontal, // 方向 Axis.horizontal  Axis.vertical
              itemCount: 4, // 展示数量
              autoplay: true, // 自动翻页
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  "https://img1.baidu.com/it/u=4096154597,1152085153&fm=26&fmt=auto",
                  fit: BoxFit.fill,
                );
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
            ),
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
  //     wid = MenuView();
  //   } else {
  //     wid = Center(
  //       child: Text(_curSelIndex.toString()),
  //     );
  //   }
  //   print(wid);
  //   _widgets.add(wid);
  //   return wid;
  // }
}
