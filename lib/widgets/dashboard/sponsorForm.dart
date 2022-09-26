import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SponsorshipForm extends StatefulWidget {
  SponsorshipForm({Key? key}) : super(key: key);

  @override
  State<SponsorshipForm> createState() => _SponsorshipFormState();
}

class _SponsorshipFormState extends State<SponsorshipForm> {
  final _SponsorshipFormKey = GlobalKey<FormState>();
  String sponsor = '';
  String org = '';
  String tel = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Form(
      key: _SponsorshipFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 20,
            width: media.width,
            margin: const EdgeInsets.only(top: 5, bottom: 5),
            decoration: const BoxDecoration(
              // color: Color(0x486598C7),
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
                  child: Text("Name of Sponsor :    ",
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
                sponsor = val.trim();
              }),
              validator: (emVal) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid name';
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
                width: media.width * 0.2,
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
                      child: Text("Organization:   ",
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
                    org = val.trim();
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
                width: media.width * 0.2,
                margin: const EdgeInsets.only(top: 5, bottom: 5),
                decoration: const BoxDecoration(
                  // color: Color(0x486598C7),
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
                      child: Text("Address:    ",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontSize: 12,
                              wordSpacing: 3,
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
                    address = val.trim();
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
                width: media.width * 0.2,
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
                      child: Text("Tel:    ",
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
                    tel = val.trim();
                  }),
                  validator: (emVal) {
                    String pattern = r"^[a-zA-Z]";
                    RegExp regex = RegExp(pattern);
                    if (emVal == null ||
                        emVal.isEmpty ||
                        !regex.hasMatch(emVal))
                      return 'Enter a valid tel number';
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
