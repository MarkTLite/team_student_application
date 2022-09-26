import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../../models/Leagues/league_model.dart';
import '../../../models/Leagues/mgtMember_model.dart';
import '../../../models/Leagues/team_model.dart';
import '../../../services/firestore_service.dart';
import '../../../utils/string_consts.dart';
import '../../profile_widget.dart';
import '../Match_Scores/dropdown_widget.dart';

class LeagueRegModal extends StatefulWidget {
  LeagueRegModal({Key? key}) : super(key: key);

  @override
  State<LeagueRegModal> createState() => _LeagueRegModalState();
}

class _LeagueRegModalState extends State<LeagueRegModal> {
  String selectedValue3 = "President";
  String selectedValue2 = "Soccer";
  String selectedValue = "Uganda";
  late String leagueTitle, leagueSponsor;
  String imageURL = '';
  String _imValidate = '';
  String _dateValidate = '';
  String teamImageURL = '';
  String _teamImValidate = '';
  String imageUrl = '';
  String commitName = '';
  String commitContact = '';
  String teamName = '';
  late MgtMemberModel member;
  late TeamModel member2;
  List mgtList = [];
  List<Map<String, dynamic>> mgtList2 = [];
  List dropdowns = [];
  DateTime? _selectedDate, _selectedDate2;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems {
    var countryItems = dropdowns[0]; //countries list
    List<DropdownMenuItem<String>> countryItems1 = [];
    for (String element in countryItems) {
      countryItems1.add(DropdownMenuItem(child: Text(element), value: element));
    }
    return countryItems1;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    var categoryItems = dropdowns[1]; //categories list
    List<DropdownMenuItem<String>> categoryItems1 = [];
    for (String element in categoryItems) {
      categoryItems1
          .add(DropdownMenuItem(child: Text(element), value: element));
    }
    return categoryItems1;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    var positionItems = dropdowns[2];
    List<DropdownMenuItem<String>> positionItems1 = [];
    for (String element in positionItems) {
      positionItems1
          .add(DropdownMenuItem(child: Text(element), value: element));
    }
    return positionItems1;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: const Color.fromRGBO(184, 229, 255, 0.7),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        width: 760,
        height: 906,
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
                                Text("League Registration",
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
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 423,
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0),
                                child: Text("League Title",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 280,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  validator: (value) {
                                    String pattern = r"^[a-zA-Z0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.isEmpty ||
                                        !regExp.hasMatch(value)) {
                                      return "Enter a valid league title";
                                    }
                                    leagueTitle = value;
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText:
                                        'For Example, Uganda Premier League',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 423,
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Sponsor",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 305,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  validator: (value) {
                                    String pattern = r"^[a-zA-Z0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.isEmpty ||
                                        !regExp.hasMatch(value)) {
                                      return "Enter a valid sponsor";
                                    }
                                    leagueSponsor = value;
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'For Example, Tag Fan Fun Ltd.',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1),
                                      borderRadius: BorderRadius.circular(1),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 418,
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0),
                                child: Text("Duration",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 140,
                                height: 38,
                                child: FormField(validator: (value) {
                                  if (_selectedDate == null ||
                                      _selectedDate2 == null) {
                                    setState(() {
                                      _dateValidate = "Add Dates";
                                    });
                                    return "Add Dates";
                                  }
                                }, builder: (context) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("From",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                          )),
                                      Container(
                                          width: 105,
                                          height: 38,
                                          color: Colors.white,
                                          child: TextButton(
                                              onPressed: () =>
                                                  _presentDatePicker(1),
                                              child: Text(_selectedDate == null
                                                  ? 'Chose Date'
                                                  : '${DateFormat.yMd().format(_selectedDate!)}'))),
                                    ],
                                  );
                                }),
                              ),
                              Container(
                                width: 140,
                                height: 38,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("To",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w300,
                                          fontSize: 15,
                                        )),
                                    Container(
                                        width: 105,
                                        height: 38,
                                        color: Colors.white,
                                        child: TextButton(
                                            onPressed: () =>
                                                _presentDatePicker(2),
                                            child: Text(_selectedDate2 == null
                                                ? 'Chose Date'
                                                : '${DateFormat.yMd().format(_selectedDate2!)}'))),
                                    _dateValidate.isEmpty
                                        ? Container()
                                        : Text(
                                            _dateValidate,
                                            style: TextStyle(
                                                color: theme.errorColor),
                                          )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          width: 470,
                          height: 38,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 0),
                                child: Text("League Logo",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              FormField(validator: (value) {
                                if (imageURL.isEmpty) {
                                  setState(() {
                                    _imValidate = "Add an image";
                                  });
                                  return "Add an image";
                                }
                                return null;
                              }, builder: (FormFieldState<dynamic> field) {
                                return Container(
                                    width: 305,
                                    height: 38,
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        IconButton(
                                          padding: EdgeInsets.all(5),
                                          onPressed: () =>
                                              getImage(1), //widget.uploader(),
                                          icon: Row(children: [
                                            SvgPicture.asset(StringConsts
                                                .articleModalImages[0]),
                                            const Text("Upload Image")
                                          ]),
                                        ),
                                        _imValidate.isEmpty
                                            ? Container()
                                            : Text(
                                                _imValidate,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )
                                      ],
                                    ));
                              }),
                              imageURL.isNotEmpty
                                  ? ProfileImageWidget(
                                      imagePath: imageURL,
                                      imageUploader: getImage,
                                      width: 20,
                                      height: 20,
                                      avatarClass: "league",
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text("League Management Committe/Body",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              )),
                        ),
                        Container(
                            height: 30 + (mgtList.length * 20),
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                                itemCount: mgtList.length,
                                itemBuilder: ((context, index) {
                                  return Text(
                                      "${index + 1}. ${mgtList[index]['position']} - ${mgtList[index]['name']} - ${mgtList[index]['phone']} ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ));
                                }))),
                        Container(
                          width: 710,
                          height: 38,
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              DropDownWidget(
                                title: 'Position',
                                width: 220,
                                changeVal: _changeVal,
                                dropDownItems: dropdownItems3,
                                selectedValue: selectedValue3,
                                scenario: 3,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Full Name",
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
                                  validator: (val) {
                                    String pattern = r"^[a-zA-Z0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    if (val!.isEmpty || !regExp.hasMatch(val)) {
                                      return "Enter a valid name";
                                    }
                                    return null;
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
                                child: Text("Contact",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                width: 100,
                                height: 38,
                                color: Colors.white,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      commitContact = value;
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  validator: (val) {
                                    String pattern = r"^[0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    if (val!.isEmpty || !regExp.hasMatch(val)) {
                                      return "Valid contact!";
                                    }
                                    return null;
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
                                  member = MgtMemberModel(
                                      name: commitName,
                                      phone: commitContact,
                                      position: selectedValue3);
                                  setState(() {
                                    mgtList.add(member.toJson());
                                  });

                                  print(mgtList);
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
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text("Teams",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                              )),
                        ),
                        Container(
                            height: 20 + (mgtList2.length * 20),
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ListView.builder(
                                itemCount: mgtList2.length,
                                itemBuilder: ((context, index) {
                                  return Text(
                                      "${index + 1}. ${mgtList2[index]['name']}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 15,
                                      ));
                                }))),
                        Container(
                          width: 560,
                          height: 38,
                          margin: EdgeInsets.only(bottom: 30),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 5),
                                child: Text("Full Name",
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
                                      teamName = value;
                                    });
                                  },
                                  validator: (val) {
                                    String pattern = r"^[a-zA-Z0-9]";
                                    RegExp regExp = RegExp(pattern);
                                    if (val!.isEmpty || !regExp.hasMatch(val)) {
                                      return "Enter a valid name";
                                    }
                                    return null;
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
                                    vertical: 10.0, horizontal: 0),
                                child: Text("Club Logo",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15,
                                    )),
                              ),
                              Container(
                                  width: 145,
                                  height: 38,
                                  color: Colors.white,
                                  child: IconButton(
                                    padding: EdgeInsets.all(5),
                                    onPressed: () => getImage(2),
                                    icon: Row(children: [
                                      SvgPicture.asset(
                                          StringConsts.articleModalImages[0]),
                                      const Text("Upload Image")
                                    ]),
                                  )),
                              IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  if (teamImageURL.isEmpty) {
                                    Fluttertoast.showToast(
                                        timeInSecForIosWeb: 2,
                                        webBgColor:
                                            "linear-gradient(to right, #021660, #021660)",
                                        textColor: Colors.white,
                                        msg: "Waiting for team logo",
                                        webPosition: 'center');
                                    return;
                                  }
                                  member2 = TeamModel(
                                    name: teamName,
                                    logo: teamImageURL,
                                  );
                                  setState(() {
                                    mgtList2.add(member2.toJson());
                                    teamImageURL = '';
                                  });

                                  print(mgtList2);
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
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      theme.primaryColor),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 50))),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
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
                                                      "Registering League",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                            ))),
                                  );
                                  final LeagueModel leagueModel = LeagueModel(
                                      teams: mgtList2,
                                      country: selectedValue,
                                      category: selectedValue2,
                                      title: leagueTitle,
                                      sponsor: leagueSponsor,
                                      duration:
                                          '$_selectedDate - $_selectedDate2',
                                      mgt: mgtList,
                                      logo: imageURL);
                                  print(leagueModel.toJson());
                                  // await FireStoreService.updateFirebaseLeague(leagueModel);
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                }
                              },
                              child: Text("Register League",
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

  addInput(
    List list,
  ) {
    // list.add(value)
  }

  Future getImage(int scenario) async {
    try {
      FileUploadInputElement uploadInput = FileUploadInputElement()
        ..accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final file = uploadInput.files?.first;
        final reader = FileReader();
        reader.readAsDataUrl(file!);
        reader.onLoadEnd.listen((event) {
          uploadImageFile(file, scenario);
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void uploadImageFile(file, int scenario) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/${fileName}');
    //var bytes = await pickedFile?.readAsBytes();
    UploadTask uploadTask = reference.putBlob(file);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        switch (scenario) {
          case 1:
            imageURL = imageUrl;
            _imValidate = '';
            break;
          case 2:
            teamImageURL = imageUrl;
            _teamImValidate = '';
            break;
          default:
            break;
        }
      });
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          timeInSecForIosWeb: 2,
          webBgColor: "linear-gradient(to right, #021660, #021660)",
          textColor: Colors.white,
          msg: e.message ?? e.toString());
    }
  }

  void _changeVal(String newValue, int scenario) {
    setState(() {
      switch (scenario) {
        case 1:
          selectedValue = newValue;
          break;
        case 2:
          selectedValue2 = newValue;
          break;
        case 3:
          selectedValue3 = newValue;
          break;
        default:
          break;
      }
    });
  }

  void _presentDatePicker(int scenario) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate:
                DateTime(int.parse(DateFormat.y().format(DateTime.now())) + 2))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        switch (scenario) {
          case 1:
            _selectedDate = pickedDate;
            break;
          case 2:
            _selectedDate2 = pickedDate;
            break;
          default:
            break;
        }
      });
    });
  }
}
