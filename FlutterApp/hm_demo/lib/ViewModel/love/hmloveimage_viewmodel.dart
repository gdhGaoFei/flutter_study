import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hm_demo/Global/Global.dart';

class HMLoveImageViewModel extends ChangeNotifier {
  // 网络图片的列表
  List _imgs;

  List get getImgs {
    return _imgs;
  }

  void setImgs(List val) {
    _imgs = val;
    notifyListeners();
  }

  // 获取数据
  void loadData() async {
    var result = await Global().dio.get("zxw/Imgs");
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      setImgs(data['data']);
    } else {
      EasyLoading.showError(data['msg']);
    }
  }

  //上传图片
  void updateImage(dynamic da) async {
    var result = await Global().dio.post(
          "zxw/Imgs",
          data: da,
        );
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      EasyLoading.showSuccess(data['msg']);
      loadData();
    } else {
      EasyLoading.showError(data['msg']);
    }
  }

  // 删除某个图片
  void delete(String id) async {
    var result = await Global().dio.delete(
      "zxw/Imgs",
      data: {
        "id": id,
        // 'token': Global().token,
      },
    );
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      EasyLoading.showSuccess(data['msg']);
      loadData();
    } else {
      EasyLoading.showError(data['msg']);
    }
  }
}
