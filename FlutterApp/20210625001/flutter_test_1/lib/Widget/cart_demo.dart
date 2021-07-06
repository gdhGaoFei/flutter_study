// 卡片的视图

import 'package:flutter/material.dart';

class CartViewDemo extends StatefulWidget {
  //const CartViewDemo({ Key? key }) : super(key: key);

  @override
  _CartViewDemoState createState() => _CartViewDemoState();
}

class _CartViewDemoState extends State<CartViewDemo> {
// 数据源表
  List<Map> _list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 1; i < 10; i++) {
      _list.add({
        "name": "n" * i,
        "age": i,
        "gender": i % 2 == 0 ? "男" : "女",
      });
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    Map item = _list[index];
    return Card(
      // child: Container(
      //   width: double.infinity,
      //   height: 200,
      // ),
      color: Colors.red, // 背景颜色
      shadowColor: Colors.green, //阴影的颜色
      elevation: 10, //阴影的大小
      borderOnForeground: false,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Text(
            item["name"],
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            item["age"].toString(),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart-卡片视图"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: _list
              .map(
                (e) => Column(
                  children: [
                    ListTile(
                      trailing: Icon(
                        Icons.pages,
                      ),
                      title: Text(
                        e["name"],
                      ),
                      leading: Icon(
                        Icons.ad_units,
                      ),
                      subtitle: Text(
                        e["age"].toString(),
                      ),
                      // isThreeLine: true,
                      tileColor: Colors.red,
                      // selected: true,
                      selectedTileColor: Colors.blue,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
              .toList(),
        ),

        // child: ListView.builder(
        //   itemBuilder: _itemBuilder,
        //   itemCount: _list.length,
        // ),

        // child: ListView(
        //   children: [
        //     Card(
        //       child: Container(
        //         width: double.infinity,
        //         height: 200,
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
