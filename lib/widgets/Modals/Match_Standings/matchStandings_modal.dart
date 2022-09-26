import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../services/firestore_service.dart';
import '../Match_Scores/dropdown_widget.dart';
import 'standings_widget.dart';

class MatchStandingsModal extends StatefulWidget {
  MatchStandingsModal({Key? key}) : super(key: key);

  @override
  State<MatchStandingsModal> createState() => _MatchStandingsModalState();
}

class _MatchStandingsModalState extends State<MatchStandingsModal> {
  List dropdowns = [];
  List leagueTitles = [];
  String selectedId = 'Uganda';
  String selectedValue2 = 'UPL';
  String selectedValue = 'Soccer';

  List<DropdownMenuItem<String>> get dropdownItems {
    var categoryItems = dropdowns[1];
    List<DropdownMenuItem<String>> categoryItems1 = [];
    for (String element in categoryItems) {
      categoryItems1
          .add(DropdownMenuItem(child: Text(element), value: element));
    }
    return categoryItems1;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> titleItems1 = [];
    for (Map element in leagueTitles) {
      titleItems1.add(DropdownMenuItem(
          child: Text(element['title']), value: element['title']));
    }
    return titleItems1;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Uganda"), value: "Uganda"),
      DropdownMenuItem(child: Text("England"), value: "England"),
      DropdownMenuItem(child: Text("France"), value: "France"),
      DropdownMenuItem(child: Text("Germany"), value: "Germany"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: const Color.fromRGBO(184, 229, 255, 0.7),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: 450,
        height: 778,
        child: FutureBuilder(
            future: FireStoreService.getLeagueDropdowns(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                dropdowns = snapshot.data;
                return Form(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Match Standings",
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
                            width: 343,
                            changeVal: _changeVal,
                            dropDownItems: dropdownItems,
                            selectedValue: selectedValue,
                            title: 'Sports Category',
                            scenario: 1,
                          ),
                        ),
                        FutureBuilder(
                            future:
                                FireStoreService.getLeagueTitles(selectedValue),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                leagueTitles = snapshot.data;
                                return Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  child: DropDownWidget(
                                    width: 343,
                                    changeVal: _changeVal,
                                    dropDownItems: dropdownItems2,
                                    selectedValue: selectedValue2,
                                    title: 'League Title',
                                    scenario: 2,
                                  ),
                                );
                              } else {
                                return Center(
                                    child: CupertinoActivityIndicator());
                              }
                            }),
                        StandingsWidget(
                          selectedId: selectedId,
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
                                // if (_formKey.currentState!.validate()) {
                                //   showDialog(
                                //     context: context,
                                //     builder: (context) => Dialog(
                                //         backgroundColor: const Color(0xFF082D78),
                                //         child: Container(
                                //             height: 120,
                                //             width: 120,
                                //             child: Center(
                                //               child: Column(
                                //                   mainAxisAlignment:
                                //                       MainAxisAlignment.center,
                                //                   children: [
                                //                     CupertinoActivityIndicator(
                                //                         radius: 30,
                                //                         color: const Color(0xFFF03800)),
                                //                     Padding(
                                //                         padding: EdgeInsets.symmetric(
                                //                             vertical: 10)),
                                //                     Text(
                                //                       "Uploading Article",
                                //                       style: TextStyle(
                                //                           color: Colors.white,
                                //                           fontWeight: FontWeight.bold),
                                //                     )
                                //                   ]),
                                //             ))),
                                //   );
                                //   await updateFirebaseAdminArticles(RecentArticleModel(
                                //       image: articleImageURL,
                                //       category: selectedValue,
                                //       title: headline,
                                //       date: DateFormat.yMMMd().format(DateTime.now()),
                                //       summary: _articleDet));
                                //   Navigator.pop(context);
                                Navigator.pop(context);
                                // }
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
          break;
        case 2:
          selectedValue2 = newValue;
          selectedId = getSelectedId();
          break;

        default:
          break;
      }
    });
  }

  getSelectedId() {
    if (leagueTitles.isEmpty) {
      return '';
    }
    for (var element in leagueTitles) {
      if (element['title'] == selectedValue2) {
        return element['id'];
      }
    }
  }
}
