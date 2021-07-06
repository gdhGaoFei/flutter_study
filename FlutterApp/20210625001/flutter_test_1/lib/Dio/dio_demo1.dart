// 网络请求的练习
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioDemo1 extends StatefulWidget {
  //const DioDemo1({ Key? key }) : super(key: key);

  @override
  _DioDemo1State createState() => _DioDemo1State();
}

class _DioDemo1State extends State<DioDemo1> {
  //网络请求的管理类
  Dio _dio;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*
    _dio = Dio();
    _dio.options.baseUrl = "https://api.sprakle.io/app/v2/";
    // 链接超时
    _dio.options.connectTimeout = 5000;
    // 接口反应时长
    _dio.options.receiveTimeout = 3000;
    */
    var options = BaseOptions(
      receiveTimeout: 3000,
      connectTimeout: 5000,
      baseUrl: "https://api.sprakle.io/app/v2/",
    );
    _dio = Dio(options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dio-网络请求"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _getDemo();
            },
            child: Text("GET网络请求"),
          ),
          ElevatedButton(
            onPressed: () {
              _postDemo();
            },
            child: Text("POST网络请求"),
          ),
        ],
      ),
    );
  }

  // GET请求
  void _getDemo() async {
    // var result = await Dio().get(
    //   "https://api.sprakle.io/app/v2/currency/getCurrencys",
    //   queryParameters: {
    //     "currencyType": "1",
    //   },
    // );
    // print(result);
    String url1 =
        "currency/getCurrencys"; //"https://api.sprakle.io/app/v2/currency/getCurrencys";
    var result1 = await _dio.get(
      url1,
      queryParameters: {
        "currencyType": "1",
      },
    );
    print(result1);
  }

  // POST请求
  void _postDemo() async {
    var result = await Dio().post(
      "https://api.sprakle.io/app/v2/user/getLevelList",
      queryParameters: {
        // "platform": "1",
      },
      options: Options(
        headers: {
          "language": "en_US",
          "token": "",
        },
        contentType: Headers.jsonContentType,
      ),
    );
    print(result);
  }
}
