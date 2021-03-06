import 'package:dio/dio.dart';
import 'dart:async';
// import 'dart:io';
import '../config/index.dart';

Future request(url, {formData}) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    if (formData == null) {
      response = await dio.post(servicesPath[url]);
    } else {
      response = await dio.post(servicesPath[url], data: formData);
    }
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常，请检查测试代码和服务器运行状态...');
    }
  } catch (e) {
    return print('error:::${e}');
  }
}
