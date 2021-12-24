import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Global {
  // static _instance，_instance会在编译期被初始化，保证了只被创建一次  // 初始化的单例对象
  static final Global _instance = Global._internal();

  // 网络请求
  Dio dio;
  String token = "";

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  Global._internal() {
    init();
  }

  //提供了一个工厂方法来获取该类的实例
  factory Global() {
    return _instance;
  }

  // Singleton._internal(); // 不需要初始化
  void init() async {
    // bool login = await isLogin();
    // 初始化网络请求
    dio = Dio();
    // 初始化属性
    dio.options = BaseOptions(
      baseUrl: "https://zxw.td0f7.cn/",
      connectTimeout: 5000, //链接时间
      sendTimeout: 5000, // 发送时间
      receiveTimeout: 5000, // 响应时间
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );

    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        EasyLoading.show(status: "Loading");
        print("加载中...=========");
        options.headers.addAll({
          "token": token,
        });
        return handler.next(options); //continue
      },
      onResponse: (e, handler) {
        EasyLoading.dismiss();
        print("请求成功=========");
        return handler.next(e);
      },
      onError: (DioError e, handler) {
        EasyLoading.dismiss();
        String msg = "";
        if (e.type == DioErrorType.connectTimeout) {
          msg = "连接超时错误";
        } else {
          msg = e.message;
          if (msg.isEmpty) {
            msg = "接口错误！";
          }
        }
        EasyLoading.showError(msg);
        print(msg);
      },
    ));
  }
}
