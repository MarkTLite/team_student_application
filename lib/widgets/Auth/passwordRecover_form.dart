import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PasswordRecoverForm extends StatefulWidget {
  PasswordRecoverForm();

  @override
  State<PasswordRecoverForm> createState() => _PasswordRecoverFormState();
}

class _PasswordRecoverFormState extends State<PasswordRecoverForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>(); //for form validation
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text("Recover Password", textAlign: TextAlign.left)),
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
              style: const TextStyle(color: const Color(0xFFF03800)),
              obscureText: !_passwordVisible ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Create Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.orange),
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            // padding: const EdgeInsets.only(
            //   top: 15,
            //   left: 15,
            // ),

            child: TextFormField(
              style: const TextStyle(color: const Color(0xFFF03800)),
              obscureText: !_passwordVisible ? true : false,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: "Create Password",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.orange),
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
          Padding(padding: EdgeInsets.only(top: 35)),
          Container(
              width: 340,
              child: ElevatedButton(
                  child: const Text('Recover Password',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      )),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFFF03800)),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(15)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                        //side: BorderSide(color: Colors.red)
                      ))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // _authService.signOut().then((value) {
                      //   showDialog(
                      //     context: context,
                      //     builder: (context) => Dialog(
                      //         backgroundColor:
                      //             const Color(0xFF082D78),
                      //         child: Container(
                      //             height: 200,
                      //             child: Center(
                      //               child: Column(
                      //                   mainAxisAlignment:
                      //                       MainAxisAlignment
                      //                           .center,
                      //                   children: [
                      //                     CupertinoActivityIndicator(
                      //                         color: const Color(
                      //                             0xFFF03800)),
                      //                     Padding(
                      //                         padding: EdgeInsets
                      //                             .symmetric(
                      //                                 vertical:
                      //                                     10)),
                      //                     Text("Signing in")
                      //                   ]),
                      //             ))),
                      //   );
                      // _authService
                      //     .signInWithEmailAndPassword(
                      //         email, password)
                      //     .then((value) {
                      //   Navigator.pop(context);
                      //   FirebaseAuth.instance
                      //       .authStateChanges()
                      //       .listen(
                      //     (User? user) {
                      //       print("User $user");
                      //       if (user != null) {
                      //         Fluttertoast.showToast(
                      //  timeInSecForIosWeb: 2,
                      //                 webBgColor:
                      //                     "linear-gradient(to right, #021660, #021660)",
                      //                 textColor: Colors.white,
                      //             textColor:
                      //                 const Color(0xFFF03800),
                      //             backgroundColor:
                      //                 const Color(0xFF000000),
                      //             gravity: ToastGravity.CENTER,
                      //             msg: "Login Success");
                      //         checkUserSeenGettingStarted();
                      //       } else {
                      //         Fluttertoast.showToast(
                      //  timeInSecForIosWeb: 2,
                      //                 webBgColor:
                      //                     "linear-gradient(to right, #021660, #021660)",
                      //                 textColor: Colors.white,
                      //             textColor:
                      //                 const Color(0xFFF03800),
                      //             backgroundColor:
                      //                 const Color(0xFF000000),
                      //             gravity: ToastGravity.CENTER,
                      //             msg:
                      //                 "Login Failed: Wrong Password/Email");
                      //       }
                      //     },
                      //   );
                      // });
                      // });
                    }
                  })),
        ],
      ),
    );
  }
}
