import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hm_demo/Global/global_theme.dart';
import 'package:hm_demo/Routes/routes.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/ViewModel/accounting/hmaccountingadd_viewmodel.dart';
import 'package:hm_demo/ViewModel/accounting/hmaccouting_viewmodel.dart';
import 'package:hm_demo/ViewModel/love/hmloveimage_viewmodel.dart';
import 'package:hm_demo/ViewModel/main/hmtabbar_viewmodel.dart';
import 'package:hm_demo/ViewModel/main/settingTheme_viewmodel.dart';
import 'package:hm_demo/ViewModel/message/hmmessage_viewmodel.dart';
import 'package:hm_demo/ViewModel/user/login_viewmodel.dart';
import 'package:hm_demo/ViewModel/user/register_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 获取全局的上下文 context
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  // 设置屏幕适配
  WidgetsFlutterBinding.ensureInitialized();
  // 获取保存的主题色
  var prefers = await SharedPreferences.getInstance();
  int curColorIndex = prefers.getInt(kSharedPreferencesThemeColor) ?? 0;
  var themeViewModel = SettingThemeViewModel();
  themeViewModel.setColor(curColorIndex);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (context) => HMTabbarViewModel()),
        ChangeNotifierProvider(create: (context) => themeViewModel),
        ChangeNotifierProvider(create: (context) => HMAccoutingViewmodel()),
        ChangeNotifierProvider(create: (context) => HMAccoutingAddViewModel()),
        ChangeNotifierProvider(create: (context) => HMLoveImageViewModel()),
        ChangeNotifierProvider(create: (context) => HMMessageViewModel()),
      ],
      child: MyApp(),
    ),
  );
  // 初始化 configEasyLoading
  configEasyLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // 是否已经登录了
  bool _isLogin = false;

  @override
  void initState() {
    /// 初始化数据
    initData();

    // TODO: implement initState
    super.initState();
  }

  // 初始化数据
  void initData() async {
    print("进入了此界面=======");
    bool login = await isLogin();
    if (login) {
      _isLogin = true;
      loginSuccess();
      context.read<LoginViewModel>().zxw_user_token();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 当前的主题颜色变化了
    int curColorIndex = Provider.of<SettingThemeViewModel>(context).getColor;

    /// 当前的颜色
    Color curThemeColor = themes[curColorIndex];

    return ScreenUtilInit(
      //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 此处假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)
      designSize: Size(375, 667),
      builder: () => RefreshConfiguration(
        headerBuilder: () =>
            WaterDropHeader(), // 配置默认头部指示器,假如你每个页面的头部指示器都一样的话,你需要设置这个
        footerBuilder: () => ClassicFooter(), // 配置默认底部指示器
        headerTriggerDistance: 80.h, // 头部触发刷新的越界距离
        springDescription: SpringDescription(
            mass: 1.9,
            stiffness: 170,
            damping: 16), // 自定义回弹动画,三个属性值意义请查询flutter api
        maxOverScrollExtent: 100, //头部最大可以拖动的范围,如果发生冲出视图范围区域,请设置这个属性
        maxUnderScrollExtent: 0, // 底部最大可以拖动的范围
        enableScrollWhenRefreshCompleted:
            true, //这个属性不兼容PageView和TabBarView,如果你特别需要TabBarView左右滑动,你需要把它设置为true
        enableLoadingWhenFailed: true, //在加载失败的状态下,用户仍然可以通过手势上拉来触发加载更多
        hideFooterWhenNotFull: false, // Viewport不满一屏时,禁用上拉加载更多功能
        enableBallisticLoad: true, // 可以通过惯性滑动触发加载更多
        child: MaterialApp(
          // debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          title: '华梅APP',
          theme: ThemeData.light().copyWith(
            primaryColor: curThemeColor,
            buttonTheme: ButtonThemeData(
              buttonColor: curThemeColor,
              textTheme: ButtonTextTheme.normal,
            ),
            // buttonBarTheme: ButtonBarThemeData(
            //   buttonTextTheme: ButtonTextTheme.normal,
            // ),
          ),
          // ThemeData(
          //   // This is the theme of your application.
          //   //
          //   // Try running your application with "flutter run". You'll see the
          //   // application has a blue toolbar. Then, without quitting the app, try
          //   // changing the primarySwatch below to Colors.green and then invoke
          //   // "hot reload" (press "r" in the console where you ran "flutter run",
          //   // or simply save your changes to "hot reload" in a Flutter IDE).
          //   // Notice that the counter didn't reset back to zero; the application
          //   // is not restarted.
          //   primarySwatch: Colors.blue,
          // ),
          builder: EasyLoading.init(),
          routes: routes,
          initialRoute: _isLogin ? "menu" : "/",
        ),
      ),
    );
  }
}
