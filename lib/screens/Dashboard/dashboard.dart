import 'dart:html';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart' as html;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:tusrmis_web/services/firestore_service.dart';

import '../../models/Articles/recentArticle_model.dart';
import '../../models/orderModel.dart';
import '../../providers/Auth/auth_service.dart';
import '../../services/flutterwave_service.dart';
import '../../utils/string_consts.dart';
import '../../widgets/Modals/Article/article_modal.dart';
import '../../widgets/Modals/Article/rich_text.dart';
import '../../widgets/Modals/Article/upload_image.dart';
import '../../widgets/Modals/League_Registration/leagueReg_modal.dart';
import '../../widgets/Modals/Match_Scores/matchScores_modal.dart';
import '../../widgets/Modals/Match_Scores/dropdown_widget.dart';
import '../../widgets/Modals/Match_Standings/matchStandings_modal.dart';
import '../../widgets/dashboard/application_form.dart';
import '../../widgets/dashboard/history_table.dart';
import '../../widgets/dashboard/profile_details.dart';
import '../../widgets/dashboard/recent_uploads.dart';
import '../../widgets/dashboard/uploadDoc.dart';
import '../../widgets/profile_widget.dart';
import '../../widgets/success_dialog.dart';

class Dashboard extends StatefulWidget {
  Dashboard();
  static const String routeName = 'dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool tappedProfile = false;
  late AuthStateProvider _authService;
  String imageURL = '';
  String imageUrl = '';
  String uaceUrl = '';
  String uaceFilename = '';
  String uaceDateName = '';
  String uceUrl = '';
  String uceFilename = '';
  String uceDateName = '';
  String tscriptUrl = '';
  String tscriptFilename = '';
  String tscriptDateName = '';
  String bcertUrl = '';
  String bcertFilename = '';
  String bcertDateName = '';
  String otherdocUrl = '';
  String otherdocFilename = '';
  String otherdocDateName = '';
  bool isFormVisible = false;
  bool isPaymentsVisible = false;
  bool isAcadVisible = true;
  bool isDocVisible = false;
  bool acadRead = false;
  late OrderModel orderModel;
  int transferredUaceBytes = 0;

