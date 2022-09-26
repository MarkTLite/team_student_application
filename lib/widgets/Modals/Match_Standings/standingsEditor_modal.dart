import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/firestore_service.dart';
import '../../../utils/string_consts.dart';

class StandingEditorModal extends StatefulWidget {
  final List teams;
  final int index;
  final String selectedId;
  StandingEditorModal(
      {Key? key,
      required this.index,
      required this.teams,
      required this.selectedId})
      : super(key: key);

  @override
  State<StandingEditorModal> createState() => _StandingEditorModalState();
}

class _StandingEditorModalState extends State<StandingEditorModal> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _formVal = "";
  late int gd, pts, played, lost, won;
  late Map initMap, finalMap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    initMap = widget.teams[widget.index];
    return Dialog(
      child: Container(
        width: 450,
        height: _formVal.isEmpty ? 155 : 170,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Container(
            child: Column(children: [
          Container(
              height: 27,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(theme.errorColor),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10))),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text("X")),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Text(
                            '#',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                      Expanded(
                          flex: 6,
                          child: Text(
                            'Team',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'P',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'W',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'L',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Gd',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                      Expanded(
                          flex: 1,
                          child: Text(
                            'Pts',
                            style: TextStyle(color: theme.primaryColor),
                          )),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 1),
                    width: double.infinity,
                    height: 1.5,
                    color: theme.primaryColor,
                  ),
                ],
              )),
          Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(2),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          '${widget.index + 1}',
                          style: TextStyle(color: theme.primaryColor),
                        )),
                    Expanded(
                        flex: 1,
                        child: SvgPicture.asset(
                            StringConsts.articleModalImages[0])),
                    Expanded(
                        flex: 5,
                        child: Text(
                          "     " + widget.teams[widget.index]['name'],
                          style: TextStyle(color: theme.primaryColor),
                        )),
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            const pattern = r"^[0-9]";
                            RegExp regExp = RegExp(pattern);
                            if (!regExp.hasMatch(value!)) {
                              _formVal = "Input correct values";
                              return _formVal;
                            }
                            return null;
                          },
                          onChanged: (score) {
                            played = int.parse(score);
                          },
                          decoration: InputDecoration(
                            hintText: '${widget.teams[widget.index]['P']}',
                          ),
                          style: TextStyle(color: theme.primaryColor),
                        )),
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            final pattern = r"^[0-9]";
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty || !regExp.hasMatch(value)) {
                              _formVal = "Input correct values";
                              return _formVal;
                            }
                            return null;
                          },
                          onChanged: (score) {
                            won = int.parse(score);
                          },
                          decoration: InputDecoration(
                            hintText: '${widget.teams[widget.index]['W']}',
                          ),
                          style: TextStyle(color: theme.primaryColor),
                        )),
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            final pattern = r"^[0-9]";
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty || !regExp.hasMatch(value)) {
                              _formVal = "Input correct values";
                              return _formVal;
                            }
                            return null;
                          },
                          onChanged: (score) {
                            lost = int.parse(score);
                          },
                          decoration: InputDecoration(
                            hintText: '${widget.teams[widget.index]['L']}',
                          ),
                          style: TextStyle(color: theme.primaryColor),
                        )),
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            final pattern = r"^[0-9]";
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty) {
                              _formVal = "Input correct values";
                              return _formVal;
                            }
                            return null;
                          },
                          onChanged: (score) {
                            if (score.contains('-')) {
                              var y = score.split('-');
                              gd = 0 - int.parse(y[1]);
                              return;
                            }
                            //gd = int.parse(score);
                          },
                          decoration: InputDecoration(
                            hintText: '${widget.teams[widget.index]['Gd']}',
                          ),
                          style: TextStyle(color: theme.primaryColor),
                        )),
                    Expanded(
                        flex: 1,
                        child: TextFormField(
                          validator: (value) {
                            final pattern = r"^[0-9]";
                            RegExp regExp = RegExp(pattern);
                            if (value!.isEmpty || !regExp.hasMatch(value)) {
                              _formVal = "Input correct values";
                              return _formVal;
                            }
                            return null;
                          },
                          onChanged: (score) {
                            pts = int.parse(score);
                          },
                          decoration: InputDecoration(
                            hintText: '${widget.teams[widget.index]['Pts']}',
                          ),
                          style: TextStyle(color: theme.primaryColor),
                        )),
                  ],
                )),
          ),
          Container(
            margin: EdgeInsets.only(top: 1),
            width: double.infinity,
            height: 1.5,
            color: theme.primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: _formVal.isEmpty ? 23 : 10,
            ),
            child: _formVal.isEmpty
                ? null
                : Text(_formVal, style: TextStyle(color: theme.errorColor)),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(theme.primaryColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 50))),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    finalMap = {
                      'id': widget.teams[widget.index]['id'],
                      'name': widget.teams[widget.index]['name'],
                      'logo': widget.teams[widget.index]['logo'],
                      "Gd": gd,
                      "L": lost,
                      "P": played,
                      "Pts": pts,
                      "W": won,
                    };
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                          backgroundColor: const Color(0xFF082D78),
                          child: Container(
                              height: 120,
                              width: 120,
                              child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CupertinoActivityIndicator(
                                          radius: 30,
                                          color: const Color(0xFFF03800)),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10)),
                                      Text(
                                        "Updating",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]),
                              ))),
                    );
                    await FireStoreService.updateFirebaseAdminStandings(
                        initMap, finalMap, widget.selectedId);
                    Navigator.pop(context);
                    Navigator.pop(context);
                  } else {
                    setState(() {
                      _formVal = "Input Correct values";
                    });
                  }
                },
                child: Text("Submit",
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 15,
                    ))),
          ),
        ])),
      ),
    );
  }
}
