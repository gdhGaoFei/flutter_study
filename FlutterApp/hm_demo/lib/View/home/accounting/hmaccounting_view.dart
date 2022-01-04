import 'package:flutter/material.dart';
import 'package:hm_demo/Untils/date_utils.dart';
import 'package:hm_demo/ViewModel/accounting/hmaccouting_viewmodel.dart';
import 'package:hm_demo/ViewModel/main/hmtabbar_viewmodel.dart';
import 'package:left_scroll_actions/cupertinoLeftScroll.dart';
import 'package:left_scroll_actions/global/actionListener.dart';
import 'package:left_scroll_actions/left_scroll_actions.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HMAccoutingView extends StatefulWidget {
  const HMAccoutingView({Key key}) : super(key: key);

  @override
  _HMAccoutingViewState createState() => _HMAccoutingViewState();
}

class _HMAccoutingViewState extends State<HMAccoutingView> {
  // 初始化状态时调用
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 监听
    if (context.read<HMAccoutingViewmodel>().getList.length <= 0) {
      loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    HMAccoutingViewmodel vm = Provider.of<HMAccoutingViewmodel>(context);
    return Scaffold(
      // appBar: getAppBar("记账"),
      appBar: AppBar(
        title: Text('记账'),
        centerTitle: true,
        elevation: 10,
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        DateTime.now().year.toString() + "年",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "本月预算",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "收入",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "支出",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        child: Text(
                          Provider.of<HMAccoutingViewmodel>(context)
                                  .getMonth
                                  .toString() +
                              "月",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        onTap: _getMonth,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Provider.of<HMTabbarViewModel>(context).getMaxMoney,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Provider.of<HMAccoutingViewmodel>(context)
                            .getIncome
                            .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        Provider.of<HMAccoutingViewmodel>(context)
                            .getExpenditure
                            .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(56.h),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "accouting/chart");
            },
            icon: Icon(Icons.pie_chart),
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: _itemBuilderList,
        itemCount: vm.getList == null ? 0 : vm.getList.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("accouting/add");
        },
      ),
    );
  }

  // 加载数据
  void loadData() async {
    HMAccoutingViewmodel vm = context.read<HMAccoutingViewmodel>();
    // 设置为空
    if (vm.getList.length > 0) {
      vm.setList([]);
    }
    // 重新加载
    vm.accountingHistory();
  }

  // 获取能选择的月份
  void _getMonth() async {
    // 保存能选择的月份
    List list = [];
    // 遍历
    var maxMonth = DateTime.now().month;
    for (var i = 1; i <= maxMonth; i++) {
      list.add(i);
    }
    // 显示alert
    var result = await showMonthList(list);
    if (result != null) {
      context.read<HMAccoutingViewmodel>().setMonth(result);
      loadData();
    }
  }

  // 底部的Cell 列表
  Widget _itemBuilderList(BuildContext context, int index) {
    HMAccoutingViewmodel vm = Provider.of<HMAccoutingViewmodel>(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  vm.getList[index]["date"],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Text(
                "收入:" + vm.getList[index]["income"].toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(width: 8.w),
              Text(
                "支出:" + vm.getList[index]["expenditure"].toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
        Divider(height: 1),
        Column(
          children: _childrens(vm.getList[index]["data"]),
        ),
      ],
    );
  }

  // 返回 子视图 列表
  List<Widget> _childrens(dynamic datas) {
    List<Widget> widgets = [];
    for (var i = 0; i < datas.length; i++) {
      widgets.add(
        Container(height: 4.h),
      );

      // 是否是收入
      bool isSr = datas[i]["type"]["action"] == 0;
      // money
      String mon = datas[i]["money"].toString();
      mon = isSr ? mon : "-$mon";

      widgets.add(
        CupertinoLeftScroll(
          key: Key(i.toString()),
          closeTag: LeftScrollCloseTag('tag - TODO: your tag'),
          child: Padding(
            padding: EdgeInsets.all(10.w),
            child: Row(
              children: [
                Icon(isSr ? Icons.add : Icons.money_off),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(isSr ? "收入" : "支出"),
                      Text(
                        "描述：" + datas[i]["desc"],
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(mon),
              ],
            ),
          ),
          buttons: [
            LeftScrollItem(
              text: '删除',
              color: Colors.red,
              onTap: () {
                context
                    .read<HMAccoutingViewmodel>()
                    .delete(datas[i]["id"].toString());
              },
            ),
          ],
        ),
      );
      widgets.add(Container(height: 4.h));
    }
    return widgets;
  }
}
