import 'dart:convert';
// import 'dart:html';
// import 'dart:developer';
// import 'dart:html';
import 'package:flutter/material.dart';
import '../service/http_service.dart';
import '../config/index.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// - === 首页视图控制器
class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  // 防止刷新处理 保持当前状态
  @override
  bool get wantKeepAlive => true;

  //类似diff。 加上key是为了更改变化的值才去刷新，否则不用去做操作
  GlobalKey<RefreshFooterState> _footerKey = GlobalKey<RefreshFooterState>();

  @override
  void initState() {
    super.initState();
    print("首页刷新了...");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return Center(
    //   child: Text(kString.cateTitle),
    // );
    return Scaffold(
      backgroundColor: KColor.viewBackColor, //背景色
      appBar: AppBar(
        title: Text(kString.homeTitle), //标题
      ),
      body: FutureBuilder(
          //防止 多次重绘
          future: request("homePageContent", formData: null),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data.toString());
              var dataStr = snapshot.data.toString();
              var data = json.decode(dataStr);
              print(data);
              // - = 数据
              Map dataData = data['data'];
              // 轮播图的数据
              List<Map> swiperDataList = (dataData['slides'] as List).cast();
              // 分类的数据
              List<Map> category = (dataData['category'] as List).cast();
              // 推荐
              List<Map> recommend = (dataData['recommend'] as List).cast();
              // 广告
              List<Map> floor1 = (dataData['floor1'] as List).cast();
              // 中间广告 一个
              Map floor1Pic = dataData['floor1Pic'];

              return EasyRefresh(
                refreshFooter: ClassicsFooter(
                  key: _footerKey,
                  bgColor: Colors.white,
                  textColor: KColor.refreshTextColor,
                  moreInfoColor: KColor.refreshTextColor,
                  showMore: true, //是否暂时 加载 更多
                  noMoreText: '', //没有更多数据时显示
                  moreInfo: kString.loading,
                  loadReadyText: kString.loadReadyText,
                ),
                child: ListView(
                  children: <Widget>[
                    SwiperDiyHome(
                      key: Key('SwiperDiyHome'),
                      swiperDataList: swiperDataList,
                    ),
                    // SwiperDiyHome(
                    //   swiperDataList,
                    // )

                    // 分类导航
                    TopNavgatorHome(
                      key: Key("TopNavgatorHome"),
                      navgatorList: category,
                    ),

                    // 推荐
                    RecommendUIHome(
                      key: Key('RecommendUIHome'),
                      recommendList: recommend,
                    ),

                    // 中间的广告
                    FloorRecommendHone(
                      key: Key("FloorRecommendHone"),
                      floorPic: floor1Pic,
                    ),

                    // 尾部的 商品广告
                    FloorTailHome(
                      key: Key('FloorTailHome'),
                      floors: floor1,
                    ),
                  ],
                ),
                loadMore: () async {
                  //加载更多商品
                  print("开始加载更多...");
                },
              );
            } else {
              return Center(
                child: Text("加载中..."),
              );
            }
          }),
    );
  }
}

// - == 首页轮播图的 编写
class SwiperDiyHome extends StatelessWidget {
  ///数据源
  final List swiperDataList;
  // 构造函数 初始化 不知道这个Key干啥的
  SwiperDiyHome({Key key, this.swiperDataList}) : super(key: key);

