// 注册的界面

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';
import 'package:weui/weui.dart';

class RegisteredView extends StatefulWidget {
  //const RegisteredView({ Key? key }) : super(key: key);

  @override
  _RegisteredViewState createState() => _RegisteredViewState();
}

class _RegisteredViewState extends State<RegisteredView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("注册"),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: WeForm(
          children: [
            WeInput(
              label: "登录账号",
              hintText: "请输入登录账号",
              clearable: true,
              textInputAction: TextInputAction.next,
            ),
            WeInput(
              label: "手机号码",
              hintText: "请输入手机号码",
              clearable: true,
              textInputAction: TextInputAction.next,
            ),
            WeInput(
              label: "验证码",
              hintText: "请输入验证码",
              textInputAction: TextInputAction.next,
              footer: WeButton(
                Text("获取验证码"),
                theme: WeButtonType.primary,
                size: WeButtonSize.mini,
              ),
            ),
            WeInput(
              label: "登录密码",
              hintText: "请输入登录密码",
              textInputAction: TextInputAction.next,
              obscureText: true,
              clearable: true,
            ),
            WeInput(
              label: "中文姓名",
              hintText: "请输入中文姓名",
              // clearable: true,
              textInputAction: TextInputAction.next,
              footer: Row(
                children: [
                  WeSwitch(),
                  SizedBox(
                    width: 8,
                  ),
                  Text("男"),
                ],
              ),
            ),
            WeCell(
              label: "出生年月",
              content: "222222。2222.2.2",
              align: Alignment(-0.5, 0),
              footer: Row(
                children: [
                  WeSwitch(),
                  SizedBox(
                    width: 8,
                  ),
                  Text("阴历"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: WeButton(
                Text("注册"),
                theme: WeButtonType.warn,
                size: WeButtonSize.acquiescent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
