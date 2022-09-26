import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/string_consts.dart';
import '../../widgets/Auth/emailRecover_form.dart';
import '../../widgets/Auth/login_form.dart';
import '../../widgets/Auth/signUp_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.title}) : super(key: key);
  static const String routeName = "auth";

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0), // here the desired height
        child: AppBar(
            toolbarHeight: 70,
            elevation: 4.0,
            backgroundColor: Colors.white,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, right: 15),
                child: Text(
                  "Plot 446 Kabaka A'njagala Rd-Mengo\nP.O.Box 8128\nKampala - Uganda",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
            centerTitle: false,
            title: Container(
                alignment: Alignment.centerLeft,
                // margin: EdgeInsets.only(top: 20, left: 20, bottom: 19),
                width: media.width * 0.5,
                // color: Colors.black,
                height: 70,
                child: Image.asset(
                  StringConsts.loginImages[2],
                  // fit: BoxFit.cover,
                ))),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              image: DecorationImage(
                  image: AssetImage(StringConsts.loginImages[3]),
                  fit: BoxFit.fill,
                  opacity: 0.4)),
          child: SingleChildScrollView(
            child: Container(
              width: media.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      // color: const Color(0x66000000),
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    // height: 705,
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: EdgeInsets.only(left: 44, top: 25, bottom: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Welcome to the ",
                            style: TextStyle(
                              color: theme.primaryColor,
                              fontFamily: 'Roboto',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Text(
                          "TEAM University Student Application Portal",
                          style: TextStyle(
                            color: theme.primaryColor,
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            "If you are new, please create an account and log in in order for us to keep track of your application. If you already have an account, please sign in",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Source Sans Pro',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              "Once you have created an account and signed in, you have to perform the following steps for successful application:",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                              "•   Read the academic minimum requirements,\n•   Pay the application fee,\n•   Fill the application form and\n•   Attach scanned copies of required documents such as of your academic documents",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Source Sans Pro',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.left),
                        ),
                        Padding(padding: EdgeInsets.only(top: 55)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Color(0xFF000000),
                              padding:
                                  EdgeInsets.only(top: 10, right: 3, left: 10),
                              height: 190,
                              width: media.width * 0.13,
                              child: Column(children: [
                                Text('VISION STATEMENT',
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                Divider(
                                  color: Colors.white,
                                ),
                                Text(
                                    'To be a hub of Professional Excellency through continued innovations in science, governance, research and entrepreneurship for Nations in the East African Regions and beyond.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        height: 1.5,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 10, right: 3, left: 10),
                              color: Color(0xFF000000),
                              height: 190,
                              width: media.width * 0.14,
                              child: Column(children: [
                                Text('MISSION STATEMENT',
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                Divider(
                                  color: Colors.white,
                                ),
                                Text(
                                    'To provide transformative Educational experience for students, with intent to foster productive careers, meaningful livelihoods, and responsible citizenry in a global society.',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 10, right: 3, left: 10),
                              color: Color(0xAA404040),
                              height: 190,
                              width: media.width * 0.08,
                              child: Column(children: [
                                Text('MOTTO',
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                Divider(
                                  color: Colors.white,
                                ),
                                Text('Empower for Generations',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        height: 1.5,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.only(top: 10, right: 3, left: 10),
                              color: Color(0xAA404040),
                              height: 190,
                              width: media.width * 0.09,
                              child: Column(children: [
                                Text('CORE VALUES',
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontFamily: 'Roboto',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                Divider(
                                  color: Colors.white,
                                ),
                                Text(
                                    'Professionalism,\nInnovation,\nIntegrity,\nExcellency',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Roboto',
                                        fontSize: 12,
                                        height: 1.5,
                                        fontWeight: FontWeight.w500)),
                              ]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      // height: 705,
                      width: MediaQuery.of(context).size.width * 0.35,
                      margin: EdgeInsets.only(right: 44, top: 20, bottom: 30),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                              width: 100,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                // shape: BoxShape.
                                image: DecorationImage(
                                    image:
                                        AssetImage(StringConsts.loginImages[0]),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: Text("TEAM UNIVERSITY",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontFamily: 'Open Sans',
                                  fontSize: 23,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 35),
                            child: Text("Student Application Portal",
                                style: TextStyle(
                                  color: theme.primaryColor,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center),
                          ),
                          isLogin ? LoginForm() : SignUpForm(),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isLogin
                                      ? "Don't have an account?"
                                      : "Already have an account?",
                                  style: TextStyle(
                                    color: theme.primaryColor,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                TextButton(
                                  child: Text(
                                    isLogin ? 'Sign up' : "Sign in",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      color: theme.secondaryHeaderColor,
                                      fontSize: 13.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isLogin
                                          ? isLogin = false
                                          : isLogin = true;
                                    });
                                    //place signup page as current route in the stack
                                    // Navigator.pushReplacementNamed(
                                    //     context, SignUpScreen.routeName);
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
