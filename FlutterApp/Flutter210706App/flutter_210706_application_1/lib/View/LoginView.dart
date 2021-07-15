// 登录界面

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/Untils/rsa/rsa_utils.dart';
import 'package:flutter_210706_application_1/base/baseview.dart';
import 'package:flutter_210706_application_1/provider/Provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  //const LoginView({ Key? key }) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // 账号的 Controller
  TextEditingController _user;
  // 密码的 Controller
  TextEditingController _pwd;
  //焦点 用户名焦点
  FocusNode _userFn;
  // 焦点 密码的焦点
  FocusNode _pwdFn;
  // 焦点
  // FocusNode _focusNode = FocusNode();

  // 初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化
    _user = TextEditingController();
    _pwd = TextEditingController();
    _userFn = FocusNode();
    _pwdFn = FocusNode();

    // _focusNode.addListener(() {
    //   if (_focusNode.hasFocus) {
    //     //收回键盘
    //     FocusScope.of(context).requestFocus(_focusNode);
    //   }
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _user.dispose();
    _pwd.dispose();
    _userFn.dispose();
    _pwdFn.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBaseNavBar("登录"),
      // body: Center(
      //   child: Text(
      //     Provider.of<ProviderDemo>(context).count.toString(),
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              "images/main.jpg",
              width: double.infinity,
              height: 200,
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "账号",
                hintText: "请输入账号",
                prefixIcon: Icon(Icons.person),
              ),
              controller: _user,
              focusNode: _userFn,
              autofocus: true, // 主动获取焦点
              textInputAction: TextInputAction.next,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码",
                prefixIcon: Icon(Icons.lock),
              ),
              controller: _pwd,
              // autofocus: true,
              focusNode: _pwdFn,
              obscureText: true, // 显示 点
              textInputAction: TextInputAction.send,
              onSubmitted: (text) {
                print("密码的输入框" + text);
              },
            ),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              child: Container(
                child: Text(
                  "忘记密码?",
                  style: TextStyle(color: Colors.blue),
                  textAlign: TextAlign.right,
                ),
                width: double.infinity,
              ),
              onTap: () {
                setState(() {
                  print("object -- 忘记密码, 找回密码");
                });
              },
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _login,
                child: Text(
                  "登录",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _registered,
                child: Text(
                  "注册",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ProviderDemo provider = context.read<ProviderDemo>();
            provider.add();
            int index = provider.count;
            print(index.toString());
            if (index % 5 == 0) {
              provider.loginOrLogout();
              //Navigator.of(context).popAndPushNamed("tabbar");
            }
            testEncode();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // 加密参数测试
  void testEncode() async {
    var result = await encodeString("123456");
    print(result);
  }

  // 登录的方法
  void _login() async {
    // 判断用户
    if (_user == null || _user.text.isEmpty) {
      EasyLoading.showError("账号不能为空");
      _userFn.requestFocus(); //使其成为焦点
      return;
    }

    // 判断密码
    if (_pwd == null || _pwd.text.length < 6 || _pwd.text.length > 20) {
      EasyLoading.showError("密码必须为6-20位");
      _pwdFn.requestFocus();
      //_userFn.unfocus();//让其焦点消失
      return;
    }

    //用户名
    var userStr = _user.text;
    //密码
    var password = _pwd.text;
    print("用户名：" + userStr);
    print("\n\n\n");
    // print("密码：" + encodeString(password));
    print("密码：" + password);
  }

  // 注册的跳转
  void _registered() {
    _userFn.unfocus();
    _pwdFn.unfocus();
    Navigator.of(context).pushNamed("register");
  }
}
