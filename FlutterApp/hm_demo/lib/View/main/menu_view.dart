import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/ViewModel/main/menu_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';
import 'package:tdui/tdui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  // 获取到 当前的Scaffold
  final GlobalKey<ScaffoldState> _ScaffoldMenuViewKey =
      new GlobalKey<ScaffoldState>();
  // 输入的支出上限的文本
  String _inputMaxMonValue = "0";

  // // 初始化视图时 调用
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // 初始化数据
  //   // _initData();
  // }

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //   // 初始化数据
  //   // _initData();
  // }

  // // 获取当前的用户信息
  // void _initData() async {
  //   context.read<MenuViewModel>().setHead(
  //       "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2Ftp03%2F1Z9211616415M2-0-lp.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642918095&t=72957dec1961ae660861d0b024df884f");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldMenuViewKey,
      appBar: getAppBarLeftRightBar(
        "菜单",
        IconButton(
          onPressed: _showDrawer,
          icon: Provider.of<MenuViewModel>(context).getHead.isEmpty
              ? Icon(Icons.person)
              : CircleAvatar(
                  backgroundImage:
                      NetworkImage(Provider.of<MenuViewModel>(context).getHead),
                ),
        ),
        [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('settingTheme');
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      // getAppBarLeftBar(
      //   "菜单",
      //   IconButton(
      //     onPressed: _showDrawer,
      //     icon: Provider.of<MenuViewModel>(context).getHead.isEmpty
      //         ? Icon(Icons.person)
      //         : CircleAvatar(
      //             backgroundImage:
      //                 NetworkImage(Provider.of<MenuViewModel>(context).getHead),
      //           ),
      //   ),
      // ),
      // getAppBar("菜单"),
      // endDrawer: MenuDrawerView(),
      drawer: _drawerWidget(),
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

  // 展示 tdDrawer
  void _showDrawer() {
    //
    context.read<MenuViewModel>().setHead(
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F754601d80986bd88e7ee18d14dbd17aa3b78897b27565-YPQ5qp_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642845063&t=3899612e45944654831a716a67a2cfbe");
    //
    _ScaffoldMenuViewKey.currentState.openDrawer();
  }

  //生成 Drawer widget 的方法
  Drawer _drawerWidget() {
    return Drawer(
      child: Container(
        width: 264.w,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //     child: Column(
            //   children: [
            //     PositionedDirectional(
            //       top: 0.0,
            //       end: 0.0,
            //       child: Row(
            //         children: [
            //           ClipOval(
            //             child: Image.network(
            //               head,
            //               fit: BoxFit.fitHeight,
            //               width: 81,
            //               height: 81,
            //             ),
            //           ),
            //           Text("12345"),
            //         ],
            //       ),
            //     ),
            //   ],
            // )),
            UserAccountsDrawerHeader(
              accountName: Text(Provider.of<MenuViewModel>(context).getName),
              accountEmail: Text(Provider.of<MenuViewModel>(context).getPhone),
              currentAccountPicture: ClipOval(
                child: Image.network(
                  Provider.of<MenuViewModel>(context).getHead,
                  fit: BoxFit.fill,
                ),
              ),
              currentAccountPictureSize: Size(81.w, 81.w),
              otherAccountsPictures: [
                ClipOval(
                  child: Image.network(
                    Provider.of<MenuViewModel>(context).getHead,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Icon(Icons.ac_unit),
              ],
              onDetailsPressed: () {},
            ),
            // DrawerHeader(
            //   // decoration: Decoration,
            //   margin: EdgeInsets.all(10),
            //   padding: EdgeInsets.zero,
            //   child: Column(
            //     children: [
            //       Row(
            //         children: [
            //           ClipOval(
            //             child: Image.network(
            //               head,
            //               fit: BoxFit.fitHeight,
            //               width: 81,
            //               height: 81,
            //             ),
            //           ),
            //           // Container(
            //           //   // width: 100,
            //           //   // margin: EdgeInsets.only(right: 10),
            //           //   // alignment: AlignmentGeometry,
            //           //   child: Text(
            //           //     "编辑资料",
            //           //     textAlign: TextAlign.right,
            //           //   ),
            //           // ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 10,
            //       ),
            //       Row(
            //         children: [
            //           Text(
            //             "测试阿萨",
            //             style: TextStyle(
            //               fontSize: 24,
            //               color: Colors.black,
            //               // fontStyle: FontStyle.
            //             ),
            //           ),
            //         ],
            //       ),
            //       SizedBox(
            //         height: 4,
            //       ),
            //       Row(
            //         children: [
            //           Text(
            //             "9999999@qq.com",
            //             style: TextStyle(
            //               fontSize: 16,
            //               color: Colors.black54,
            //               // fontStyle: FontStyle.
            //             ),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            ListTile(
              title: Text("支出上限"),
              subtitle: Text(Provider.of<MenuViewModel>(context).getMaxMoney),
              trailing: Icon(Icons.arrow_right),
              onTap: _xiugai_zhichushangxian,
            ),
            ListTile(
              title: Text("注册时间"),
              subtitle: Text(Provider.of<MenuViewModel>(context).getDate),
              // trailing: Icon(Icons.arrow_right),
            ),
            ListTile(
              title: Text("退出登录"),
              trailing: Icon(Icons.logout),
              onTap: _logout,
            ),
            // TdButton(
            //   Text("退出登录"),
            //   onClick: _logout,
            // ),
          ],
        ),
      ),
    );
  }

  // 退出登录
  void _logout() {
    TdDialog.confirm(context)(
      "",
      title: "你要退出当前账号吗?",
      confirmButton: "退出",
      onConfirm: () {
        logoutClearData();
      },
    );
  }

  // 修改 支出 上限
  void _xiugai_zhichushangxian() {
    print("修改修改");
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text("支出上限"),
        content: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            CupertinoTextField(
              autofocus: true,
              textAlign: TextAlign.center,
              placeholder: "请输入支出上限",
              keyboardType: TextInputType.number,
              onChanged: (value) {
                _inputMaxMonValue = value;
              },
            ),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoDialogAction(
            child: Text("确定"),
            onPressed: () {
              if (_inputMaxMonValue.isEmpty) {
                _inputMaxMonValue = "0";
              }
              context.read<MenuViewModel>().setMaxMoney(_inputMaxMonValue);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
