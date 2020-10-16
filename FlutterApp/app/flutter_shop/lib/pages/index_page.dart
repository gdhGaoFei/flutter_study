// import 'package:provide/provide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/config/color.dart';
import 'package:flutter_shop/pages/cart_page.dart';
import 'package:flutter_shop/pages/category_page.dart';
import 'package:flutter_shop/pages/person_page.dart';
import 'package:flutter_shop/provide/current_index_provide.dart';
import 'package:provide/provide.dart';
import '../config/string.dart';
import '../pages/home_page.dart';

class IndexPage extends StatelessWidget {
  ///顶部的按钮图标
  final List<BottomNavigationBarItem> bottomTools = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: kString.homeTitle, //首页
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: kString.cateTitle, //分类
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: kString.cartTitle, //购物车
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: kString.personTitle, //我的
    ),
  ];

  ///底部的界面视图
  final List<Widget> tabBodies = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    PersonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // 设置屏幕的尺寸
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return Provide<CurrentIndexProvide>(
        // 构造器 当前的内容，
        builder: (context, child, val) {
      // 取到当前的索引状态值
      int currentIndex =
          Provide.value<CurrentIndexProvide>(context).currentIndex;
      return Scaffold(
        backgroundColor: KColor.viewBackColor, //背景视图的颜色
        bottomNavigationBar: BottomNavigationBar(
          items: bottomTools,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) {
            //单击事件
            Provide.value<CurrentIndexProvide>(context).changeIndex(index);
          },
        ),
        body: IndexedStack(
          index: currentIndex,
          children: tabBodies,
        ),
      );
    });
  }
}
