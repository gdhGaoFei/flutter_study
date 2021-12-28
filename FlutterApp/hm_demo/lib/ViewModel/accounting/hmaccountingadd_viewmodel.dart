import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hm_demo/Global/Global.dart';
import 'package:hm_demo/Global/TMEventBusGlobal.dart';
import 'package:hm_demo/Untils/date_utils.dart';
import 'package:hm_demo/Untils/user_untils.dart';

class HMAccoutingAddViewModel extends ChangeNotifier {
  // 选择类型
  List<Map> _types = [
    {"name": "收入", "id": 0},
    {"name": "支出", "id": 1}
  ];
  //类型选中下标
  int _type = 0;
  //方式集合
  List _modes = [];
  //选中的方式对象
  var _mode;

  //
  List<Map> get getTypes {
    return _types;
  }

  int get getType {
    return _type;
  }

  void setType(int val) {
    _type = val;
    notifyListeners();
  }

  List get getModes {
    return _modes;
  }

  void setModes(List list) {
    _modes = list;
    notifyListeners();
  }

  Map get getMode {
    return _mode;
  }

  void setMode(Map mode) {
    _mode = mode;
    notifyListeners();
  }

  // 选择 -- 提交数据
  void getModeAndAlert() async {
    if (getModes != null && getModes.length > 0) {
      //如果数据不等于空则直接选择
      var val = await showObjectAlertDialog(getModes, "选择方式", "name");
      if (val != null && getMode != getModes[val]) {
        setMode(getModes[val]);
      }
      return;
    }

    // 选择的坐标
    var acId = _types[_type]["id"];
    // 请求网络 - 获取历史数据
    var result = await Global().dio.get(
      "zxw/AccountingType",
      queryParameters: {
        "action": acId,
      },
    );
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      _modes = data["data"];
      var val = await showObjectAlertDialog(getModes, "选择方式", "name");
      if (val != null && getMode != getModes[val]) {
        setMode(getModes[val]);
      }
    } else {
      EasyLoading.showError(data['msg']);
    }
  }

  // 添加一条数据
  void insert(String money, String desc) async {
    if (_mode == null) {
      EasyLoading.showError('请选择方式');
      return;
    }
    if (money.isEmpty) {
      EasyLoading.showError('请输入金额');
      return;
    }

    String uid = await getUserId();
    Map map = {
      "t_id": _mode["id"],
      "u_id": uid,
      "action": _type,
      "money": money,
      "desc": desc,
      "date": getYYYYmmDD(DateTime.now()),
    };
    // 转化成json字符串
    var params = json.encode(map);
    print(params);

    var result = await Global().dio.put(
      "zxw/AccountingHistory",
      queryParameters: {
        "json": params,
      },
    );
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      EasyLoading.showSuccess(data["msg"]);
      setMode(null);
      setType(0);
      // 发送给订阅着
      eventBus.fire(TMEventBusGlobal(TMEventBusStyle.accoutAdd));
    } else {
      EasyLoading.showError(data["msg"]);
    }
  }
}
