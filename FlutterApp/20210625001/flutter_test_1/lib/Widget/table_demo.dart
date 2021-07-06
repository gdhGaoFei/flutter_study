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
  // 排序 ColumnIndex
  int _columnIndex = 0;
  // 升序还是降序
  bool _sortAscending = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 初始化数据源
    for (var i = 1; i < 10; i++) {
      _list.add({
        "name": "a" * i,
        "gender": i % 2 == 0 ? "男" : "女",
        "select": false,
        "age": i,
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
          // onSelectAll: (value) {
          //   setState(() {
          //     for (var i = 0; i < _list.length; i++) {
          //       if (_list[i]["select"] != value) {
          //         _list[i]["select"] = value;
          //       }
          //     }
          //   });
          // },
          sortColumnIndex: _columnIndex,
          sortAscending: _sortAscending,

          columns: [
            DataColumn(
              label: Text("姓名"),
              onSort: (columnIndex, ascending) {
                setState(() {
                  _columnIndex = columnIndex;
                  _sortAscending = ascending;

                  _list.sort((a, b) {
                    if (!ascending) {
                      var c = a;
                      a = b;
                      b = c;
                    }
                    return a["name"]
                        .toString()
                        .length
                        .compareTo(b["name"].toString().length);
                  });
                });
              },
            ),
            DataColumn(
              label: Text("年龄"),
              onSort: (columnIndex, ascending) {
                setState(() {
                  _columnIndex = columnIndex;
                  _sortAscending = ascending;

                  _list.sort((a, b) {
                    if (!ascending) {
                      var c = a;
                      a = b;
                      b = c;
                    }
                    return a["age"].compareTo(b["age"]);
                  });
                });
              },
            ),
            DataColumn(
              label: Text("性别"),
            ),
          ],
          rows: _list
              .map(
                (e) => DataRow(
                  selected: e["select"],
                  onSelectChanged: (value) {
                    setState(() {
                      if (e["select"] != value) {
                        e["select"] = value;
                      }
                    });
                  },
                  cells: [
                    DataCell(
                      Text(
                        e["name"],
                      ),
                    ),
                    DataCell(
                      Text(
                        e["age"].toString(),
                      ),
                    ),
                    DataCell(
                      Text(
                        e["gender"],
                      ),
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
