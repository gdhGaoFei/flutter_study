// 全局变量 - Provider

import 'package:flutter/material.dart';
import 'package:flutter_test_1/Performance/p_countProvider.dart';
import 'package:provider/provider.dart';

class POProviderDemo extends StatefulWidget {
  //const POProviderDemo({ Key? key }) : super(key: key);

  @override
  _POProviderDemoState createState() => _POProviderDemoState();
}

class _POProviderDemoState extends State<POProviderDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider-全局变量"),
      ),
      body: Column(
        children: [
          Text(
            Provider.of<CountProvider>(context).count.toString(),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) {
              //     return POTestProviderDemo();
              //   }),
              // );
              Navigator.of(context).pushNamed("provider2");
            },
            child: Text("跳转"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_box),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}

class POTestProviderDemo extends StatelessWidget {
  //const POTestProviderDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试 全局状态变量-Provider"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.label_important_outlined),
        onPressed: () {
          context.read<CountProvider>().add();
        },
      ),
    );
  }
}
