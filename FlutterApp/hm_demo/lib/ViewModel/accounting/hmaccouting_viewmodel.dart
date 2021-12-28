import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hm_demo/Global/Global.dart';

class HMAccoutingViewmodel extends ChangeNotifier {
  // 列表数据
  List _list = [];
  // 哪个月份
  int _month;
  //支出
  double _expenditure = 0;
  //收入
  double _income = 0;

  double get getExpenditure {
    return _expenditure;
  }

  void setExpenditure(double val) {
    _expenditure = val;
    notifyListeners();
  }

  double get getIncome {
    return _income;
  }

  void setIncome(double val) {
    _income = val;
    notifyListeners();
  }

  List get getList {
    return _list;
  }

  void setList(List list) {
    _list = list;
    notifyListeners();
  }

  int get getMonth {
    if (_month == null) {
      _month = DateTime.now().month;
    }
    return _month;
  }

  void setMonth(int month) {
    _month = month;
    notifyListeners();
  }

  // 请求网络获取历史数据
  void accountingHistory() async {
    var month1 = getMonth < 10 ? "0$getMonth" : getMonth.toString();
    var date = DateTime.now().year.toString() + month1;

    // 请求网络 - 获取历史数据
    var result = await Global().dio.get(
      "zxw/AccountingHistory",
      queryParameters: {
        "date": date,
      },
    );
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      setList(data["data"]["data"]);
      setExpenditure(data["data"]["expenditure"]);
      setExpenditure(data["data"]["income"]);
    } else {
      EasyLoading.showError(data['msg']);
    }
  }

  // 删除某个数据
  void delete(String id) async {
    var result = await Global().dio.delete(
      "zxw/AccountingHistory",
      queryParameters: {
        "id": id,
      },
    );
    // 解析数据
    dynamic data = result.data;
    var suc = data['success'];
    if (suc) {
      setList([]);
      accountingHistory();
    } else {
      EasyLoading.showError(data['msg']);
    }
  }
}
