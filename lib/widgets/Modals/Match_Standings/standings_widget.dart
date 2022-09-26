import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/firestore_service.dart';
import '../../../utils/string_consts.dart';
import 'standingsEditor_modal.dart';

class StandingsWidget extends StatelessWidget {
  final String selectedId;
  StandingsWidget({Key? key, required this.selectedId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: 500,
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(35.0),
                child: Container(
                    child: Column(children: [
                  Container(
                      height: 34,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    '#',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Text(
                                    'Team',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'P',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'W',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'L',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Gd',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    'Pts',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 1),
                            width: 500,
                            height: 1.5,
                            color: theme.primaryColor,
                          ),
                        ],
                      ))
                ]))),
            body: StreamBuilder<DocumentSnapshot>(
                stream: FireStoreService.getLeagueTeams(selectedId),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List teams = snapshot.data?.get('teams') as List;
                    return Container(
                        height: 470,
                        child: ListView.builder(
                            itemCount: teams.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.all(3),
                            itemBuilder: (BuildContext context, int index) {
                              return TextButton(
                                onPressed: () {
                                  _showStandingEditorModal(
                                      index, context, teams, selectedId);
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 55,
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: decideColor(index + 1)),
                                  child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${index + 1}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: SvgPicture.asset(
                                                  StringConsts
                                                      .articleModalImages[0])),
                                          Expanded(
                                              flex: 5,
                                              child: Text(
                                                "     " + teams[index]['name'],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${teams[index]['P']}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${teams[index]['W']}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${teams[index]['L']}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${teams[index]['Gd']}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                          Expanded(
                                              flex: 1,
                                              child: Text(
                                                '${teams[index]['Pts']}',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              )),
                                        ],
                                      )),
                                ),
                              );
                            }));
                  } else {
                    return Center(
                        child: Column(
                      children: [
                        Text("Choose the league title again"),
                        CupertinoActivityIndicator(
                          radius: 20,
                          color: theme.primaryColor,
                        ),
                      ],
                    ));
                  }
                })));
  }

  void _showStandingEditorModal(
      int index, BuildContext context, List teams, String selectedId) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StandingEditorModal(
          index: index,
          teams: teams,
          selectedId: selectedId,
        );
      },
    );
  }
}

Color decideColor(int index) {
  if (index <= 3) {
    return Color(0XFF14274C);
  } else if ((index > 3) && (index <= 5)) {
    return Color(0XFF441818);
  } else {
    return Color(0XFF181829);
  }
}
