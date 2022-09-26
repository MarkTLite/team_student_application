import 'dart:html';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;

import '../../../models/Articles/recentArticle_model.dart';
import '../../../providers/Auth/auth_service.dart';
import '../../../services/firestore_service.dart';
import '../Match_Scores/dropdown_widget.dart';
import 'rich_text.dart';
import 'upload_image.dart';

class ArticleModal extends StatefulWidget {
  ArticleModal({Key? key}) : super(key: key);

  @override
  State<ArticleModal> createState() => _ArticleModalState();
}

class _ArticleModalState extends State<ArticleModal> {
  late AuthStateProvider _authService;
  String articleImageURL = '';
  String articleImageUrl = '';
  String headline = '';
  bool _agreed = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _validate = '';
  String _imValidate = '';
  String _articleDet = '';
  String _richValidate = '';
  String selectedValue = 'Soccer';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Soccer"), value: "Soccer"),
      DropdownMenuItem(child: Text("Rugby"), value: "Rugby"),
      DropdownMenuItem(child: Text("Basketball"), value: "Basketball"),
      DropdownMenuItem(child: Text("Netball"), value: "Netball"),
    ];
    return menuItems;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _authService = Provider.of<AuthStateProvider>(context, listen: false);
    final theme = Theme.of(context);
    return Dialog(
      backgroundColor: const Color.fromRGBO(184, 229, 255, 0.6),
      child: Container(
        width: 1000,
        height: 900,
        padding: EdgeInsets.all(15),
        child: Form(
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
                        Text("Write your own article",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            )),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(theme.errorColor),
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Share what you know or feel the world should get to know in your field of expertise",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: DropDownWidget(
                    width: 343,
                    title: 'Sports Category',
                    changeVal: _changeVal,
                    dropDownItems: dropdownItems,
                    selectedValue: selectedValue,
                    scenario: 1,
                  ),
                ),
                Container(
                  color: Color(0xFFFFFFFF),
                  margin: const EdgeInsets.only(bottom: 32),
                  child: TextFormField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14.0,
                          color: const Color(0xFFF000000),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        hintText: 'HEADLINE',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(1),
                          borderSide:
                              BorderSide(color: theme.primaryColor, width: 2),
                        ),
                      ),
                      onChanged: (val) {
                        headline = val;
                      },
                      validator: (val) {
                        String pattern = r"^[a-zA-Z0-9]";
                        RegExp regex = RegExp(pattern);
                        if (val == null ||
                            val.isEmpty ||
                            !regex.hasMatch(val)) {
                          return 'Require an alphanumeric headline';
                        }
                        return null;
                      }),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 32),
                    height: 160,
                    child: FormField(validator: (value) {
                      if (articleImageURL.isEmpty) {
                        setState(() {
                          _imValidate = "Add an image";
                        });
                        return "Add an image";
                      }
                      return null;
                    }, builder: (FormFieldState<dynamic> field) {
                      return Center(
                          child: Column(
                        children: [
                          Container(
                            height: 150,
                            child: UploadImageWidget(
                              imagePath: articleImageURL,
                              uploader: getArticleImage,
                            ),
                          ),
                          _imValidate.isEmpty
                              ? Container(
                                  height: 0,
                                )
                              : Padding(
                                  padding: EdgeInsets.only(top: 0),
                                  child: Text(
                                    _imValidate,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ))
                        ],
                      ));
                    })),
                Container(
                    margin: EdgeInsets.only(bottom: 32),
                    height: 220,
                    color: Colors.white,
                    child: FormField(validator: (value) {
                      if (_articleDet.isEmpty || _articleDet.length < 72) {
                        setState(() {
                          _richValidate =
                              "Save your work after giving details on the event, atleast 72 characters";
                        });
                        return "Give more details on the event";
                      }
                      return null;
                    }, builder: (FormFieldState<dynamic> field) {
                      return Column(
                        children: [
                          RichTextEditorWidget(
                            extractor: getMessageFromEditor,
                          ),
                          _richValidate.isEmpty
                              ? Container()
                              : Text(
                                  _richValidate,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      );
                    })),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text(
                    "Declaration",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: FormField(validator: (value) {
                    if (!_agreed) {
                      setState(() {
                        _validate = "Agree to the declaration";
                      });
                      return "Agree";
                    }
                    return null;
                  }, builder: (FormFieldState<dynamic> field) {
                    return CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _agreed,
                      onChanged: (newValue) {
                        setState(() {
                          _agreed = newValue!;
                          _validate = "";
                        });
                      },
                      title: Text(
                        'I declare that the information I have written is solely my professional view points and not those of MedAtlas or the employees of MedAtlas. I have written this piece in my right frame of mind and without coercion. ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: _validate.isEmpty
                          ? null
                          : Text(
                              _validate,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                    );
                  }),
                ),
                Container(
                  width: 330,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    margin: EdgeInsets.only(bottom: 44),
                    child: StreamBuilder(
                        stream: _authService.getAuthUserDetails(
                            FirebaseAuth.instance.currentUser!),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            final user = snapshot.data;
                            return ListTile(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                tileColor: Colors.white,
                                leading: CircleAvatar(
                                  radius: 45,
                                ),
                                title: Text(
                                  "${user.get('displayName')}",
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${user.get('designation')}",
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    Text(
                                      "${user.get('address')} | ${user.get('address')}",
                                      style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ));
                          } else {
                            return Center(child: CupertinoActivityIndicator());
                          }
                        }),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(theme.primaryColor),
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 84))),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                                backgroundColor: const Color(0xFF082D78),
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
                                                color: const Color(0xFFF03800)),
                                            Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10)),
                                            Text(
                                              "Uploading Article",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                    ))),
                          );
                          await FireStoreService.updateFirebaseAdminArticles(
                              RecentArticleModel(
                                  image: articleImageURL,
                                  category: selectedValue,
                                  title: headline,
                                  date:
                                      DateFormat.yMMMd().format(DateTime.now()),
                                  summary: _articleDet));
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
        ),
      ),
    );
  }

  Future getArticleImage() async {
    try {
      FileUploadInputElement uploadInput = FileUploadInputElement()
        ..accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final file = uploadInput.files?.first;
        final reader = FileReader();
        reader.readAsDataUrl(file!);
        reader.onLoadEnd.listen((event) {
          uploadArticleImageFile(file);
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void uploadArticleImageFile(file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/${fileName}');
    //var bytes = await pickedFile?.readAsBytes();
    UploadTask uploadTask = reference.putBlob(file);
    try {
      TaskSnapshot snapshot = await uploadTask;
      articleImageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        articleImageURL = articleImageUrl;
        _imValidate = '';
      });
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          timeInSecForIosWeb: 2,
          webBgColor: "linear-gradient(to right, #021660, #021660)",
          textColor: Colors.white,
          msg: e.message ?? e.toString());
    }
  }

  getMessageFromEditor(String str) {
    setState(() {
      _articleDet = str;
      _richValidate = '';
    });
  }

  void _changeVal(String? newValue) {
    setState(() {
      selectedValue = newValue!;
    });
  }
}
