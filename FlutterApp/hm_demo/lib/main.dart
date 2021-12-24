import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hm_demo/Routes/routes.dart';
import 'package:hm_demo/ViewModel/main/menu_viewmodel.dart';
import 'package:hm_demo/ViewModel/user/login_viewmodel.dart';
import 'package:hm_demo/ViewModel/user/register_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 获取全局的上下文 context
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginViewModel()),
        ChangeNotifierProvider(create: (context) => RegisterViewModel()),
        ChangeNotifierProvider(create: (context) => MenuViewModel()),
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
    SharedPreferences prefes = await SharedPreferences.getInstance();
    var token = prefes.getString(kSharedPreferencesToken);
    if (token != null && token.isNotEmpty) {
      _isLogin = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: '华梅APP',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      routes: routes,
      initialRoute: _isLogin ? "menu" : "/",
    );
  }
}
