import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tdui/tdui.dart';

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
            height: 148.h,
            child: _banner(),
          ),
          SizedBox(
            height: 8.h,
          ),
          // GridView(gridDelegate: gridDelegate),
          Padding(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                _itemBuilderGridView(0),
                _itemBuilderGridView(1),
                _itemBuilderGridView(2),
                _itemBuilderGridView(3),
              ],
            ),
            // GridView.builder(
            //   itemCount: 10,
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
            // ),
          ),
          ListTile(
            title: Text("记账"),
            leading: Icon(Icons.money),
            trailing: Icon(Icons.arrow_right_rounded),
            onTap: () {
              // print("object");
              Navigator.of(context).pushNamed("accouting");
            },
          ),
          // SizedBox(
          //   height: 2,
          // ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(10.w),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(
                    Icons.local_laundry_service,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 32.w,
                  ),
                  Text(
                    '恋爱日记',
                    style: TextStyle(fontSize: 15),
                  ),
                  // Container(
                  //   alignment: Alignment.centerRight,
                  //   child: Icon(Icons.arrow_right),
                  // ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('love');
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.all(10.w),
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(Icons.date_range),
                  SizedBox(
                    width: 32.w,
                  ),
                  Text('提醒事项'),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.arrow_right),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed("dateAlert");
            },
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
        // containerHeight: 264.h,
        scrollDirection: Axis.horizontal, // 方向 Axis.horizontal  Axis.vertical
        itemCount: 4, // 展示数量
        autoplay: true, // 自动翻页
        itemBuilder: (BuildContext context, int index) {
          return CachedNetworkImage(
            imageUrl:
                "https://img1.baidu.com/it/u=4096154597,1152085153&fm=26&fmt=auto",
            fit: BoxFit.fill,
          );
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
    return GestureDetector(
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          CachedNetworkImage(
            imageUrl:
                "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.zcool.cn%2Fcommunity%2F01dc7f5b3f695ea80121b994f2f637.jpg%401280w_1l_2o_100sh.jpg&refer=http%3A%2F%2Fimg.zcool.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1643196528&t=3c1b82e029741fbe44ded5dfdd372a1c",
            // fit: BoxFit.fitWidth,
            height: 56.h,
            width: 92.w,
            alignment: Alignment.bottomCenter,
          ),
          Container(
            margin: EdgeInsets.only(top: 11.w),
            child: Text(
              "按钮" + index.toString(),
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
      onTap: () {
        TdDialog.confirm(context)(
          index.toString(),
          title: index.toString(),
        );
      },
    );
  }
}
