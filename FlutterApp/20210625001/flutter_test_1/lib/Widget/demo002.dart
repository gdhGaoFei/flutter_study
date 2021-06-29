import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "menu",
                  arguments: {"name": "路由的命名"},
                ).then((value) => print(value));
                // Navigator.of(context)
                //     .push(MaterialPageRoute(
                //       builder: (context) {
                //         return MenuPage();
                //         // return MenuPage(
                //         //   title: "菜单11333",
                //         // );
                //       },
                //       settings: RouteSettings(
                //         name: "1212",
                //         arguments: {
                //           "name": "哈哈哈就",
                //         },
                //       ),
                //       fullscreenDialog: false, //push：false或者present：true的样式
                //       maintainState: false, //维持状态
                //     ))
                //     .then((value) => print(value));
              },
              child: Text("登录"),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  // final String title;

  // const MenuPage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments
            .toString()), //Text(this.title + "." + arguments.toString()),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pop(
                  {"name": "返回值"},
                );
              },
              child: Text("返回"),
            ),
          ],
        ),
      ),
    );
  }
}
