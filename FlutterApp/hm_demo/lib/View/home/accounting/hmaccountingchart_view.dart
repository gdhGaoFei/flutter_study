import 'package:flutter/material.dart';
import 'package:flutter_chart_csx/chart/bean/chart_bean_pie.dart';
import 'package:flutter_chart_csx/chart/view/chart_pie.dart';
import 'package:flutter_chart_csx/flutter_chart_csx.dart';
import 'package:hm_demo/base/view.dart';

class HMAccountingChartView extends StatefulWidget {
  const HMAccountingChartView({Key key}) : super(key: key);

  @override
  _HMAccountingChartViewState createState() => _HMAccountingChartViewState();
}

class _HMAccountingChartViewState extends State<HMAccountingChartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("图形报表"),
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        color: Colors.orangeAccent.withOpacity(0.6),
        clipBehavior: Clip.antiAlias,
        borderOnForeground: true,
        child: ChartPie(
          chartBeans: [
            ChartPieBean(
                type: '衣服',
                value: 180,
                color: Colors.blueGrey,
                assistTextStyle:
                    TextStyle(fontSize: 12, color: Colors.blueGrey)),
            ChartPieBean(
                type: '吃饭',
                value: 30,
                color: Colors.deepPurple,
                assistTextStyle:
                    TextStyle(fontSize: 12, color: Colors.deepPurple)),
            ChartPieBean(
                type: '游玩',
                value: 25,
                color: Colors.green,
                assistTextStyle: TextStyle(fontSize: 12, color: Colors.green)),
            ChartPieBean(
                type: '学习',
                value: 90,
                color: Colors.red,
                assistTextStyle: TextStyle(fontSize: 12, color: Colors.red))
          ],
          //辅助性文案显示的样式
          assistTextShowType: AssistTextShowType.NamePercentage,
          //开始画圆的位置（枚举）
          arrowBegainLocation: ArrowBegainLocation.Right,
          backgroundColor: Colors.white,
          assistBGColor: Color(0xFFF6F6F6),
          //辅助性百分比显示的小数位数,（饼状图还是真实的比例）
          decimalDigits: 2,
          //各个占比之间的分割线宽度，默认为0即不显示分割
          divisionWidth: .5,
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.width),
          // 圆盘的半径，设置太长会按照可承受（除去basebean的basepadding的限制之后）最小的宽或者高的长度的一半
          globalR: MediaQuery.of(context).size.width / 3,
          //中心的圆半径
          centerR: 2,
          centerColor: Colors.white,
          centerWidget: Text("支出占比"),
        ),
      ),
    );
  }
}