  // List swiperDataList;
  // SwiperDiyHome(List swiperDataList) {
  //   //super(key: key);
  //   this.swiperDataList = swiperDataList;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          Map data = swiperDataList[index];
          // 点击有反馈的控件
          return InkWell(
            onTap: () {
              print("点击了轮播图第${index}个");
            },
            child: Image.network(
              data['image'],
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: swiperDataList.length,
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}

// - === 首页分类导航控件 顶部导航的按钮
class TopNavgatorHome extends StatelessWidget {
  // 数据源
  final List navgatorList;
  // 初始化
  TopNavgatorHome({Key key, this.navgatorList}) : super(key: key);
  //TopNavgatorHome({Key key, List navgatorList}) => super(key: key);

  // - === 按钮
  Widget _gridViewItemUI(BuildContext context, item, index) {
    /// 具有点击事件的控件
    return InkWell(
      onTap: () {
        print("跳转到商品详情界面" + item['firstCategoryName']);
      },

      /// 纵向控件
      child: Column(
        children: <Widget>[
          Image.network(
            item['image'],
            width: ScreenUtil().setWidth(95),
          ),
          Text(
            item['firstCategoryName'],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 数据源 长度
    int ntlLen = navgatorList.length;
    if (ntlLen > 10) {
      navgatorList.removeRange(10, ntlLen);
    }

    // 下标
    var tempIndex = -1;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: 5.0),
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3),
      child: GridView.count(
        // 禁止滚动
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        padding: EdgeInsets.all(4),
        children: this.navgatorList.map((item) {
          tempIndex += 1;
          return _gridViewItemUI(context, item, tempIndex);
        }).toList(),
      ),
    );
  }
}

// - ==== 商品推荐
class RecommendUIHome extends StatelessWidget {
  // 数据源
  final List recommendList;
  // 初始化
  RecommendUIHome({Key key, this.recommendList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children: <Widget>[
          _titleRecommendUI(context),
          _listRecomendUI(context),
        ],
      ),
    );
  }

  // - === 标题的title
  Widget _titleRecommendUI(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            bottom: BorderSide(width: 0.5, color: KColor.refreshTextColor)),
      ),
      child: Text(
        kString.recommendText,
        style: TextStyle(color: KColor.recommendTextColor, fontSize: 16),
      ),
    );
  }

  // - ==== 商品推荐的列表
  Widget _listRecomendUI(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(280.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _itemRecommendUI(context, index);
        },
        // 滚动方向 水平
        scrollDirection: Axis.horizontal,
        // 个数
        itemCount: recommendList.length,
      ),
    );
  }

  // Item
  Widget _itemRecommendUI(BuildContext context, index) {
    Map item = recommendList[index];
    return InkWell(
      onTap: () {
        print("=====推荐的商品${index}=========");
      },
      child: Container(
        width: ScreenUtil().setWidth(280.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            left: BorderSide(color: KColor.refreshTextColor, width: 0.5),
            bottom: BorderSide(color: KColor.refreshTextColor, width: 0.5),
          ),
        ),
        child: Column(
          children: <Widget>[
            // 防止溢出
            Expanded(
              child: Image.network(
                item['image'],
                fit: BoxFit.contain,
              ),
            ),
            // 打折价
            Text(
              '￥${item['presentPrice']}',
              style: TextStyle(color: KColor.presentPriceTextColor),
            ),
            // 原价
            Text(
              '￥${item['oriPrice']}',
              style: KFont.oriPriceTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}

// - ==== 商品推荐的中间广告
class FloorRecommendHone extends StatelessWidget {
  // 数据源
  final Map floorPic;
  FloorRecommendHone({Key key, this.floorPic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          print(" === 中间广告位的点击事件 === ");
        },
        child: Image.network(
          floorPic['PICTURE_ADDRESS'],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// - === 首页底部的 尾部的广告
class FloorTailHome extends StatelessWidget {
  // 数据源
  final List<Map> floors;
  FloorTailHome({Key key, this.floors}) : super(key: key);

  // 跳转 商品的详情
  void jumpGoodsDetail(BuildContext context, {int index}) {
    String goodsId = this.floors[index]['goodsId'];
    print("商品的详情=====" + goodsId);
  }

  // 进行布局
  @override
  Widget build(BuildContext context) {
    // 宽度
    double width1 = ScreenUtil.getInstance().width;
    return Container(
      child: Row(
        children: <Widget>[
          // 左侧的视图
          Expanded(
              child: Column(
            children: <Widget>[
              // 左上角的 大图
              Container(
                padding: EdgeInsets.only(top: 4, right: 1),
                height: ScreenUtil().setHeight(400),
                child: InkWell(
                  child: Image.network(
                    this.floors[0]["image"],
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    this.jumpGoodsDetail(context, index: 0);
                  },
                ),
              ),

              // 左下角的图
              Container(
                height: ScreenUtil().setHeight(200),
                padding: EdgeInsets.only(top: 1, bottom: 1, right: 1),
                child: InkWell(
                  child: Image.network(
                    this.floors[1]['image'],
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    this.jumpGoodsDetail(context, index: 1);
                  },
                ),
              ),
            ],
          )),

          // 右侧的视图
          Expanded(
              child: Column(
            children: <Widget>[
              // 右侧的上 大图
              Container(
                height: ScreenUtil().setHeight(200),
                padding: EdgeInsets.only(top: 4, left: 1, bottom: 1),
                child: InkWell(
                  child: Image.network(
                    this.floors[2]['image'],
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    this.jumpGoodsDetail(context, index: 2);
                  },
                ),
              ),

              // 右侧的中 图
              Container(
                height: ScreenUtil().setHeight(200),
                padding: EdgeInsets.only(left: 1, top: 1),
                child: InkWell(
                  child: Image.network(
                    this.floors[3]['image'],
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    this.jumpGoodsDetail(context, index: 3);
                  },
                ),
              ),

              // 右侧的下 图
              Container(
                height: ScreenUtil().setHeight(200),
                padding: EdgeInsets.only(top: 1, bottom: 1, left: 1),
                child: InkWell(
                  child: Image.network(
                    this.floors[4]['image'],
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    this.jumpGoodsDetail(context, index: 4);
                  },
                ),
              ),
            ],
          ))
        ],
        // 水平方向 均等的布局
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 取最小的值
        mainAxisSize: MainAxisSize.min,
      ),
    );
  }
}
