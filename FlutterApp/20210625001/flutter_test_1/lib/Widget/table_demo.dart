// 表格 table

import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  //const TableDemo({ Key? key }) : super(key: key);

  @override
  _TableDemoState createState() => _TableDemoState();
}

class _TableDemoState extends State<TableDemo> {
//数据源
  List<Map> _list = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化数据源
    for (var i = 0; i < 20; i++) {
      _list.add({
        "name": "姓名$i",
        "gender": i % 2 == 0 ? "男" : "女",
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("表格-Table"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        // child: Table(
        //   border: TableBorder.all(
        //     width: 1.0,
        //     color: Colors.grey,
        //     // style: BorderStyle.solid,
        //   ),
        //   children: _list
        //       .map(
        //         (e) => TableRow(
        //           children: [
        //             Text(e["name"]),
        //             Text(e["gender"]),
        //           ],
        //         ),
        //       )
        //       .toList(),
        // ),
        child: DataTable(
          columns: [
            DataColumn(
              label: Text("姓名"),
            ),
            DataColumn(
              label: Text("性别"),
            ),
          ],
          rows: _list
              .map(
                (e) => DataRow(
                  cells: [
                    DataCell(
                      Text(e["name"]),
                    ),
                    DataCell(
                      Text(e["gender"]),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
