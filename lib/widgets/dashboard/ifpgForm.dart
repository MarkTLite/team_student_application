import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IPGForm extends StatefulWidget {
  IPGForm({Key? key}) : super(key: key);

  @override
  State<IPGForm> createState() => _IPGFormState();
}

class _IPGFormState extends State<IPGForm> {
  final _IPGFormKey = GlobalKey<FormState>();
  String surname = '';
  String email = '';
  String f1 = '';
  String f2 = '';
  String f3 = '';
  String f4 = '';
  String f5 = '';
  String f6 = '';
  String f7 = '';
  String f8 = '';
  String f9 = '';
  String f10 = '';
  String m1 = '';
  String m2 = '';
  String m3 = '';
  String m4 = '';
  String m5 = '';
  String m6 = '';
  String m7 = '';
  String m8 = '';
  String m9 = '';
  String m10 = '';
  String gu1 = '';
  String gu2 = '';
  String gu3 = '';
  String gu4 = '';
  String gu5 = '';
  String gu6 = '';
  String gu7 = '';
  String gu8 = '';
  String gu9 = '';
  String gu10 = '';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Form(
      key: _IPGFormKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: media.width * 0.15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Surnames in Full",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Other Names",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Date of Birth",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Village",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Sub County",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("District of Birth",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Nationality",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Country of Residence",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Occupation",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
                Text("Contact / Tel No:",
                    style: const TextStyle(
                        // color: Colors.white,
                        fontFamily: 'Open Sans',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 3)),
              ],
            ),
          ),
          Container(
            width: media.width * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Father"),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f1 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid name';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f2 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter valid names';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f3 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid date of birth';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f4 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid village';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f5 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid subcounty';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f6 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid district';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f7 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid nationality';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f8 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid country';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f9 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid occupation';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      f10 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid contact';
                      else
                        return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: media.width * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Mother"),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m1 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid name';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m2 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter valid names';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m3 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid date of birth';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m4 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid village';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m5 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid subcounty';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m6 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid district';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m7 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid nationality';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m8 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid country';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m9 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid occupation';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      m10 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid contact';
                      else
                        return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: media.width * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Guardian"),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu1 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid name';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu2 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter valid names';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu3 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid date of birth';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu4 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid village';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu5 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid subcounty';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu6 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid district';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu7 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid nationality';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu8 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid country';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu9 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[a-zA-Z]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid occupation';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
                  height: 30,
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  child: TextFormField(
                    style: const TextStyle(
                      // color: Colors.white,
                      fontFamily: 'Open Sans',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    onChanged: (val) => setState(() {
                      gu10 = val.trim();
                    }),
                    validator: (emVal) {
                      String pattern = r"^[0-9]";
                      RegExp regex = RegExp(pattern);
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid contact';
                      else
                        return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
