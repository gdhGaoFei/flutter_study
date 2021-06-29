import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//表单
class InputDemo extends StatefulWidget {
  //const InputDemo({ Key? key }) : super(key: key);

  @override
  _InputDemoState createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  ///全局的key - 对应的是哪个输入框
  GlobalKey _key = GlobalKey<FormState>();

  ///账号的 TextEditingController
  TextEditingController _controllerZh = TextEditingController();
  // 密码的
  TextEditingController _controllerPwd = TextEditingController();

  ///焦点
  // 用户
  FocusNode _user = FocusNode();
  // 密码的
  FocusNode _pwd = FocusNode();

  FocusScopeNode _focusScopeNode;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controllerPwd.dispose();
    _controllerZh.dispose();
    _user.dispose();
    _pwd.dispose();
    if (_focusScopeNode != null) {
      _focusScopeNode.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          print("object==========");
          if (_focusScopeNode == null) {
            _focusScopeNode = FocusScope.of(context);
          }
          _focusScopeNode.unfocus();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white, //为啥必须设置颜色？
          child: Form(
            key: _key,
            // autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  focusNode: _user,
                  controller: _controllerZh,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) {
                      return "用户名不能为空";
                    }
                  },
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (v) {
                    print("object" + v);
                  },
                ),
                TextFormField(
                  focusNode: _pwd,
                  controller: _controllerPwd,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (v) {
                    if (v == null || v.length < 6) {
                      return "密码不得小于6位";
                    }
                  },
                  obscureText: true,
                  textInputAction: TextInputAction.send,
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_focusScopeNode == null) {
                      _focusScopeNode = FocusScope.of(context);
                    }
                    _focusScopeNode.unfocus(); //失去所有的焦点
                    _focusScopeNode.requestFocus(_user); //使得某个焦点活跃
                    bool value = (_key.currentState as FormState).validate();
                    if (value) {
                      print(_controllerZh.text);
                      print("密码是" + _controllerPwd.text);
                    }
                  },
                  child: Text("提交"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

///点击事件
class GesClickDemo extends StatelessWidget {
  //const GesClickDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("单击事件");
      },
      onDoubleTap: () {
        print("双加事件");
      },
      onLongPress: () {
        print("长按事件");
      },
      child: Text("点击事件尝试"),
    );
  }
}

///加载进度条
class ProgressDemo extends StatelessWidget {
  //const ProgressDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(
            value: 0.5,
            // backgroundColor: Colors.red,
            valueColor: AlwaysStoppedAnimation(Colors.black),
            semanticsLabel: "线性指示器",
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              value: 0.8,
              valueColor: AlwaysStoppedAnimation(Colors.black12),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CupertinoActivityIndicator(),
          SizedBox(
            height: 20,
          ),
          // CupertinoActionSheetAction(
          //   onPressed: () {},
          //   child: Column(
          //     children: [
          //       Text("asds1"),
          //       Text("asds1"),
          //       Text("asds1"),
          //       Text("asds1"),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

/// 文本的Widget
class TextDemo extends StatelessWidget {
  //const TextDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      width: double.infinity,
      child: Text(
        "测试文本Demo",
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}

///按钮的Widget
class ButtonDemo extends StatelessWidget {
  //const ButtonDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {},
          child: Text("点击-漂浮按钮-RaisedButton"),
        ),
        FlatButton(
          onPressed: () {},
          child: Text("点击-扁平按钮-FlatButton"),
        ),
        FlatButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text("扁平按钮带图片"),
          color: Colors.green,
          textColor: Colors.white,
          highlightColor: Colors.red,
        ),
        OutlineButton(
          onPressed: () {},
          child: Text("OutlineButton"),
        ),
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
      ],
    );
  }
}

///图片相关的
class ImageIconDemo extends StatelessWidget {
  //const ImageIconDemo({ Key? key }) :// super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.read_more),
        IconButton(
          icon: Icon(Icons.adb),
          onPressed: () {},
          // iconSize: 20,
        ),
        Container(
          child: Image.network(
            "https://img1.baidu.com/it/u=1361135963,570304265&fm=26&fmt=auto&gp=0.jpg",
            fit: BoxFit.fill,
            height: 120,
          ),
        ),
        Image.asset(
          "images/test1111.jpeg",
          height: 200,
        ),
      ],
    );
  }
}

///开关按钮
class SwitchDemo extends StatefulWidget {
  //const SwitchDemo({ Key? key }) : super(key: key);

  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  ///复选框
  bool _check = false;

  ///开关按钮
  bool _switch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Checkbox(
          value: _check,
          onChanged: (v) {
            setState(() {
              _check = v;
            });
          },
        ),
        Switch(
            value: _switch,
            onChanged: (v) {
              setState(() {
                _switch = v;
              });
            }),
      ],
    );
  }
}
