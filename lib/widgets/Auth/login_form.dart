import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/Auth/auth_service.dart';
import '../../screens/Dashboard/dashboard.dart';
import 'emailRecover_form.dart';

class LoginForm extends StatefulWidget {
  LoginForm();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>(); //for form validation
  String email = '';
  String password = '';
  bool isRecover = false;
  bool isFailLogin = false;
  String signInError = "";
  late AuthStateProvider _authService;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context).size;
    _authService = Provider.of<AuthStateProvider>(context, listen: false);
    return isRecover
        ? EmailRecoverForm()
        : Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                isFailLogin
                    ? Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            width: media.width * 0.3,
                            color: theme.errorColor,
                            child: Text(
                              signInError,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      )
                    : Container(),
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 18),
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Sign In",
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontFamily: 'Roboto',
                            fontSize: 33,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left)),
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
                        Icons.person_outline,
                        // color: Colors.white,
                      ),
                      hintText: 'username@gmail.com',
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
                      if (emVal == null ||
                          emVal.isEmpty ||
                          !regex.hasMatch(emVal))
                        return 'Enter a valid email address';
                      else
                        return null;
                    },
                  ),
                ),
                Container(
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
                      labelText: "Password",
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
                          !_passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
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
                        setState(() {
                          isRecover = true;
                        });
                        //place signup page as current route in the stack
                        // Navigator.pushReplacementNamed(
                        //     context, PasswordRecoveryScreen.routeName);
                      },
                    )),
                const Padding(padding: EdgeInsets.only(top: 35)),
                Container(
                    width: 330,
                    child: ElevatedButton(
                        child: Text('Sign in',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.white)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(theme.primaryColor),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(15)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              //side: BorderSide(color: Colors.red)
                            ))),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _authService.signOut().then((value) {
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
                                                    color: const Color(
                                                        0xFFF03800)),
                                                Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10)),
                                                Text(
                                                  "Signing in",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ]),
                                        ))),
                              );
                              _authService
                                  .signInWithEmailAndPassword(email, password)
                                  .then((value) {
                                if (!value[0]) {
                                  setState(() {
                                    isFailLogin = true;
                                    signInError = value[1];
                                  });
                                }
                                Navigator.pop(context);
                              });
                            });
                          }
                        })),
              ],
            ),
          );
  }
}
