import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AcadRegForm extends StatefulWidget {
  AcadRegForm({Key? key}) : super(key: key);

  @override
  State<AcadRegForm> createState() => _AcadRegFormState();
}

class _AcadRegFormState extends State<AcadRegForm> {
  final _AcadRegFormKey = GlobalKey<FormState>();
  String surname = '';
  String email = '';
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Form(
      key: _AcadRegFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          DataTable(
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
                DataColumn(label: Container(width: media.width * 0.1)),
                DataColumn(label: Container(width: media.width * 0.2)),
                DataColumn(label: Container(width: media.width * 0.1)),
                DataColumn(label: Container(width: media.width * 0.2)),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("ACCEPTED",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700))),
                  DataCell(Container()),
                  DataCell(Text("REJECTED",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700))),
                  DataCell(Container()),
                ]),
              ]),
          Container(
            height: 30,
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: const BoxDecoration(
              // color: Color(0x486598C7),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(0),
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Open Sans',
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                // hintText: "Input your full name",
                // labelText: "SURNAME",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 2),
                  child: Text("Approving Official Name:    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.black, style: BorderStyle.solid),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      BorderSide(color: Colors.black, style: BorderStyle.solid),
                ),
              ),
              onChanged: (val) => setState(() {
                surname = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid surname';
                else
                  return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: media.width * 0.4,
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: const BoxDecoration(
                  // color: Color(0x486598C7),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                // padding: const EdgeInsets.only(
                //   top: 15,
                //   left: 15,
                // ),
                child: TextFormField(
                  scrollPadding: EdgeInsets.all(0),
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Open Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    // hintText: "Input your full name",
                    // labelText: "SURNAME",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Text("SIGNATURE :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                  onChanged: (val) => setState(() {
                    surname = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[a-zA-Z]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid surname';
                    else
                      return null;
                  },
                ),
              ),
              Container(
                height: 30,
                width: media.width * 0.3,
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: const BoxDecoration(
                  // color: Color(0x486598C7),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                // padding: const EdgeInsets.only(
                //   top: 15,
                //   left: 15,
                // ),
                child: TextFormField(
                  scrollPadding: EdgeInsets.all(0),
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Open Sans',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    // hintText: "Input your full name",
                    // labelText: "SURNAME",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Text("DATE :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: Colors.black, style: BorderStyle.solid),
                    ),
                  ),
                  onChanged: (val) => setState(() {
                    surname = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[a-zA-Z]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid surname';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
