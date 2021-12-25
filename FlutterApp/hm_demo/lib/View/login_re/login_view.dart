import 'package:flutter/material.dart';
import 'package:hm_demo/Untils/user_untils.dart';
import 'package:hm_demo/ViewModel/user/login_viewmodel.dart';
import 'package:hm_demo/base/view.dart';
import 'package:provider/provider.dart';
import 'package:tdui/form/index.dart';
import 'package:tdui/input/index.dart';
import 'package:tdui/tdui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar("登录"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Column(
            children: [
              Image.asset(
                "images/main.jpg",
                width: double.infinity,
                height: 286.h,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 16.h,
              ),
              TdForm(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: "账号",
                      hintText: "请输入账号",
                      prefixIcon: Icon(Icons.person),
                      suffixIcon: IconButton(
                        onPressed: () {
                          context.read<LoginViewModel>().getUser.clear();
                        },
                        icon: Icon(Icons.close),
                      ),
                      // border: OutlineInputBorder(),
                    ),
                    controller: Provider.of<LoginViewModel>(context).getUser,
                    // autofocus: true,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(),
                  ),
                  // TdInput(
                  //   label: '账号',
                  //   hintText: "请输入账号",
                  //   defaultValue: Provider.of<LoginViewModel>(context).getUser,
                  //   clearable: true,
                  //   textInputAction: TextInputAction.next,
                  //   onChange: (value) {
                  //     context.read<LoginViewModel>().setUser(value);
                  //   },
                  // ),
                  TdInput(
                    label: "密码",
                    hintText: "请输入密码",
                    obscureText: true,
                    clearable: true,
                    height: 64.h,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      _login();
                    },
                    onChange: (value) {
                      context.read<LoginViewModel>().pwd = value;
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              GestureDetector(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "找回密码",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                onTap: _retrieve_pwd_view,
              ),
              SizedBox(
                height: 16.h,
              ),
              TdButton(
                "登录",
                theme: TdButtonType.primary,
                onClick: _login,
                loading: Provider.of<LoginViewModel>(context).getIsLogin,
              ),
              SizedBox(
                height: 16.h,
              ),
              TdButton(
                "注册",
                theme: TdButtonType.primary,
                onClick: _register,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // test();
    // 初始化
    initData();
  }

  // 初始化数据
  void initData() async {
    bool login = await isLogin();
    if (login) {
      loginSuccess();
      context.read<LoginViewModel>().zxw_user_token();
    }
  }

  // 登录
  void _login() {
    context.read<LoginViewModel>().load_denglu();
  }

  // 注册
  void _register() async {
    var params = await Navigator.of(context).pushNamed("register");
    if (params != null) {
      context.read<LoginViewModel>().getUser.text = params as String;
    }
  }

  // 找回密码
  void _retrieve_pwd_view() {
    Navigator.pushNamed(context, "retrieve_pwd_view");
  }
}
