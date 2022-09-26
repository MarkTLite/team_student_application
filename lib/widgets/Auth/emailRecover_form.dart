import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailRecoverForm extends StatefulWidget {
  EmailRecoverForm();

  @override
  State<EmailRecoverForm> createState() => _EmailRecoverFormState();
}

class _EmailRecoverFormState extends State<EmailRecoverForm> {
  bool _passwordVisible = false;
  final _formKey = GlobalKey<FormState>(); //for form validation
  String email = '';

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
                  fontSize: 14.0, color: const Color(0xFFF03800)),
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.verified_user_outlined),
                hintText: 'isaacmubs256@gmail.com',
                hintStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300,
                    fontSize: 13.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.orange),
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
