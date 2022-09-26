import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryTable extends StatefulWidget {
  List<String> coursesList;
  HistoryTable({required this.coursesList});

  @override
  State<HistoryTable> createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  late List<bool> col1, col2, col3;
  late List<DataRow> rows;
  String choice1 = '';
  String choice2 = '';
  String choice3 = '';

  @override
  void initState() {
    col1 = List.generate(widget.coursesList.length, (index) => false,
        growable: false);
    col2 = List.generate(widget.coursesList.length, (index) => false,
        growable: false);
    col3 = List.generate(widget.coursesList.length, (index) => false,
        growable: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DataTable(
          dataRowHeight: 40,
          border: TableBorder(
              horizontalInside: BorderSide(color: Colors.black),
              verticalInside: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(2),
              top: BorderSide(
                color: Colors.black,
              ),
              bottom: BorderSide(
                color: Colors.black,
              ),
              left: BorderSide(
                color: Colors.black,
              ),
              right: BorderSide(
                color: Colors.black,
              )),
          columns: [
            DataColumn(
                label: Container(
                    width: 450,
                    child: Text("Choice of Programmes applied for: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)))),
            DataColumn(
                label: Container(
                    width: 70,
                    child: Text("1st Choice",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)))),
            DataColumn(
                label: Container(
                    width: 70,
                    child: Text("2nd Choice",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)))),
            DataColumn(
                label: Container(
                    width: 70,
                    child: Text("3rd Choice",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)))),
          ],
          rows: [
            ...generateRows()
          ]),
    );
  }

  List<DataRow> generateRows() {
    rows = List.generate(widget.coursesList.length, (index) {
      return DataRow(cells: [
        DataCell(Text(widget.coursesList[index])),
        DataCell((!col1.contains(true) || col1[index])
            ? Checkbox(
                value: col1[index],
                onChanged: (val) {
                  setState(() {
                    col1[index] = val!;
                  });
                  if (col1[index]) {
                    choice1 = widget.coursesList[index];
                  }
                })
            : Container(
                child: Text("N/A"),
                color: Colors.grey,
              )),
        DataCell((!col2.contains(true) || col2[index])
            ? Checkbox(
                value: col2[index],
                onChanged: (val) {
                  setState(() {
                    col2[index] = val!;
                  });
                  if (col2[index]) {
                    choice2 = widget.coursesList[index];
                  }
                })
            : Container(
                child: Text("N/A"),
                color: Colors.grey,
              )),
        DataCell((!col3.contains(true) || col3[index])
            ? Checkbox(
                value: col3[index],
                onChanged: (val) {
                  setState(() {
                    col3[index] = val!;
                  });
                  if (col3[index]) {
                    choice3 = widget.coursesList[index];
                  }
                })
            : Container(
                child: Text("N/A"),
                color: Colors.grey,
              )),
      ]);
    }, growable: false);
    return rows;
  }
}
