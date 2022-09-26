import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../providers/Auth/auth_service.dart';
import '../profile_widget.dart';
import 'profile_tile.dart';

class ProfileDetailsWidget extends StatefulWidget {
  final BuildContext context;
  final Function toggler;
  ProfileDetailsWidget({Key? key, required this.context, required this.toggler})
      : super(key: key);

  @override
  State<ProfileDetailsWidget> createState() => ProfileDetailsWidgetState();
}

class ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  late AuthStateProvider _authService;
  String imageURL = '';
  String imageUrl = '';

  @override
  void initState() {
    _authService = Provider.of<AuthStateProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      width: MediaQuery.of(context).size.width * 0.18,
      height: double.infinity,
      child: StreamBuilder(
          stream: _authService
              .getAuthUserDetails(FirebaseAuth.instance.currentUser!),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                  child: Column(children: [
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(top: 10),
                    child: IconButton(
                      padding: EdgeInsets.all(1),
                      onPressed: () => widget.toggler(),
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: theme.primaryColor,
                      ),
                    )),
                Center(
                    child: ProfileImageWidget(
                  imagePath: snapshot.data?.get('photoURL'),
                  imageUploader: getImage,
                  width: 90,
                  height: 90,
                  avatarClass: "profile",
                )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      '${snapshot.data?.get('displayName')}',
                      style: TextStyle(
                          color: theme.primaryColor,
                          fontFamily: 'Roboto',
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    )),
                Column(children: [
                  ProfileTile(context,
                      leadingIcon: const Icon(
                        Icons.person_outline,
                        size: 20,
                        color: Colors.white,
                      ),
                      title: "User Name",
                      fbKey: 'displayName',
                      subtitle: snapshot.data?.get('displayName'),
                      subTitleWidget: Text(snapshot.data?.get('displayName'),
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.w300))),
                  ProfileTile(context,
                      leadingIcon: const Icon(
                        Icons.message,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: "Email",
                      fbKey: 'email',
                      subtitle: snapshot.data?.get('email'),
                      subTitleWidget: Text(snapshot.data?.get('email'),
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.w300))),
                  ProfileTile(context,
                      leadingIcon: const Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 20,
                      ),
                      title: "Phone",
                      fbKey: 'phoneNumber',
                      subtitle: snapshot.data?.get('phoneNumber'),
                      subTitleWidget: Text(snapshot.data?.get('phoneNumber'),
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontFamily: "Roboto",
                              fontSize: 12,
                              fontWeight: FontWeight.w300))),
                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                        child: ElevatedButton(
                      child: Text('Log Out',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            //side: BorderSide(color: Colors.red)
                          ))),
                      onPressed: () async {
                        await _authService.signOut(); //.then((value) {
                        //   Navigator.popAndPushNamed(
                        //     context,
                        //     LoginPage.routeName,
                        //   );
                        // });
                      },
                    )),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Center(
                        child: TextButton(
                      onPressed: () {},
                      child: Container(
                          padding: EdgeInsets.only(bottom: 30),
                          width: 210,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.question_mark_outlined),
                                Text("Help"),
                              ])),
                    )),
                  )
                ]),
              ]));
            } else {
              return Container(child: CupertinoActivityIndicator());
            }
          }),
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
      });
    } on FirebaseException catch (e) {
      Fluttertoast.showToast(
          timeInSecForIosWeb: 2,
          webBgColor: "linear-gradient(to right, #021660, #021660)",
          textColor: Colors.white,
          msg: e.message ?? e.toString());
    }
  }
}
