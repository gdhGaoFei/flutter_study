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
        child: BoxContainerDemo(),

        //child: AlignDemo(),

        // child: StackDemo(),

        // child: WarpDemo(),

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
        // color: Colors.grey,
      ),
    );
  }
}

/// 尺寸限制容器
class BoxContainerDemo extends StatelessWidget {
  //const BoxContainerDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 装饰器 可以在其子组件绘制前(或后)绘制一些装饰（Decoration），如背景、边框、渐变
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.amber,
          gradient: LinearGradient(
            colors: [
              Colors.red,
              Colors.green,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 50,
              offset: Offset(5, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 100,
            top: 20,
            right: 100,
            bottom: 20,
          ),
          child: Text(
            "注册",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

    // SizedBox() 指定父类的宽高即是父类的宽高，否则则是自己的宽高
    // return SizedBox(
    //   width: 20,
    //   height: 40,
    //   child: Container(
    //     color: Colors.black,
    //     width: 100,
    //     height: 100,
    //   ),
    // );

    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //     maxHeight: 400,
    //     maxWidth: 400,
    //     minHeight: 100,
    //     minWidth: 100,
    //   ),
    //   child: Container(
    //     width: 150,
    //     height: 20,
    //     color: Colors.amber,
    //   ),
    // );
  }
}

///Align 相对布局
class AlignDemo extends StatelessWidget {
  //const AlignDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50), //外边距
      padding: EdgeInsets.all(50), //内边距
      width: 300,
      height: 300,
      color: Colors.amberAccent,
      child: Align(
        alignment: Alignment(1, -1),
        child: FlutterLogo(
          size: 64,
        ),
      ),
    );
  }
}

///Stack 层叠布局
class StackDemo extends StatelessWidget {
  //const StackDemo({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            width: 100,
            height: 100,
            color: Colors.green,
          ),
          Container(
            width: 50,
            height: 100,
            color: Colors.red,
          ),
          Positioned(
            width: 300,
            child: Container(
              color: Colors.yellow,
            ),
            top: 10,
            left: 10,
            // right: 10,
            bottom: 10,
          ),
        ],
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
