// 登录界面

import 'package:flutter/material.dart';
import 'package:flutter_210706_application_1/provider/Provider.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  //const LoginView({ Key? key }) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          Provider.of<ProviderDemo>(context).count.toString(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            context.read<ProviderDemo>().add();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