  @override
  void initState() {
    _authService = Provider.of<AuthStateProvider>(context, listen: false);
    orderModel = OrderModel(
        id: createOrderId(),
        amount: 0,
        paymentMethod: 'not-paid',
        items: [],
        email: '',
        fullname: '',
        phone: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0xFFC4C7C8),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // here the desired height
            child: StreamBuilder(
                stream: _authService
                    .getAuthUserDetails(FirebaseAuth.instance.currentUser!),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<String>? username =
                        snapshot.data?.get('displayName').toString().split(' ');
                    orderModel.email = snapshot.data?.get('email');
                    orderModel.fullname = snapshot.data?.get('displayName');
                    orderModel.phone = snapshot.data?.get('phoneNumber');
                    return AppBar(
                        toolbarHeight: 80,
                        elevation: 4.0,
                        backgroundColor: Theme.of(context).primaryColor,
                        actions: [
                          Container(
                            margin: EdgeInsets.only(right: 20),
                            height: 20,
                            width: 20,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications)),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 15, right: 20),
                              child: snapshot.data?.get('photoURL').isEmpty
                                  ? IconButton(
                                      padding: EdgeInsets.all(1),
                                      onPressed: () => getImage,
                                      icon: CircleAvatar(
                                          backgroundColor: Color(0xFFEFF2F5),
                                          radius: 20,
                                          child: Container(
                                            width: 20,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Upload Profile Photo",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Open Sans',
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                    )
                                  : ProfileImageWidget(
                                      imagePath: snapshot.data?.get('photoURL'),
                                      imageUploader: getImage,
                                      width: 40,
                                      height: 40,
                                      avatarClass: "profile2",
                                    ) //_iframeWidget,,
                              ),
                        ],
                        title: Container(
                            width: 100,
                            child: Row(children: [
                              Text("Hi " + username![0],
                                  style: TextStyle(
                                      color: Color(0xFF00FFF0),
                                      fontFamily: 'Roboto',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
                              Text(", Welcome back",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600))
                            ])),
                        centerTitle: true,
                        leading: Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, bottom: 19),
                            width: 190,
                            child: Row(
                              children: [
                                CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage:
                                        AssetImage(StringConsts.loginImages[0]),
                                    radius: 30),
                                const Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text("TEAM UNIVERSITY",
                                        style: TextStyle(
                                            fontFamily: 'Roboto Condensed',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700)))
                              ],
                            )));
                  } else {
                    return Container(
                        color: Theme.of(context).primaryColor,
                        child: CupertinoActivityIndicator());
                  }
                })),
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Row(children: [
              Drawer(
                  elevation: 1.0,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: tappedProfile
                      ? ProfileDetailsWidget(
                          context: context, toggler: _toggleTappedProfile)
                      : Container(
                          padding: EdgeInsets.only(top: 30),
                          height: double.infinity,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: ListView(children: [
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, bottom: 10),
                                        child: TextButton(
                                          // onHover: (value) {
                                          //   setState(() {
                                          //     isHover = true;
                                          //   });
                                          // },

                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                          ),
                                          child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    theme.secondaryHeaderColor,
                                                radius: 15,
                                                child: Image.asset(
                                                    StringConsts
                                                        .dashboardImages[1],
                                                    height: 12,
                                                    width: 12)),
                                            title: Text("My Application",
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16)),
                                          ),
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, bottom: 10),
                                        child: TextButton(
                                          // onHover: (value) {
                                          //   setState(() {
                                          //     isHover = true;
                                          //   });
                                          // },

                                          onPressed: () =>
                                              _toggleTappedProfile(),
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                          ),
                                          child: ListTile(
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 0),
                                            leading: CircleAvatar(
                                                backgroundColor:
                                                    theme.secondaryHeaderColor,
                                                radius: 15,
                                                child: Image.asset(
                                                    StringConsts
                                                        .dashboardImages[2],
                                                    height: 12,
                                                    width: 12)),
                                            title: Text("Profile",
                                                style: TextStyle(
                                                    fontFamily: 'Roboto',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16)),
                                          ),
                                        )),
                                  ])),
                              Expanded(
                                  child: Center(
                                      child: TextButton(
                                onPressed: () {},
                                child: Container(
                                    width: 210,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.question_mark_outlined),
                                          Text("Help"),
                                        ])),
                              )))
                            ],
                          ))),
              Container(
                margin: const EdgeInsets.only(
                    left: 15, top: 15, right: 0, bottom: 0),
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.width * 0.80,
                color: Color.fromRGBO(255, 255, 255, 0.6),
                child: SingleChildScrollView(
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(top: 15, left: 10),
                                child: Text("My Student Application",
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 28,
                                        color: theme.primaryColor))),
                            Row(
                              children: [
                                Text('Application Status:   ',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: theme.primaryColor)),
                                Container(
                                    margin: const EdgeInsets.only(
                                      top: 10,
                                      right: 20,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: kElevationToShadow[1]),
                                    width: 100,
                                    height: 50,
                                    alignment: Alignment.center,
                                    child: Center(
                                      child: Text("NOT SUBMITTED",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: theme.errorColor)),
                                    )),
                              ],
                            ),
                          ],
                        ),
                        ListView(
                          shrinkWrap: true,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24, left: 10, bottom: 14),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(3)),
                                onPressed: () => setState(() {
                                  isAcadVisible = isAcadVisible ? false : true;
                                }),
                                child: Text(
                                    "> Read Academic Minimum Requirements   ---(Tap to reveal / hide)---",
                                    style: TextStyle(
                                        color: theme.secondaryHeaderColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                        fontSize: 20)),
                              ),
                            ),
                            Visibility(
                                visible: isAcadVisible,
                                child: Container(
                                    width: double.infinity,
                                    color: Colors.grey,
                                    height: 100,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          ElevatedButton(
                                              child: Text('Download PDF',
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white)),
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          theme.primaryColor),
                                                  padding:
                                                      MaterialStateProperty.all(
                                                          const EdgeInsets.all(
                                                              15)),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                    //side: BorderSide(color: Colors.red)
                                                  ))),
                                              onPressed: () async {
                                                downloadPDFWeb();
                                              }),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 10.0),
                                                child: Checkbox(
                                                    value: acadRead,
                                                    onChanged: (val) {
                                                      setState(() {
                                                        acadRead = acadRead
                                                            ? false
                                                            : true;
                                                      });
                                                    }),
                                              ),
                                              Text(
                                                  'I have read the Academic Minimum Requirements and have understood them',
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white))
                                            ],
                                          )
                                        ],
                                      ),
                                    ))),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24, left: 10, bottom: 14),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(3)),
                                onPressed: () => setState(() {
                                  isPaymentsVisible =
                                      isPaymentsVisible ? false : true;
                                }),
                                child: Text(
                                    "> Pay Application Fee   ---(Tap to reveal / hide)---",
                                    style: TextStyle(
                                        color: theme.secondaryHeaderColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                        fontSize: 20)),
                              ),
                            ),
                            Visibility(
                                visible: isPaymentsVisible,
                                child: Container(
                                  color: Colors.grey,
                                  width: double.infinity,
                                  height: 100,
                                  child: Center(
                                    child: ElevatedButton(
                                        child: Text('CONFIRM PAYMENT',
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white)),
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    theme.primaryColor),
                                            padding: MaterialStateProperty.all(
                                                const EdgeInsets.all(15)),
                                            shape: MaterialStateProperty.all<
                                                    RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                              //side: BorderSide(color: Colors.red)
                                            ))),
                                        onPressed: () {
                                          //Verify Transaction
                                          // FlutterwaveService
                                          //     .makeFlutterwavePayment(
                                          //   context,
                                          //   orderModel.fullname,
                                          //   orderModel.phone,
                                          //   orderModel.email,
                                          //   '50000',
                                          // ).then((value) {
                                          //   if (value) {
                                          //     orderModel.amount = 50000;
                                          //     orderModel.paymentMethod = 'paid';
                                          //     sendOrder(orderModel)
                                          //         .then((value) {
                                          //       if (value) {
                                          //         showDialog(
                                          //             context: context,
                                          //             builder: (BuildContext
                                          //                 context) {
                                          //               return SuccessDialog(
                                          //                 title:
                                          //                     "Transaction Success",
                                          //                 descriptions:
                                          //                     "Your payment for the Application fee has been received. You can now go on to complete and submit your application",
                                          //                 text: 'Close',
                                          //                 img: StringConsts
                                          //                     .loginImages[0],
                                          //               );
                                          //             });
                                          //       }
                                          //     });
                                          //   }
                                          // });
                                        }),
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24, left: 10, bottom: 14),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(3)),
                                onPressed: () => setState(() {
                                  isFormVisible = isFormVisible ? false : true;
                                }),
                                child: Text(
                                    "> Application Form   ---(Tap to reveal / hide)---",
                                    style: TextStyle(
                                        color: theme.secondaryHeaderColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                        fontSize: 20)),
                              ),
                            ),
                            Visibility(
                                maintainState: true,
                                visible: isFormVisible,
                                child: ApplicationFormWidget()),
                            // Center(child: CircularProgressIndicator()),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 24, left: 10, bottom: 14),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    alignment: Alignment.centerLeft,
                                    padding: MaterialStateProperty.all(
                                      EdgeInsets.all(15),
                                    ),
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    elevation: MaterialStateProperty.all(3)),
                                onPressed: () => setState(() {
                                  isDocVisible = isDocVisible ? false : true;
                                }),
                                child: Text(
                                    "> Attach Photocopies and Documents   ---(Tap to reveal / hide)---",
                                    style: TextStyle(
                                        color: theme.secondaryHeaderColor,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Roboto',
                                        fontSize: 20)),
                              ),
                            ),
                            Visibility(
                                visible: isDocVisible,
                                child: Container(
                                  width: double.infinity,
                                  color: Colors.grey,
                                  child: Container(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                        Text("High School/ UACE Passlip"),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(bottom: 10),
                                          height: 35,
                                          width: media.width * 0.2,
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 1),
                                                  child: UploadDocWidget(
                                                    docPath: uaceUrl.isNotEmpty
                                                        ? uaceUrl
                                                        : '',
                                                    docUploader: getDoc,
                                                    height: 25,
                                                    width: media.width * 0.15,
                                                    filename:
                                                        uaceFilename.isEmpty
                                                            ? ''
                                                            : uaceFilename,
                                                    doctype: 'uace',
                                                  )),
                                              uaceUrl.isNotEmpty
                                                  ? IconButton(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      onPressed: () => deleteDoc(
                                                          uaceDateName,
                                                          'uace'), //getImage,
                                                      icon: Icon(Icons.delete))
                                                  : Container(),
                                            ],
                                          ),
                                        ),
                                        Text("O Level/ UCE Passlip"),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: 35,
                                            width: media.width * 0.2,
                                            child: Row(children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 1),
                                                  child: UploadDocWidget(
                                                    docPath: uceUrl.isNotEmpty
                                                        ? uceUrl
                                                        : '',
                                                    docUploader: getDoc,
                                                    height: 25,
                                                    width: media.width * 0.15,
                                                    filename:
                                                        uceFilename.isEmpty
                                                            ? ''
                                                            : uceFilename,
                                                    doctype: 'uce',
                                                  )),
                                              uceUrl.isNotEmpty
                                                  ? IconButton(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      onPressed: () => deleteDoc(
                                                          uceDateName,
                                                          'uce'), //getImage,
                                                      icon: Icon(Icons.delete))
                                                  : Container(),
                                            ])),
                                        Text(
                                            "Transcript (If applicable) / Diploma / Certificate"),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: 35,
                                            width: media.width * 0.2,
                                            child: Row(children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 1),
                                                  child: UploadDocWidget(
                                                    docPath:
                                                        tscriptUrl.isNotEmpty
                                                            ? tscriptUrl
                                                            : '',
                                                    docUploader: getDoc,
                                                    height: 25,
                                                    width: media.width * 0.15,
                                                    filename:
                                                        tscriptFilename.isEmpty
                                                            ? ''
                                                            : tscriptFilename,
                                                    doctype: 'tscript',
                                                  )),
                                              tscriptUrl.isNotEmpty
                                                  ? IconButton(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      onPressed: () => deleteDoc(
                                                          tscriptDateName,
                                                          'tscript'), //getImage,
                                                      icon: Icon(Icons.delete))
                                                  : Container(),
                                            ])),
                                        Text("Birth Certificate"),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: 35,
                                            width: media.width * 0.2,
                                            child: Row(children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 1),
                                                  child: UploadDocWidget(
                                                    docPath: bcertUrl.isNotEmpty
                                                        ? bcertUrl
                                                        : '',
                                                    docUploader: getDoc,
                                                    height: 25,
                                                    width: media.width * 0.15,
                                                    filename:
                                                        bcertFilename.isEmpty
                                                            ? ''
                                                            : bcertFilename,
                                                    doctype: 'bcert',
                                                  )),
                                              bcertUrl.isNotEmpty
                                                  ? IconButton(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      onPressed: () => deleteDoc(
                                                          bcertDateName,
                                                          'bcert'), //getImage,
                                                      icon: Icon(Icons.delete))
                                                  : Container(),
                                            ])),
                                        Text("Any Other Relevant Document"),
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 10),
                                            height: 35,
                                            width: media.width * 0.2,
                                            child: Row(children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 1),
                                                  child: UploadDocWidget(
                                                    docPath:
                                                        otherdocUrl.isNotEmpty
                                                            ? otherdocUrl
                                                            : '',
                                                    docUploader: getDoc,
                                                    height: 25,
                                                    width: media.width * 0.15,
                                                    filename:
                                                        otherdocFilename.isEmpty
                                                            ? ''
                                                            : otherdocFilename,
                                                    doctype: 'otherdoc',
                                                  )),
                                              otherdocUrl.isNotEmpty
                                                  ? IconButton(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      onPressed: () => deleteDoc(
                                                          otherdocDateName,
                                                          'otherdoc'), //getImage,
                                                      icon: Icon(Icons.delete))
                                                  : Container(),
                                            ])),
                                      ])),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 50,
                                bottom: 50,
                              ),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
              // FutureBuilder<DocumentSnapshot>(
              //     future: FireStoreService.checkUserSeenAMR(
              //         FirebaseAuth.instance.currentUser!),
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         bool seenAMR = snapshot.data!.get('seenAMR');
              //         !seenAMR
              //             ? showDialog(
              //                 context: context,
              //                 builder: (context) => Dialog(
              //                     child: Container(
              //                         width: 100,
              //                         height: 200,
              //                         color: theme.primaryColor)))
              //             : Container();
              //         return Container();
              //       } else {
              //         return Container();
              //       }
              //     })
            ])));
  }

  void _toggleTappedProfile() {
    setState(() {
      tappedProfile ? tappedProfile = false : tappedProfile = true;
    });
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

  Future getDoc(String scenario) async {
    try {
      FileUploadInputElement uploadInput = FileUploadInputElement()
        ..accept = 'pdf/*';
      uploadInput.click();
      uploadInput.onChange.listen((event) {
        final file = uploadInput.files?.first;
        switch (scenario) {
          case 'uace':
            setState(() {
              uaceFilename = file!.name;
            });
            break;
          case 'uce':
            setState(() {
              uceFilename = file!.name;
            });
            break;
          case 'bcert':
            setState(() {
              bcertFilename = file!.name;
            });
            break;
          case 'tscript':
            setState(() {
              tscriptFilename = file!.name;
            });
            break;
          case 'otherdoc':
            setState(() {
              otherdocFilename = file!.name;
            });
            break;
          default:
            break;
        }

        final reader = FileReader();
        reader.readAsDataUrl(file!);
        reader.onLoadEnd.listen((event) {
          uploadDocFile(file, scenario);
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

  void uploadDocFile(file, scenario) async {
    switch (scenario) {
      case 'uace':
        uaceDateName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
            FirebaseStorage.instance.ref().child('pdfs/${uaceDateName}');
        UploadTask uploadTask = reference.putBlob(file);
        try {
          TaskSnapshot snapshot = await uploadTask;
          uaceUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            uaceUrl = uaceUrl;
          });
        } on FirebaseException catch (e) {
          Fluttertoast.showToast(
              timeInSecForIosWeb: 2,
              webBgColor: "linear-gradient(to right, #021660, #021660)",
              textColor: Colors.white,
              msg: e.message ?? e.toString());
        }
        break;
      case 'uce':
        uceDateName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
            FirebaseStorage.instance.ref().child('pdfs/${uceDateName}');
        UploadTask uploadTask = reference.putBlob(file);
        try {
          TaskSnapshot snapshot = await uploadTask;
          uceUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            uceUrl = uceUrl;
          });
        } on FirebaseException catch (e) {
          Fluttertoast.showToast(
              timeInSecForIosWeb: 2,
              webBgColor: "linear-gradient(to right, #021660, #021660)",
              textColor: Colors.white,
              msg: e.message ?? e.toString());
        }
        break;
      case 'bcert':
        bcertDateName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
            FirebaseStorage.instance.ref().child('pdfs/${bcertDateName}');
        UploadTask uploadTask = reference.putBlob(file);
        try {
          TaskSnapshot snapshot = await uploadTask;
          bcertUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            bcertUrl = bcertUrl;
          });
        } on FirebaseException catch (e) {
          Fluttertoast.showToast(
              timeInSecForIosWeb: 2,
              webBgColor: "linear-gradient(to right, #021660, #021660)",
              textColor: Colors.white,
              msg: e.message ?? e.toString());
        }
        break;
      case 'tscript':
        tscriptDateName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
            FirebaseStorage.instance.ref().child('pdfs/${tscriptDateName}');
        UploadTask uploadTask = reference.putBlob(file);
        try {
          TaskSnapshot snapshot = await uploadTask;
          tscriptUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            tscriptUrl = tscriptUrl;
          });
        } on FirebaseException catch (e) {
          Fluttertoast.showToast(
              timeInSecForIosWeb: 2,
              webBgColor: "linear-gradient(to right, #021660, #021660)",
              textColor: Colors.white,
              msg: e.message ?? e.toString());
        }
        break;
      case 'otherdoc':
        otherdocDateName = DateTime.now().millisecondsSinceEpoch.toString();
        Reference reference =
            FirebaseStorage.instance.ref().child('pdfs/${otherdocDateName}');
        UploadTask uploadTask = reference.putBlob(file);
        try {
          TaskSnapshot snapshot = await uploadTask;
          otherdocUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            otherdocUrl = otherdocUrl;
          });
        } on FirebaseException catch (e) {
          Fluttertoast.showToast(
              timeInSecForIosWeb: 2,
              webBgColor: "linear-gradient(to right, #021660, #021660)",
              textColor: Colors.white,
              msg: e.message ?? e.toString());
        }
        break;
      default:
        break;
    }
  }

  void deleteDoc(filename, scenario) async {
    // Create a reference to the file to delete
    final desertRef = FirebaseStorage.instance.ref().child('pdfs/${filename}');
    // Delete the file
    await desertRef.delete();

    switch (scenario) {
      case 'uace':
        setState(() {
          uaceUrl = '';
          uaceFilename = '';
          uaceDateName = '';
        });
        break;
      case 'uce':
        setState(() {
          uceUrl = '';
          uceFilename = '';
          uceDateName = '';
        });
        break;
      case 'bcert':
        setState(() {
          bcertUrl = '';
          bcertFilename = '';
          bcertDateName = '';
        });
        break;
      case 'tscript':
        setState(() {
          tscriptUrl = '';
          tscriptFilename = '';
          tscriptDateName = '';
        });
        break;
      case 'otherdoc':
        setState(() {
          otherdocUrl = '';
          otherdocFilename = '';
          otherdocDateName = '';
        });
        break;
      default:
        break;
    }
  }

  void _showArticleModal(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ArticleModal();
      },
    );
  }

  void _showMatchScoresModal(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MatchScoresModal();
      },
    );
  }

  // void _changeVal(String? newValue, int index) {
  //   setState(() {
  //     switch (index) {
  //       case 1:
  //         selectedValue = newValue!;
  //         break;
  //       case 2:
  //         selectedValue2 = newValue!;
  //         break;
  //       case 3:
  //         selectedValue3 = newValue!;
  //         break;
  //     }
  //   });
  // }

  void _showRegistrationModal(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LeagueRegModal();
      },
    );
  }

  void _showStandingsModal(BuildContext context) async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MatchStandingsModal();
      },
    );
  }

  Future<void> downloadPDFWeb() async {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();
// Create a reference with an initial file path and name
    final pathReference = storageRef.child("pdfs/acadReq.pdf");
    final String fileUrl = await pathReference.getDownloadURL();
    html.window.open(fileUrl, '_blank');
  }

  String createOrderId() {
    //create orderID
    //create order
    final DateTime now = DateTime.now();
    final String formatted = DateFormat('yyyy-MM-dd').format(now);
    var rng = Random();
    var rand = rng.nextInt(100000) + 100000;

    return formatted + " - ${rand.toInt()}";
  }

  Future sendOrder(OrderModel orderModel) async {
    await FirebaseFirestore.instance
        .collection(StringConsts.pathOrdersCollection)
        .doc(orderModel.id)
        .set(orderModel.toJson());
    print(orderModel);
    return true;
  }
}
