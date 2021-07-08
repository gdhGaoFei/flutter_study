// 全局变量的 分装

import 'package:dio/dio.dart';

class Global {
  // 网络请求的工具类
  late Dio dio;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次  // 初始化的单例对象
  static final Global _instance = Global._internal();

  //提供了一个工厂方法来获取该类的实例
  factory Global() {
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  Global._internal() {
    // 初始化
    init();
  }
  // Singleton._internal(); // 不需要初始化
  void init() {
    dio = Dio();
    dio.options = BaseOptions(
      baseUrl: "https://api.sprakle.io/app/v2/",
      connectTimeout: 5000, //链接超时时间
      sendTimeout: 5000, // 发送的超时时间
      receiveTimeout: 30000, // 响应的超时时间
      contentType: Headers.formUrlEncodedContentType, // 请求的数据类型
      headers: {
        "token": "",
      }, // 请求头
      responseType: ResponseType.json, // 返回值解析类型
    );
    dio.interceptors.add(InterceptorsWrapper(
      // 这句话加上 如何在继续请求网络
      onRequest: (options, RequestInterceptorHandler hander) {
        print("请求信息：->\n请求头" + options.headers.toString());
        // print("\n请求参数" + options.extra.toString());
        //print("\n\n请求头" + options.toString());
        // hander.on - 继续请求？？？
        hander.next(options);
      },
      onResponse: (e, hander) {
        print("\n请求回来的数据:->\n" + e.toString());
      },
      onError: (error, hander) {
        print("\n请求的错误信息：->\n" + error.toString());
      },
    ));
  }
}
