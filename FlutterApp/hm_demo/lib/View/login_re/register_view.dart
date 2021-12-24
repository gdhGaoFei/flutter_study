import 'package:flutter/material.dart';
import 'package:hm_demo/Untils/date_utils.dart';
import 'package:hm_demo/ViewModel/user/register_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:tdui/input/index.dart';
import 'package:tdui/tdui.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<RegisterViewModel>().initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("注册"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: TdForm(
            // boxBorder: false,
            children: [
              TdInput(
                label: "登录账号",
                hintText: "请输入登录账号",
                textInputAction: TextInputAction.next,
                clearable: true,
                onChange: (value) {
                  context.read<RegisterViewModel>().user = value;
                },
              ),
              // SizedBox(
              //   height: 16,
              // ),
              TdInput(
                label: "手机号码",
                hintText: "请输入手机号码",
                textInputAction: TextInputAction.send,
                type: TextInputType.number,
                footer: TdButton(
                  Text(
                    Provider.of<RegisterViewModel>(context).getCountDown,
                    style: TextStyle(
                      fontSize: 14,
                      // backgroundColor: Colors.green,
                    ),
                  ),
                  size: TdButtonSize.mini,
                  theme: TdButtonType.primary,
                  onClick: () {
                    context.read<RegisterViewModel>().load_sendMesCode();
                  },
                ),
                onChange: (value) {
                  context.read<RegisterViewModel>().phone = value;
                },
              ),
              TdInput(
                label: "验证码",
                hintText: "请输入验证码",
                type: TextInputType.number,
                textInputAction: TextInputAction.next,
                clearable: true,
                onChange: (value) {
                  context.read<RegisterViewModel>().code = value;
                },
              ),
              TdInput(
                label: "登录密码",
                hintText: "请输入登录密码",
                textInputAction: TextInputAction.next,
                clearable: true,
                obscureText: true,
                // autofocus: true,
                onChange: (value) {
                  context.read<RegisterViewModel>().pwd = value;
                },
              ),
              TdInput(
                label: "中文姓名",
                hintText: "请输入中文姓名",
                textInputAction: TextInputAction.next,
                footer: Row(
                  children: [
                    TdSwitch(
                      onChange: (checked) {
                        context.read<RegisterViewModel>().setSex(checked);
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(Provider.of<RegisterViewModel>(context).getSex
                        ? "女"
                        : "男"),
                  ],
                ),
                onChange: (value) {
                  context.read<RegisterViewModel>().cnUser = value;
                },
              ),
              // TdCell(label: "出生日期",footer: ,)
              TdCell(
                label: "出生日期",
                // hintText: "请选择出生日期",
                content: Provider.of<RegisterViewModel>(context).getDate,
                align: Alignment.center,
                footer: Row(
                  children: [
                    TdSwitch(
                      onChange: (checked) {
                        context.read<RegisterViewModel>().setDateStyle(checked);
                      },
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(Provider.of<RegisterViewModel>(context).getDateStyle
                        ? "阳历"
                        : "阴历"),
                  ],
                ),
                // textInputAction: TextInputAction.newline,
                onClick: _selectDate,
              ),

              Divider(
                height: 8,
                color: Colors.white,
              ),

              GestureDetector(
                child: Container(
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //     width: 0.0,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  child: Text(
                    "找回密码",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      // backgroundColor: Colors.white,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  width: double.infinity,
                  // height: 24,
                ),
                onTap: _retrieve_pwd_view,
              ),
              // TdCell(
              //   footer: Text(
              //     "找回密码",
              //     style: TextStyle(
              //       fontSize: 14,
              //       color: Colors.grey,
              //       // backgroundColor: Colors.white,
              //     ),
              //     textAlign: TextAlign.right,
              //   ),
              // ),
              Divider(
                height: 56,
                color: Colors.white,
              ),

              TdButton(
                Text("注册账号"),
                theme: TdButtonType.primary,
                onClick: () {
                  context.read<RegisterViewModel>().load_register();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 找回密码
  void _retrieve_pwd_view() {
    Navigator.of(context).pushNamed("retrieve_pwd_view");
  }

  // 选择日期
  void _selectDate() async {
    print("选择日期");
    var date = DateTime.now();
    var year = date.year - 18;
    var maxDate = DateTime(year, date.month, date.day);

    // initialDate初始化时间，通常情况下设置为当前时间。
    // firstDate 表示开始时间，设置后，选择器不能选择小于此值的时间。
    // lastDate 表示结束时间，设置后，选择器不能选择大于此值的时间
    // showDatePicker方法是Future方法，点击日期选择控件的“确定按钮后，返回选择的日期。
    var result = await showDatePicker(
      context: context,
      initialDate: maxDate,
      firstDate: DateTime(1900),
      lastDate: maxDate,
      // locale: Locale('ayx', 'ch'),
    );
    var ymd = getYYYYmmDD(result);
    context.read<RegisterViewModel>().setDate(ymd);

    // var controller = new CalendarController(
    //   // showMode: CalendarConstants.MODE_SHOW_ONLY_MONTH,
    //   // selectDateModel: DateModel.fromDateTime(dateTime),
    //   selectMode: CalendarSelectedMode.singleSelect,
    //   maxYear: year,
    // );
  }
}
