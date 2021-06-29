// 第四章 - TableView 或 CollectionView
import 'package:flutter/material.dart';

class RowDemo extends StatelessWidget {
  //const RowDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表布局"),
      ),
      body: Container(
        child: WarpDemo(),

        // child: Flex(
        //   direction: Axis.vertical,
        //   children: [
        //     Expanded(
        //       child: Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.cyan,
        //       ),
        //       flex: 1,
        //     ),
        //     Expanded(
        //       child: Container(
        //         width: 200,
        //         height: 200,
        //         color: Colors.red,
        //       ),
        //       flex: 2,
        //     ),
        //     Expanded(
        //       child: Container(
        //         width: 100,
        //         height: 100,
        //         color: Colors.green,
        //       ),
        //       flex: 1,
        //     ),
        //   ],
        // ),

        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   // mainAxisSize: MainAxisSize.max,
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.green,
        //     ),
        //     Container(
        //       width: 200,
        //       height: 100,
        //       color: Colors.red,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.cyan,
        //     )
        //   ],
        // ),

        // child: Row(
        //   // mainAxisAlignment: MainAxisAlignment.end,
        //   // verticalDirection: VerticalDirection.up,
        //   // textDirection: TextDirection.rtl,
        //   children: [
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.green,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 100,
        //       color: Colors.red,
        //     ),
        //     Container(
        //       width: 100,
        //       height: 200,
        //       color: Colors.cyan,
        //     ),
        //   ],
        // ),
        color: Colors.grey,
      ),
    );
  }
}

class WarpDemo extends StatefulWidget {
  //const WarpDemo({ Key? key }) : super(key: key);

  @override
  _WarpDemoState createState() => _WarpDemoState();
}

class _WarpDemoState extends State<WarpDemo> {
  List<int> lists = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 20; i++) {
      lists.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      alignment: WrapAlignment.spaceEvenly,
      spacing: 1.0,
      runSpacing: 1.0,
      children: lists
          .map(
            (e) => Container(
              color: Colors.green,
              width: 100,
              height: 100,
              child: Text(
                e.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          )
          .toList(),
    );
  }
}
