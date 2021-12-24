import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/ViewModel/main/menu_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';
import 'package:tdui/tdui.dart';

class MenuView extends StatefulWidget {
  const MenuView({Key key}) : super(key: key);

  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBarLeftBar(
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
      ),
      body: Column(
        children: [
          Container(
            height: 260,
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
              // onTap: () {}, // 点击时间
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

  /// 展示 tdDrawer
  void _showDrawer() async {
    //
    context.read<MenuViewModel>().setHead(
        "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fhbimg.b0.upaiyun.com%2F754601d80986bd88e7ee18d14dbd17aa3b78897b27565-YPQ5qp_fw658&refer=http%3A%2F%2Fhbimg.b0.upaiyun.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1642845063&t=3899612e45944654831a716a67a2cfbe");
    //

    //
    var head = context.read<MenuViewModel>().getHead;
    print(head);

    tdDrawer(context)(
      // placement: TdDrawerPlacement.right, //方向
      // 内容
      child: Container(
        width: 286,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              // decoration: Decoration,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          head,
                          fit: BoxFit.fitHeight,
                          width: 81,
                          height: 81,
                        ),
                      ),
                      // Container(
                      //   // width: 100,
                      //   // margin: EdgeInsets.only(right: 10),
                      //   // alignment: AlignmentGeometry,
                      //   child: Text(
                      //     "编辑资料",
                      //     textAlign: TextAlign.right,
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "测试阿萨",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          // fontStyle: FontStyle.
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        "9999999@qq.com",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          // fontStyle: FontStyle.
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TdButton(
              Text("退出登录"),
              onClick: _logout,
            ),
          ],
        ),
      ),
    );
  }

  // 退出登录
  void _logout() {
    logoutClearData();
  }
}
