import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/Leagues/matchScores_model.dart';
import '../../../models/Leagues/scorer_model.dart';
import '../../../services/firestore_service.dart';
import 'dropdown_widget.dart';

class MatchScoresModal extends StatefulWidget {
  MatchScoresModal({Key? key}) : super(key: key);

  @override
  State<MatchScoresModal> createState() => _MatchScoresModalState();
}

class _MatchScoresModalState extends State<MatchScoresModal> {
  String articleImageURL = '';
  String articleImageUrl = '';
  String headline = '';
  bool _agreed = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _validate = '';
  String _imValidate = '';
  String selectedValue5 = '';
  String selectedValue6 = '';
  String selectedValue7 = '';
  String selectedValue2 = 'Soccer';
  String selectedValue4 = 'Rugby';
  String selectedId = '';
  String commitName = '';
  String commitName2 = '';
  late int goalMinute, foulMinute;
  String teamName = '';
  late String selectedValue3, selectedValue;
  bool usedInit = false;
  bool usedInit1 = false;
  bool usedInit2 = false;
  bool usedInit6 = false;
  bool usedInit7 = false;
  bool usedInit4 = false;
  bool usedInit5 = false;
  List dropdowns = [];
  List leagueTitles = [];
  List leagueTeamsData = [];
  List scoreList = [];
  List foulList = [];
  late int homeGoal, awayGoal;
  late ScorerModel scorer, fouler;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: const Color.fromRGBO(184, 229, 255, 0.7),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        width: 742,
        height: 648,
        child: FutureBuilder(
            future: FireStoreService.getLeagueDropdowns(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                dropdowns = snapshot.data;
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Match Scores",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    )),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                theme.errorColor),
                                        padding: MaterialStateProperty.all(
                                            EdgeInsets.symmetric(
                                                vertical: 20, horizontal: 10))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      // }
                                    },
                                    child: Text("X",
                                        style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                          fontSize: 17,
                                        )))
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: DropDownWidget(
                            title: 'Country',
                            changeVal: _changeVal,
                            dropDownItems: dropdownItems,
                            selectedValue: selectedValue,
                            width: 343,
                            scenario: 1,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: DropDownWidget(
                            width: 343,
                            title: 'Sports Category',
                            changeVal: _changeVal,
                            dropDownItems: dropdownItems2,
                            selectedValue: selectedValue2,
                            scenario: 2,
                          ),
                        ),
                        FutureBuilder(
                            future: FireStoreService.getLeagueTitles(
                                selectedValue2),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                leagueTitles = snapshot.data;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: DropDownWidget(
                                    width: 343,
                                    changeVal: _changeVal,
                                    dropDownItems: dropdownItems3,
                                    selectedValue: selectedValue3,
                                    title: 'League Title',
                                    scenario: 3,
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CupertinoActivityIndicator());
                              }
                            }),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 567,
                          height: 66,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Center(
                                        child: Text("Team Name",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ))),
                                  ),
                                  FutureBuilder(
                                      future:
                                          FireStoreService.getLeagueTeamsFuture(
                                              selectedId),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          leagueTeamsData = snapshot.data;
                                          if (!usedInit4) {
                                            selectedValue4 =
                                                leagueTeamsData[0]['name'];
                                          }
                                          return Container(
                                            width: 261,
                                            height: 38,
                                            margin: EdgeInsets.only(bottom: 30),
                                            child: DropDownWidget(
                                              width: 255,
                                              changeVal: _changeVal,
                                              dropDownItems: dropdownItems4,
                                              selectedValue: selectedValue4,
                                              title: '',
                                              scenario: 4,
                                            ),
                                          );
                                        } else {
                                          return Center(
                                              child:
                                                  CupertinoActivityIndicator());
                                        }
                                      }),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: Center(
                                        child: Text("Team Name",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ))),
                                  ),
                                  FutureBuilder(
                                      future:
                                          FireStoreService.getLeagueTeamsFuture(
                                              selectedId),
                                      builder: (BuildContext context,
                                          AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          leagueTeamsData = snapshot.data;
                                          if (!usedInit5) {
                                            selectedValue5 =
                                                leagueTeamsData[0]['name'];
                                          }
                                          return Container(
                                            width: 261,
                                            height: 38,
                                            margin: EdgeInsets.only(bottom: 30),
                                            child: DropDownWidget(
                                              width: 255,
                                              changeVal: _changeVal,
                                              dropDownItems: dropdownItems4,
                                              selectedValue: selectedValue5,
                                              title: '',
                                              scenario: 5,
                                            ),
                                          );
                                        } else {
                                          return Center(
                                              child:
                                                  CupertinoActivityIndicator());
                                        }
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text("Goals Scored",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              )),
                        ),
                        Container(
                          width: 222,
                          height: 38,
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Text(selectedValue4,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 40,
                                height: 38,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onChanged: ((value) => setState(() {
                                        homeGoal = int.parse(value);
                                      })),
                                  validator: (value) {
                                    String pattern = r"^[0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    homeGoal = int.parse(value!);
                                    if (value.isEmpty ||
                                        homeGoal > 15 ||
                                        homeGoal < 0 ||
                                        !regExp.hasMatch(value)) {
                                      return "invalid value";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 0),
                                  child: Text(selectedValue5,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ))),
                              Container(
                                width: 40,
                                height: 38,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 0),
                                color: Colors.white,
                                child: TextFormField(
                                  style: TextStyle(color: Colors.black),
                                  onChanged: ((value) => setState(() {
                                        awayGoal = int.parse(value);
                                      })),
                                  validator: (value) {
                                    String pattern = r"^[0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    awayGoal = int.parse(value!);
                                    if (value.isEmpty ||
                                        awayGoal > 15 ||
                                        awayGoal < 0 ||
                                        !regExp.hasMatch(value)) {
                                      return "invalid value";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(left: 10),
                                    labelStyle: TextStyle(color: Colors.black),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: 20 + (scoreList.length * 20),
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                                itemCount: scoreList.length,
                                itemBuilder: ((context, index) {
                                  return Text(
                                      "${index + 1}. ${scoreList[index]['team']} - ${scoreList[index]['name']} - ${scoreList[index]['minute']}' ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ));
                                }))),
                        Container(
                          width: 692,
                          height: 38,
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              FutureBuilder(
                                  future: FireStoreService.getLeagueTeamsFuture(
                                      selectedId),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (!usedInit6) {
                                        selectedValue6 = selectedValue4;
                                      }
                                      return DropDownWidget(
                                        width: 205,
                                        changeVal: _changeVal,
                                        dropDownItems: dropdownItems5,
                                        selectedValue: selectedValue6,
                                        title: 'Team',
                                        scenario: 6,
                                      );
                                    } else {
                                      return Center(
                                          child: CupertinoActivityIndicator());
                                    }
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Player's Name",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 205,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      commitName = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Minute",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 80,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      goalMinute = int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  scorer = ScorerModel(
                                      name: commitName,
                                      team: selectedValue6,
                                      minute: goalMinute);
                                  setState(() {
                                    scoreList.add(scorer.toJson());
                                  });

                                  print(scoreList);
                                },
                                icon: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: theme.primaryColor,
                                          width: 3,
                                        )),
                                    child: Icon(Icons.add,
                                        color: theme.primaryColor)),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Text("Cards/Fouls",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ))),
                        Container(
                            height: 20 + (foulList.length * 20),
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                                itemCount: foulList.length,
                                itemBuilder: ((context, index) {
                                  return Text(
                                      "${index + 1}. ${foulList[index]['team']} - ${foulList[index]['name']} - ${foulList[index]['minute']}' ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ));
                                }))),
                        Container(
                          width: 692,
                          height: 38,
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              FutureBuilder(
                                  future: FireStoreService.getLeagueTeamsFuture(
                                      selectedId),
                                  builder: (BuildContext context,
                                      AsyncSnapshot snapshot) {
                                    if (snapshot.hasData) {
                                      if (!usedInit7) {
                                        selectedValue7 = selectedValue5;
                                      }
                                      return DropDownWidget(
                                        width: 205,
                                        changeVal: _changeVal,
                                        dropDownItems: dropdownItems5,
                                        selectedValue: selectedValue7,
                                        title: 'Team',
                                        scenario: 7,
                                      );
                                    } else {
                                      return Center(
                                          child: CupertinoActivityIndicator());
                                    }
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Player's Name",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 205,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      commitName2 = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Minute",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 80,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      foulMinute = int.parse(value);
                                    });
                                  },
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  fouler = ScorerModel(
                                      name: commitName2,
                                      team: selectedValue7,
                                      minute: foulMinute);
                                  setState(() {
                                    foulList.add(fouler.toJson());
                                  });
                                },
                                icon: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(
                                          color: theme.primaryColor,
                                          width: 3,
                                        )),
                                    child: Icon(Icons.add,
                                        color: theme.primaryColor)),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      theme.primaryColor),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 50))),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  final scoresModel = MatchScoresModel(
                                      awayScore: awayGoal,
                                      awayTeam: selectedValue5,
                                      category: selectedValue2,
                                      country: selectedValue,
                                      foulsList: foulList,
                                      homeScore: homeGoal,
                                      homeTeam: selectedValue4,
                                      leagueTitle: selectedValue3,
                                      scoresList: scoreList);
                                  //print(scoresModel.toJson());
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                        backgroundColor:
                                            const Color(0xFF082D78),
                                        child: Container(
                                            height: 120,
                                            width: 120,
                                            child: Center(
                                              child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    CupertinoActivityIndicator(
                                                        radius: 30,
                                                        color: const Color(
                                                            0xFFF03800)),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10)),
                                                    Text(
                                                      "Uploading Scores Sheet",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                            ))),
                                  );
                                  // await FireStoreService
                                  //     .updateFirebaseAdminScores(scoresModel);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
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
                      ],
                    ),
                  ),
                );
              } else {
                return Center(
                    child: CupertinoActivityIndicator(
                  color: theme.primaryColor,
                  radius: 50,
                ));
              }
            }),
      ),
    );
  }

  void _changeVal(String newValue, int scenario) {
    setState(() {
      switch (scenario) {
        case 1:
          selectedValue = newValue;
          usedInit1 = true;
          break;
        case 2:
          selectedValue2 = newValue;
          usedInit2 = true;
          break;
        case 3:
          selectedValue3 = newValue;
          selectedId = getSelectedId();
          usedInit = true;
          break;
        case 4:
          selectedValue4 = newValue;
          usedInit4 = true;
          break;
        case 5:
          selectedValue5 = newValue;
          usedInit5 = true;
          break;
        case 6:
          selectedValue6 = newValue;
          usedInit6 = true;
          break;
        case 7:
          selectedValue7 = newValue;
          usedInit7 = true;
          break;
        default:
          break;
      }
    });
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    var countryItems = dropdowns[0]; //countries list
    if (!usedInit1) {
      selectedValue = countryItems[0];
    }
    List<DropdownMenuItem<String>> countryItems1 = [];
    for (String element in countryItems) {
      countryItems1.add(DropdownMenuItem(child: Text(element), value: element));
    }
    return countryItems1;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    var categoryItems = dropdowns[1]; //categories list
    if (!usedInit2) {
      selectedValue2 = categoryItems[0];
    }
    List<DropdownMenuItem<String>> categoryItems1 = [];
    for (String element in categoryItems) {
      categoryItems1
          .add(DropdownMenuItem(child: Text(element), value: element));
    }
    return categoryItems1;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    if (!usedInit) {
      selectedValue3 = leagueTitles[0]['title'];
    }
    List<DropdownMenuItem<String>> titleItems = [];
    for (String element in leagueTitles.map((e) => e['title']).toList()) {
      titleItems.add(DropdownMenuItem(child: Text(element), value: element));
    }
    return titleItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems4 {
    // if (!usedInit4) {
    //   selectedValue4 = leagueTeams[0];
    // }
    List<DropdownMenuItem<String>> teamItems = [];
    for (String element in leagueTeamsData.map((e) => e['name']).toList()) {
      teamItems.add(DropdownMenuItem(child: Text(element), value: element));
    }
    return teamItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems5 {
    // if (!usedInit4) {
    //   selectedValue4 = leagueTeams[0];
    // }
    List<DropdownMenuItem<String>> teamItems = [];
    for (String element in [selectedValue4, selectedValue5]) {
      teamItems.add(DropdownMenuItem(child: Text(element), value: element));
    }
    return teamItems;
  }

  getSelectedId() {
    if (leagueTitles.isEmpty) {
      return '';
    }
    for (var element in leagueTitles) {
      if (element['title'] == selectedValue3) {
        return element['id'];
      }
    }
  }
}
