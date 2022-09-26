import 'dart:html';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../providers/Auth/auth_service.dart';
import '../../screens/Auth/recover_screen.dart';
import '../../screens/Dashboard/dashboard.dart';
import '../profile_widget.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm();

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>(); //for form validation
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  String pass = '';
  late AuthStateProvider _authService;
  XFile? pickedFile;
  late bool isLoading;
  bool isUploaded = false;
  String imageUrl = '';
  String imageURL = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    _authService = Provider.of<AuthStateProvider>(context, listen: false);
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0, bottom: 10),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Create Account",
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontFamily: 'Roboto',
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.left)),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Center(
                child: ProfileImageWidget(
              imagePath: isUploaded ? imageURL : '',
              imageUploader: getImage,
              height: 90,
              width: 90,
              avatarClass: "signer",
            )),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              // color: Color(0x486598C7),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),
            child: TextFormField(
              style: const TextStyle(
                // color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                labelText: "First Name",
                labelStyle: TextStyle(
                    // color: Color(0xFFFFFFFF),
                    ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                hintText: 'John',
                hintStyle: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onChanged: (val) => setState(() {
                name = val;
              }),
              validator: (name) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (name == null || name.isEmpty || !regex.hasMatch(name))
                  return 'Enter a valid First Name';
                else
                  return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              // color: Color(0x486598C7),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),
            child: TextFormField(
              style: const TextStyle(
                // color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                labelText: "Surname",
                labelStyle: TextStyle(
                    // color: Color(0xFFFFFFFF),
                    ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.black,
                ),
                hintText: 'Doe',
                hintStyle: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onChanged: (val) => setState(() {
                name = val;
              }),
              validator: (name) {
                String pattern = r"^[a-zA-Z]";
                RegExp regex = RegExp(pattern);
                if (name == null || name.isEmpty || !regex.hasMatch(name))
                  return 'Enter a valid Surname';
                else
                  return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              // color: Color(0x486598C7),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),
            child: TextFormField(
              style: const TextStyle(
                // color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(
                    // color: Color(0xFFFFFFFF),
                    ),
                prefixIcon: Icon(
                  Icons.mail_outline,
                  color: Colors.black,
                ),
                hintText: 'user@gmail.com',
                hintStyle: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onChanged: (val) => setState(() {
                email = val;
              }),
              validator: (emVal) {
                String pattern =
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$";
                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid email address';
                else
                  return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              // color: Color(0x486598C7),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),
            child: TextFormField(
              style: const TextStyle(
                // color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                labelText: "Telephone No.",
                labelStyle: TextStyle(
                    // color: Color(0xFFFFFFFF),
                    ),
                prefixIcon: Icon(
                  Icons.phone,
                  color: Colors.black,
                ),
                hintText: '+256770000000',
                hintStyle: TextStyle(
                  color: Color(0xAAFFFFFF),
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onChanged: (val) => setState(() {
                phoneNumber = val;
              }),
              validator: (emVal) {
                String pattern = r"^[0-9]";

                RegExp regex = RegExp(pattern);
                if (emVal == null || emVal.isEmpty || !regex.hasMatch(emVal))
                  return 'Enter a valid phone number';
                else
                  return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),

            child: TextFormField(
              style: const TextStyle(
                // color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              obscureText: !_passwordVisible ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Create Password",
                labelStyle: TextStyle(
                    // color: Color(0xFFFFFFFF),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(right: 20.0),
                  icon: Icon(
                    !_passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              onChanged: (val) => setState(() {
                password = val;
              }),
              validator: (pass) {
                if (pass == null || pass.isEmpty) {
                  return 'Please enter a password';
                }
                return null;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),

            child: TextFormField(
              style: const TextStyle(
                // color: Colors.white,
                fontFamily: 'Open Sans',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              obscureText: !_passwordVisible ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                labelStyle: TextStyle(
                    // color: Color(0xFFFFFFFF),
                    ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  padding: const EdgeInsets.only(right: 20.0),
                  icon: Icon(
                    !_passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.white,
                    size: 15.0,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              onChanged: (val) => setState(() {
                pass = val;
              }),
              validator: (passw) {
                if (passw != password || passw!.isEmpty) {
                  return 'Please enter the same password';
                }
                return null;
              },
            ),
          ),
          Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(
                      color: theme.primaryColor,
                      decoration: TextDecoration.underline,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300),
                ),
                onPressed: () {
                  //place signup page as current route in the stack
                  Navigator.pushNamed(context, RecoverPasswordPage.routeName);
                },
              )),
          const Padding(padding: EdgeInsets.only(top: 35)),
          Container(
              width: 340,
              child: ElevatedButton(
                  child: const Text('Create Account',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white)),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(theme.primaryColor),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(top: 20, bottom: 20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        //side: BorderSide(color: Colors.red)
                      ))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                            backgroundColor: const Color(0xFF082D78),
                            child: Container(
                                height: 100,
                                width: 100,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CupertinoActivityIndicator(
                                            color: const Color(0xFFF03800)),
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10)),
                                        Text(
                                          "Signing up",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ]),
                                ))),
                      );
                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pop(context);
                      await _authService.signUp(
                          name: name.trim(),
                          email: email.trim(),
                          password: password,
                          phoneNumber: phoneNumber,
                          imageURL: imageURL);
                    }
                  })),
        ],
      ),
    );
  }

  Future getImage() async {
    try {
      FileUploadInputElement uploadInput = FileUploadInputElement()
        ..accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((event) {
        final file = uploadInput.files?.first;
        final reader = FileReader();
        reader.readAsDataUrl(file!);
        reader.onLoadEnd.listen((event) {
          uploadImageFile(file);
        });
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  void uploadImageFile(file) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/${fileName}');
    //var bytes = await pickedFile?.readAsBytes();
    UploadTask uploadTask = reference.putBlob(file);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        imageURL = imageUrl;
        isUploaded = true;
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(
          timeInSecForIosWeb: 2,
          webBgColor: "linear-gradient(to right, #021660, #021660)",
          textColor: Colors.white,
          msg: e.message ?? e.toString());
    }
  }
}
