import 'package:flutter/foundation.dart';
import 'package:hm_demo/Global/Global.dart';

class HMMessageViewModel extends ChangeNotifier {
  
  // 获取数据 携程的首页
  void getTripHomePage() async {
    //
    var result = await Global().dio.get(
        "https://apk-1256738511.cos.ap-chengdu.myqcloud.com/FlutterTrip/data/home_page.json");
    print(result);
  }
}
