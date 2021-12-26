import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hm_demo/Routes/routes.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/View/dynamic/hmdynamic_view.dart';
import 'package:hm_demo/View/dynamic/hmdynamicpublic_view.dart';
import 'package:hm_demo/View/home/hmhome_view.dart';
import 'package:hm_demo/View/message/hmmessage_view.dart';
import 'package:hm_demo/View/mine/hmmine_view.dart';
import 'package:hm_demo/ViewModel/main/hmtabbar_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';
import 'package:tdui/tdui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HMTabbarView extends StatefulWidget {
  const HMTabbarView({Key key}) : super(key: key);

  @override
  _HMTabbarViewState createState() => _HMTabbarViewState();
}

class _HMTabbarViewState extends State<HMTabbarView> {
  // 获取到 当前的Scaffold
  final GlobalKey<ScaffoldState> _ScaffoldHMTabbarViewKey =
      new GlobalKey<ScaffoldState>();
  // 输入的支出上限的文本
  String _inputMaxMonValue = "0";
  // 选中的是哪个按钮
  var _curSelIndex = 0;
  // widgets body显示的
  List _widgets = [
    "home",
    "dynamic",
    "public",
    "message",
    "mine",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldHMTabbarViewKey,
      appBar: _curSelIndex == 0
          ? getAppBarLeftRightBar(
              "菜单",
              IconButton(
                onPressed: _showDrawer,
                icon: Provider.of<HMTabbarViewModel>(context).getHead.isEmpty
                    ? Icon(Icons.person)
                    : CircleAvatar(
                        backgroundImage: NetworkImage(
                            Provider.of<HMTabbarViewModel>(context).getHead),
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
      //     icon: Provider.of<HMTabbarViewModel>(context).getHead.isEmpty
      //         ? Icon(Icons.person)
      //         : CircleAvatar(
      //             backgroundImage:
      //                 NetworkImage(Provider.of<HMTabbarViewModel>(context).getHead),
      //           ),
      //   ),
      // ),
      // getAppBar("菜单"),
      // endDrawer: MenuDrawerView(),
      drawer: _drawerWidget(),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "首页",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: "我的",
      //     ),
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
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _curSelIndex = 0;
                });
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _curSelIndex = 1;
                });
              },
              icon: Icon(Icons.delivery_dining),
            ),
            SizedBox(),
            IconButton(
              onPressed: () {
                setState(() {
                  _curSelIndex = 3;
                });
              },
              icon: Icon(Icons.messenger),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _curSelIndex = 4;
                });
              },
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          // setState(() {
          //   _curSelIndex = 2;
          // });
          // Navigator.of(context).pushNamed("mine");
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation animation,
                      Animation secondaryAnimation) =>
                  FadeTransition(
                //使用渐隐渐入过渡,
                opacity: animation,
                child: HMDynamicPublicView(),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _getBodyWidget(),
    );
  }

  // 当前选中的是哪个视图
  Widget _getBodyWidget() {
    var curSel = _widgets[_curSelIndex];
    var curType = curSel.runtimeType;
    if (curType != String) {
      print(_widgets);
      return _widgets[_curSelIndex];
    }
    Widget wid = null;
    switch (_curSelIndex) {
      case 0: // 首页
        wid = HMHomeView();
        break;
      case 1: // 动态
        wid = HMDynamicView();
        break;
      case 2: // 发布
        // wid = HMHomeView();
        // Navigator.of(context).pushNamed("mine");
        break;
      case 3: // 消息
        wid = HMMessageView();
        break;
      case 4:
        wid = HMMineView();
        break;
      default:
    }
    print(wid);
    if (wid != null) {
      _widgets[_curSelIndex] = wid;
    }
    return wid;
  }

  // 展示 tdDrawer
  void _showDrawer() {
    //
    context.read<HMTabbarViewModel>().setHead(
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F754601d80986bd88e7ee18d14dbd17aa3b78897b27565-YPQ5qp_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642845063&t=3899612e45944654831a716a67a2cfbe");
    //
    _ScaffoldHMTabbarViewKey.currentState.openDrawer();
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
              accountName:
                  Text(Provider.of<HMTabbarViewModel>(context).getName),
              accountEmail:
                  Text(Provider.of<HMTabbarViewModel>(context).getPhone),
              currentAccountPicture: ClipOval(
                child: Image.network(
                  Provider.of<HMTabbarViewModel>(context).getHead,
                  fit: BoxFit.fill,
                ),
              ),
              currentAccountPictureSize: Size(81.w, 81.w),
              otherAccountsPictures: [
                ClipOval(
                  child: Image.network(
                    Provider.of<HMTabbarViewModel>(context).getHead,
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
              subtitle:
                  Text(Provider.of<HMTabbarViewModel>(context).getMaxMoney),
              trailing: Icon(Icons.arrow_right),
              onTap: _xiugai_zhichushangxian,
            ),
            ListTile(
              title: Text("注册时间"),
              subtitle: Text(Provider.of<HMTabbarViewModel>(context).getDate),
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
              context.read<HMTabbarViewModel>().setMaxMoney(_inputMaxMonValue);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
