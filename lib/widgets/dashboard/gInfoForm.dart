import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GInfoForm extends StatefulWidget {
  GInfoForm({Key? key}) : super(key: key);

  @override
  State<GInfoForm> createState() => _GInfoFormState();
}

class _GInfoFormState extends State<GInfoForm> {
  final _gInfoFormKey = GlobalKey<FormState>();
  String surname = '';
  String email = '';
  String othernames = '';
  DateTime? _selectedDate; //DOB
  bool g1 = false; //gender
  bool g2 = false;
  String marryStatus = '';
  String nationality = '';
  String distOfOrigin = '';
  String disability = '';
  String address = '';
  String post = ''; // P.O.Box
  String town = ''; // TOWN/city
  String country = ''; //Country
  String mobile = ''; //Mobile/Tel
  String officeLine = '';
  String homeTel = ''; //home Tel
  String faxNo = '';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Form(
      key: _gInfoFormKey,
      child: ListView(
        shrinkWrap: true,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 30,
            margin: const EdgeInsets.only(top: 8, bottom: 5),
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
                // hintText: "Input your name",
                // labelText: "SURNAME",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8, left: 2),
                  child: Text("SURNAME :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
          Container(
            height: 30,
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
                  child: Text("OTHER NAMES :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                othernames = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter valid names with alphabets';
                else
                  return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  // color: theme.primaryColor,
                  height: 40,
                  width: media.width * 0.2,
                  child: Text("GENDER: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
              Container(
                // color: theme.primaryColor,
                height: 40,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: media.width * 0.1,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("MALE",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          // color: Colors.,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(1)),
                      child: !g2
                          ? Checkbox(
                              value: g1,
                              onChanged: (value) {
                                setState(() {
                                  g1 = g1 ? false : true;
                                });
                              })
                          : Container(
                              color: Colors.grey,
                              child: Center(child: Text("N/A"))))
                ]),
              ),
              Container(
                // color: theme.primaryColor,
                alignment: Alignment.centerLeft,
                height: 40,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: media.width * 0.3,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("FEMALE: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          // color: Colors.,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(1)),
                      child: !g1
                          ? Checkbox(
                              value: g2,
                              onChanged: (value) {
                                setState(() {
                                  g2 = g2 ? false : true;
                                });
                              })
                          : Container(
                              color: Colors.grey,
                              child: Center(child: Text("N/A"))))
                ]),
              ),
            ],
          ),
          Container(
            height: 30,
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
                  child: Text("MARITAL STATUS :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                marryStatus = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid marital status';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("NATIONALITY :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                nationality = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid nationality';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("DISTRICT OF ORIGIN :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                distOfOrigin = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid district';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("ANY FORM OF DISABILITY (IF ANY) :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                disability = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid disability';
                else
                  return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  // color: theme.primaryColor,
                  height: 60,
                  width: media.width * 0.2,
                  child: Text("DATE OF BIRTH: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
              Container(
                // color: theme.primaryColor,
                height: 60,
                padding: EdgeInsets.only(top: 0, left: 10, right: 10),
                width: media.width * 0.3,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 30,
                          width: media.width * 0.3,
                          decoration: BoxDecoration(
                              // color: Colors.,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1)),
                          child: TextButton(
                              onPressed: () => _presentDatePicker(1),
                              child: Text(_selectedDate == null
                                  ? 'Chose Date of Birth'
                                  : '${DateFormat.yMd().format(_selectedDate!)}'))),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text("MONTH DAY YEAR",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ]),
              ),
              Container(
                // color: theme.primaryColor,
                height: 50,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: media.width * 0.2,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text("Date: ",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                      height: 30,
                      // width: 40,
                      decoration: BoxDecoration(
                          // color: Colors.,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(1)),
                      child: Checkbox(value: false, onChanged: (value) {}))
                ]),
              ),
            ],
          ),
          Container(
            height: 30,
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
                  child: Text("ADDRESS :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                address = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z0-9]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid address';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("P.O BOX :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                post = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z0-9]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid p.o box';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("TOWN/CITY :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                town = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid town/city';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("COUNTRY :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                country = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid country';
                else
                  return null;
              },
            ),
          ),
          Container(
            height: 30,
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
                  child: Text("MOBILE/TEL :    ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          wordSpacing: 3,
                          fontWeight: FontWeight.w700)),
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
                mobile = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[0-9]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid mobile number';
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
                      child: Text("OFFICE LINE :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14,
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
                    officeLine = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[0-9]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid office line';
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
                      child: Text("HOME TEL :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14,
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
                    homeTel = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[0-9]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid home number';
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
                      child: Text("FAX NO :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14,
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
                    faxNo = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[0-9]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid Fax Number';
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
                      child: Text("EMAIL :    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 14,
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
                    email = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern =
                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                        r"{0,253}[a-zA-Z0-9])?)*$";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid email address';
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

  void _presentDatePicker(int scenario) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1940),
            lastDate:
                DateTime(int.parse(DateFormat.y().format(DateTime.now())) - 12))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        switch (scenario) {
          case 1:
            _selectedDate = pickedDate;
            break;
          default:
            break;
        }
      });
    });
  }
}
