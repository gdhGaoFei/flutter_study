import 'package:flutter/material.dart';
import 'package:hm_demo/Global/TMEventBusGlobal.dart';
import 'package:hm_demo/Untils/date_utils.dart';
import 'package:hm_demo/ViewModel/accounting/hmaccountingadd_viewmodel.dart';
import 'package:hm_demo/ViewModel/accounting/hmaccouting_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';

class HMAccoutingAddView extends StatefulWidget {
  const HMAccoutingAddView({Key key}) : super(key: key);

  @override
  _HMAccoutingAddViewState createState() => _HMAccoutingAddViewState();
}

class _HMAccoutingAddViewState extends State<HMAccoutingAddView> {
  // 钱数 的输入文本 Controller
  TextEditingController _money;
  // 描述 的输入文本 Controller
  TextEditingController _desc;

  // 进行初始化
  @override
  void initState() {
    _money = TextEditingController();
    _desc = TextEditingController();
    eventBus.on<TMEventBusGlobal>().listen((event) {
      context.read<HMAccoutingViewmodel>().accountingHistory();
      setState(() {
        _money.text = "";
        _desc.text = "";
      });
    });
    super.initState();
  }

  // 页面销毁时 调用 销毁 释放资源
  @override
  void dispose() {
    _money.dispose();
    _desc.dispose();
    //取消订阅
    // eventBus.destroy();
    super.dispose();
    print('销毁了=======');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("新增记账"),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text("类型"),
              trailing: Text(
                  Provider.of<HMAccoutingAddViewModel>(context).getTypes[
                          Provider.of<HMAccoutingAddViewModel>(context).getType]
                      ["name"]),
              onTap: _showTypesAlert,
            ),
            Divider(height: 1),
            ListTile(
              title: Text("方式"),
              trailing: Text(
                  Provider.of<HMAccoutingAddViewModel>(context).getMode == null
                      ? ""
                      : Provider.of<HMAccoutingAddViewModel>(context)
                          .getMode["name"]),
              onTap: _accountingType,
            ),
            Divider(height: 1),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入金额",
                ),
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                autofocus: true,
                controller: _money,
              ),
            ),
            Divider(height: 1),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "请输入备注",
                ),
                textInputAction: TextInputAction.send,
                controller: _desc,
              ),
            ),
            Divider(height: 1),
            SizedBox(height: 16),
            Container(
              height: 44,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10, right: 10),
              child: ElevatedButton(
                onPressed: _submit,
                child: Text("新增"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 展示alert
  void _showTypesAlert() async {
    var result = await showObjectAlertDialog(
        context.read<HMAccoutingAddViewModel>().getTypes, "选择类型", "name");
    print(result.toString() + "选择类型 ========= ");
    if (result != null &&
        result != context.read<HMAccoutingAddViewModel>().getType) {
      context.read<HMAccoutingAddViewModel>().setMode(null);
      context.read<HMAccoutingAddViewModel>().setType(result);
    }
  }

  // 选择方式
  void _accountingType() async {
    context.read<HMAccoutingAddViewModel>().getModeAndAlert();
  }

  // 新增确定按钮
  void _submit() async {
    context.read<HMAccoutingAddViewModel>().insert(_money.text, _desc.text);
  }
}
