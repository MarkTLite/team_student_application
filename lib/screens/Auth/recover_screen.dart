import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/string_consts.dart';
import '../../widgets/Auth/passwordRecover_form.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key, required this.title}) : super(key: key);
  static const String routeName = "recoverpassword";

  final String title;

  @override
  State<RecoverPasswordPage> createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFF470094), Color(0x11C590FF)],
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          stops: [0.5, 1]),
                      image: DecorationImage(
                          image: AssetImage(StringConsts.loginImages[0]),
                          repeat: ImageRepeat.noRepeat,
                          matchTextDirection: true,
                          fit: BoxFit.fitWidth)),
                ),
              ),
              Positioned(
                  right: MediaQuery.of(context).size.width * 0.03,
                  top: isLogin
                      ? MediaQuery.of(context).size.height * 0.1
                      : MediaQuery.of(context).size.height * 0.05,
                  //bottom: ,
                  child: Container(
                      //height: 705,
                      width: MediaQuery.of(context).size.width * 0.3,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: const Color(0xFF021660),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: 100,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage(StringConsts.loginImages[1]),
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Welcome to the",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text("Tag Fan Fun Data Entry Dashboard",
                                textAlign: TextAlign.center),
                          ),
                          PasswordRecoverForm(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                isLogin
                                    ? "Don't have an account?"
                                    : "Already have an account?",
                                style: TextStyle(
                                    color: Colors.white,
                                    decoration: TextDecoration.underline),
                              ),
                              TextButton(
                                child: Text(
                                  isLogin ? 'Sign up' : "Sign in",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF00FFF0),
                                    fontSize: 13.0,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isLogin ? isLogin = false : isLogin = true;
                                  });
                                  //place signup page as current route in the stack
                                  // Navigator.pushReplacementNamed(
                                  //     context, SignUpScreen.routeName);
                                },
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(),
                          ),
                        ],
                      ))),
            ])));
  }
}
