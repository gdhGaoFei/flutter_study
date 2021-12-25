import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/View/main/hmTabbar_view.dart';
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
  // 选中的是哪个按钮
  var _curSelIndex = 0;
  // widgets body显示的
  List<Widget> _widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldMenuViewKey,
      appBar: _curSelIndex == 0
          ? getAppBarLeftRightBar(
              "菜单",
              IconButton(
                onPressed: _showDrawer,
                icon: Provider.of<MenuViewModel>(context).getHead.isEmpty
                    ? Icon(Icons.person)
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                            Provider.of<MenuViewModel>(context).getHead),
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
            )
          : null,
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
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
          ),
        ],
        currentIndex: _curSelIndex,
        onTap: (value) {
          setState(() {
            _curSelIndex = value;
          });
        },
      ),
      body: _getBodyWidget(),
    );
  }

  // 当前选中的是哪个视图
  Widget _getBodyWidget() {
    if (_curSelIndex < _widgets.length) {
      return _widgets[_curSelIndex];
    }
    Widget wid = null;
    if (_curSelIndex == 0) {
      wid = HMTabbarView();
    } else {
      wid = Center(
        child: Text(_curSelIndex.toString()),
      );
    }
    print(wid);
    _widgets.add(wid);
    return wid;
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
