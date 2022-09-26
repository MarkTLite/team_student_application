import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileTile extends StatefulWidget {
  Icon? leadingIcon;
  String title;
  String subtitle;
  Icon _editIcon = const Icon(Icons.edit);
  Widget subTitleWidget;
  final String fbKey;

  ProfileTile(BuildContext context,
      {Key? key,
      this.leadingIcon,
      required this.title,
      required this.subtitle,
      required this.subTitleWidget,
      required this.fbKey})
      : super(key: key);

  @override
  ProfileTileState createState() => ProfileTileState();
}

class ProfileTileState extends State<ProfileTile> {
  TextEditingController subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 15, 5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    width: 40,
                    height: 40,
                    child: widget.leadingIcon,
                  ))),
          Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontFamily: "Roboto",
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  widget.subTitleWidget
                ],
              )),
          Expanded(
            flex: 3,
            child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 20, 10),
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: IconButton(
                        padding: EdgeInsets.all(1),
                        icon: widget._editIcon,
                        onPressed: () {
                          setState(() {
                            if (widget._editIcon.icon != Icons.check) {
                              widget._editIcon = const Icon(Icons.check);
                              widget.subTitleWidget = TextField(
                                controller: subtitleController,
                                decoration: InputDecoration(
                                    fillColor: Colors.amber,
                                    prefixIcon: Icon(Icons.edit),
                                    hintText: 'Edit...'),
                              );

                              //
                            } else {
                              widget._editIcon = const Icon(Icons.edit);
                              widget.subtitle = subtitleController.text;
                              FirebaseFirestore.instance
                                  .collection('students')
                                  .doc(FirebaseAuth.instance.currentUser?.uid)
                                  .update({widget.fbKey: widget.subtitle}).then(
                                      (value) => print(
                                          "DocumentSnapshot successfully updated!"),
                                      onError: (e) =>
                                          print("Error updating document $e"));
                            }
                          });
                        }),
                  ),
                ])),
          ),
        ],
      ),
    );
  }
}
