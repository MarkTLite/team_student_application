import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EducationalForm extends StatefulWidget {
  EducationalForm({Key? key}) : super(key: key);

  @override
  State<EducationalForm> createState() => _EducationalFormState();
}

class _EducationalFormState extends State<EducationalForm> {
  final _educationalFormKey = GlobalKey<FormState>();
  String surname = '';
  String email = '';
  String highSchool = ''; //High School Attended
  String hsYear = ''; // HSC year
  String hsCombo = ''; // HSC combo
  String hsScore = ''; // HSC Score
  String secondarySch = ''; // Secondary School
  String secoYear = ''; // HSC year
  String sub1 = '';
  String sub2 = '';
  String sub3 = '';
  String sub4 = '';
  String sub5 = '';
  String sub6 = '';
  String sub7 = '';
  String sub8 = '';
  String sub9 = '';
  String sub10 = '';
  String sub11 = '';
  String sub22 = '';
  String sub33 = '';
  String sub44 = '';
  String sub55 = '';
  String sub66 = '';
  String sub77 = '';
  String sub88 = '';
  String sub99 = '';
  String sub1010 = '';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Form(
      key: _educationalFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: media.width * 0.4,
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
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
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Text("i) High School Attended :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
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
                    highSchool = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[a-zA-Z]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid school name';
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
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
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
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Text("Year :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
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
                    hsYear = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[0-9]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid year';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: media.width * 0.4,
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
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
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Text("Combination :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
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
                    hsCombo = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[a-zA-Z]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid combination';
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
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
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
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 2),
                      child: Text("SCORE :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              fontWeight: FontWeight.w400)),
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
                    hsScore = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[0-9]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid score';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30,
                width: media.width * 0.4,
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
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
                      child: Text("ii) Secondary School attended :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              wordSpacing: 3,
                              fontWeight: FontWeight.w700)),
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
                    secondarySch = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[a-zA-Z]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid school name';
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
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
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
                      child: Text("Year :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              wordSpacing: 3,
                              fontWeight: FontWeight.w400)),
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
                    secoYear = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[0-9]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid year';
                    else
                      return null;
                  },
                ),
              ),
            ],
          ),
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
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
                DataColumn(label: Container()),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text("SUBJECT",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700))),
                  DataCell(
                    Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey,
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (val) => setState(() {
                          sub1 = val.trim();
                        }),
                        validator: (emVal) {
                          String pattern = r"^[a-zA-Z]";
                          RegExp regex = RegExp(pattern);
                          if (emVal == null ||
                              emVal.isEmpty ||
                              !regex.hasMatch(emVal))
                            return 'subject code';
                          else
                            return null;
                        },
                      ),
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub2 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub3 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub4 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub5 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub6 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub7 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub8 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub9 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub10 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'subject code';
                        else
                          return null;
                      },
                    ),
                  ),
                ]),
                DataRow(cells: [
                  DataCell(Text("SCORE GRADE",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700))),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub11 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[0-9]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub22 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub33 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub44 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub55 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub66 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub77 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub88 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub99 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[0-9]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                  DataCell(
                    TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sub1010 = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[0-9]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'valid grade';
                        else
                          return null;
                      },
                    ),
                  ),
                ]),
              ]),
        ],
      ),
    );
  }
}
