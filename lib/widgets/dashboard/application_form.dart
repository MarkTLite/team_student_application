import 'dart:html';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/string_consts.dart';
import '../profile_widget.dart';
import 'acadregForm.dart';
import 'educationalForm.dart';
import 'gInfoForm.dart';
import 'history_table.dart';
import 'ifpgForm.dart';
import 'sponsorForm.dart';

class ApplicationFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationFormWidget> {
  late bool isLoading;
  bool isUploaded = false;
  bool isPassUploaded = false;
  String imageURL = ''; // for thumbprint
  String imageUrl = '';
  String passImageURL = ''; //for passport photo
  String passImageUrl = '';
  late String serialNo;
  bool c1 = false; // Master's Choice of course
  bool c2 = false; // Undergrad
  bool c3 = false; //Cert
  String sign = ''; // Declaration sign
  String decDate = ''; // ''

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  color: const Color(0xFFE4E7E8),
                  padding: EdgeInsets.only(top: 20),
                  height: 150,
                  width: media.width * 0.32,
                  child: Image.asset(StringConsts.loginImages[1])),
              Container(
                color: Colors.black,
                height: 150,
                width: media.width * 0.45,
                child: Stack(
                  children: [
                    Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, left: 20),
                            child: Text('OFFICE OF THE ACADEMIC REGISTRAR',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Roboto',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                          ),
                          Divider(
                            color: Colors.white,
                            height: 3,
                            indent: media.width * 0.45 * 0.28,
                            endIndent: media.width * 0.45 * 0.25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, right: 100),
                            child: Text(
                              'APPLICATION FORM',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ]),
                    ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xFFE4E7E8),
                      ),
                      clipper: CustomClipPath(),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black,
                padding: EdgeInsets.only(top: 10, right: 3, left: 10),
                height: 190,
                width: media.width * 0.13,
                child: Column(children: [
                  Text('VISION STATEMENT',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                      'To be a hub of Professional Excellency through continued innovations in science, governance, research and entrepreneurship for Nations in the East African Regions and beyond.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                          height: 1.5,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, right: 3, left: 10),
                color: Colors.black,
                height: 190,
                width: media.width * 0.14,
                child: Column(children: [
                  Text('MISSION STATEMENT',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Divider(
                    color: Colors.white,
                  ),
                  Text(
                      'To provide transformative Educational experience for students, with intent to foster productive careers, meaningful livelihoods, and responsible citizenry in a global society.',
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.w500)),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, right: 3, left: 10),
                color: Colors.grey,
                height: 190,
                width: media.width * 0.08,
                child: Column(children: [
                  Text('MOTTO',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Empower for Generations',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          height: 1.5,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                ]),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, right: 3, left: 10),
                color: Colors.grey,
                height: 190,
                width: media.width * 0.09,
                child: Column(children: [
                  Text('CORE VALUES',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Professionalism, Innovation, Integrity, Excellency',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 12,
                          height: 1.5,
                          fontWeight: FontWeight.w500)),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                height: 250,
                width: media.width * 0.28,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('SERIAL No:    ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600)),
                          Text(serialGen(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Roboto',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(15)),
                            height: 180,
                            width: media.width * 0.14,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Center(
                                  child: ProfileImageWidget(
                                imagePath: isPassUploaded ? passImageURL : '',
                                imageUploader: getImage,
                                height: 180,
                                width: 180,
                                avatarClass: "passport",
                              )),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                // color: Colors.,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(15)),
                            height: 180,
                            width: media.width * 0.09,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Center(
                                  child: ProfileImageWidget(
                                imagePath: isUploaded ? imageURL : '',
                                imageUploader: getImage,
                                height: 180,
                                width: 100,
                                avatarClass: "thumbprint",
                              )),
                            ),
                          ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current Passport photo",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        Text("Right Hand Thumbprint",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 12,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                    Text("Upload good well Cropped pictures",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  alignment: Alignment.center,
                  // color: theme.primaryColor,
                  height: 120,
                  width: media.width * 0.2,
                  child: Text("COURSE APPLIED FOR: ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.w600))),
              Container(
                // color: theme.primaryColor,
                height: 120,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: media.width * 0.1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Master's / Post Graduate Diploma",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              // color: Colors.,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1)),
                          child: (!c2 && !c3)
                              ? Checkbox(
                                  value: c1,
                                  onChanged: (value) {
                                    setState(() {
                                      c1 = c1 ? false : true;
                                    });
                                  })
                              : Container(
                                  color: Colors.grey,
                                  child: Center(child: Text("N/A"))))
                    ]),
              ),
              Container(
                // color: theme.primaryColor,
                height: 120,
                padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                width: media.width * 0.1,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text("Undergraduate Programme",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              // color: Colors.,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1)),
                          child: (!c1 && !c3)
                              ? Checkbox(
                                  value: c2,
                                  onChanged: (value) {
                                    setState(() {
                                      c2 = c2 ? false : true;
                                    });
                                  })
                              : Container(
                                  color: Colors.grey,
                                  child: Center(child: Text("N/A"))))
                    ]),
              ),
              Container(
                // color: theme.primaryColor,
                height: 120,
                width: media.width * 0.3,
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Text("Diploma / Certificates",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Roboto',
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                      Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(right: 20),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  // color: Colors.,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(1)),
                              child: (!c2 && !c1)
                                  ? Checkbox(
                                      value: c3,
                                      onChanged: (value) {
                                        setState(() {
                                          c3 = c3 ? false : true;
                                        });
                                      })
                                  : Container(
                                      color: Colors.grey,
                                      child: Center(child: Text("N/A")))),
                          Text("(Tick Where Applicable)",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600))
                        ],
                      )
                    ]),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("1.0 GENERAL INFORMATION",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 5,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            // height: 700,
            color: Colors.transparent,
            child: GInfoForm(),
          ),
          Container(
            height: 150,
            margin: EdgeInsets.only(top: 10),
            width: media.width,
            // color: theme.primaryColor,
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
              width: 8,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  // color: theme.primaryColor,
                  height: 130,
                  width: media.width * 0.1,
                  child: Icon(Icons.call, size: 50),
                ),
                Container(
                  // color: theme.primaryColor,
                  alignment: Alignment.center,
                  height: 130,
                  width: media.width * 0.1,
                  child: Text(
                      "0782-752226\n0772-644712\n0783-816127\n0751-998943",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          height: 1.5,
                          fontWeight: FontWeight.w700)),
                ),
                Container(
                    // color: theme.primaryColor,
                    alignment: Alignment.center,
                    height: 130,
                    width: media.width * 0.1,
                    child: Icon(Icons.house, size: 50)),
                Container(
                    // color: theme.primaryColor,
                    alignment: Alignment.center,
                    height: 130,
                    width: media.width * 0.15,
                    child: Text(
                        "Plot 446 Kabaka A'njagala Road\n(near Kabaka A'njagala Roundabout) Kampala",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            height: 1.5,
                            fontWeight: FontWeight.w700))),
                Container(
                    // color: theme.primaryColor,
                    alignment: Alignment.center,
                    height: 130,
                    width: media.width * 0.1,
                    child: Icon(Icons.web, size: 50)),
                Container(
                    // color: theme.primaryColor,
                    height: 130,
                    alignment: Alignment.center,
                    width: media.width * 0.2,
                    child: Text(
                        "info@teamuniversity.ac.ug\nwww.teamuniversity.ac.ug",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 18,
                            height: 1.5,
                            fontWeight: FontWeight.w700))),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25, bottom: 3),
            alignment: Alignment.centerLeft,
            child: Text("2.0 UNDER THE PRIVATE SPONSORSHIP SCHEME",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("2.1 SCHOOL OF GRADUATE STUDIES AND RESEARCH",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            // height: 550,
            width: media.width,
            child: HistoryTable(
              coursesList: const [
                "Masters of Public Health (Health Promotion and Education Option/ Health Services Management Option) MPH",
                "Masters of Business Administration (MBA)",
                "Masters of Public Administration and Management (MPAM)",
                "Masters of Educational Planning and Management (MEPM)",
                "Masters of Science in Human Resource Management (MSHRM)",
                "Masters of Science in Finance (MSF)",
                "Masters of Science in Procurement and Logistics Management (MSPLM)",
                "Post Graduate Diploma in Business Administration (PDBA)",
                "Post Graduate Diploma in Public Administration and Management (PDPAM)",
                "Post Graduate Diploma in Human Resource Management (PDHRM)",
                "Post Graduate Diploma in Finance (PDF)",
                "Post Graduate Diploma in Procurement and Logistics Management (PDPLM)",
                "Post Graduate Diploma in Project Planning and Management (PDPPM)",
                "Post Graduate Diploma in Educational Planning and Management (PDEPM)",
                "Post Graduate Diploma in Public Health (PDPH)"
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 3),
              // color: theme.primaryColor,
              height: 100,
              width: media.width,
              child: Column(
                children: [
                  Text("All programs are on weekend",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                        "NOTE: Holders of relevant Post graduate diplomas with good grades from a recognized institution may be exempted year 1",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                  ),
                  Text(
                      "Post secondary school qualifications attained (Degree, Professional, Qualification, Diploma, Certificate or the equivalent),\n You must attach a certified copy of the transcript, in addition to photocopies of UCE and UACE where applicable",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("2.2 FACULTY OF APPLIED SCIENCES",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            // height: 550,
            width: media.width,
            child: HistoryTable(
              coursesList: const [
                "Bachelor of Science in Computer Science (BSCS)",
                "Bachelor of Information Technology (BIT)",
                "Bachelor of Science in Public Health (BSPH)",
                "Bachelor of Health Services Management (BHSM)",
                "Bachelor of Agriculture and Community Development (BACD)",
                "Bachelor of Environmental Science (BES)",
                "Bachelor of Science in Agribusiness Management (BSA)",
                "Bachelor of Nursing Sciences (BNS)",
                "Diploma in Nursing Science (DNS)",
                "Diploma in Public Health (DPH)",
                "Diploma in Medical Records and Informatics (DMRI)",
                "Diploma in Information Technology (DIT)",
                "Diploma in Agricultural and Community Development (DACD)",
                "National Diploma in Building and Civil Engineering (NDBCE)",
                "National Diploma in Electrical Engineering (NDEE)",
                "National Certificate in Electronical Installation Systems & Maintenence (NCEISM)",
                "National Certificate in Plumbing (NCP)",
                "National Certificate in Building and Construction (NCBC)",
                "Certificate in Medical Records (CMR)",
                "National Certificate in Information and Communication (CIC)",
                "Certificate in Nursing (CN)",
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("2.3 FACULTY OF SOCIAL SCIENCES AND GOVERNANCES",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // color: theme.primaryColor,
              // height: 350,
              width: media.width,
              child: HistoryTable(
                coursesList: const [
                  "Bachelor of Arts in Journalism and Media Studies (BAJM)",
                  "Bachelor of International Relations and Diplomacy (BIRD)",
                  "Bachelor of Public Administration and Management (BPAM)",
                  "Bachelor of Social Work and Social Administration (SWASA)",
                  "Diploma in Journalism (DJ)",
                  "Diploma in Public Administration and Management (DPAM)",
                  "Diploma in Social Work and Social Administration (DSWSA)",
                  "Certificate in Public Administration and Management (CPAM)",
                  "Certificate in Social Work (CSW)",
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("2.4 FACULTY OF EDUCATION",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            // height: 350,
            width: media.width,
            child: HistoryTable(
              coursesList: const [
                "Bachelor of Arts with Education — Secondary (BAES)",
                "Bachelor of Business Studies with Education (BBSE)",
                "Bachelor of Education — Primary (BEP)",
                "Bachelor of Early Childhood Care and Education (BECE)",
                "Bachelor of Arts with Education (BAE)",
                "Diploma in Education — Primary (DEP)",
                "Diploma in Early Childhood. Care and Education (DECCE)",
                "Certificate in Nursery Teaching (CNT)",
                "Certificate in Early Childhood Development (CECD)",
                "Higher Education Certificate (HEC) 1",
                "Foundation Certificate Programme (FCP) 2",
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
                "Note: (1) is for A level holders with atleast a subsidiary in a principal subject (2) is for International students",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("2.5 FACULTY OF BUSINESS AND MANAGEMENT",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // color: theme.primaryColor,
              // height: 350,
              width: media.width,
              child: HistoryTable(
                coursesList: const [
                  "Bachelor of Science in Accounting and Finance (BSAF)",
                  'Bachelor of Business Administration (BBA)',
                  'Bachelor of Administrative and Secretarial Practice (BASP)',
                  'Diploma in Accounting and Finance (DAF)',
                  'Diploma in Business Administration (DBA)',
                  'Diploma in Administrative and Secretarial Practice (DASP)',
                  'Diploma in Procurement and Logistics Management (DPLM)',
                  'Certificate in Business Administration (CBA)',
                  'Certificate in Secretarial Studies (CSS)',
                  'Certificate in Accounting & Finarre (CAF)',
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
                "3.0 EDUCATIONAL BACKGROUND (Attach photocopies of academic documents)",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // color: theme.primaryColor,
              width: media.width,
              child: EducationalForm()),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("4.0 CHOICE OF STUDY TIME APPLIED FOR",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            // height: 350,
            width: media.width,
            child: HistoryTable(
              coursesList: [
                "Day",
                "Evening",
                "Weekend",
                "Distance Learning / Inservice"
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("5.0 ADDITIONAL INFORMATION:",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            // height: 350,
            alignment: Alignment.centerLeft,
            width: media.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                      "i) Holders of relevant Diploma with good grades from recognized Institutions may be exempted year one on a related Bachelor's Degree. ",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.w500)),
                  Text(
                      "ii) Applicants are strongly warned that presentation of forged or other people's Academic documents in support of their application when discovered either at registration or afterwards will automatically lead to CANCELATION of Admission and prosecution in courts of law.",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.w500)),
                  Text(
                      "iii) The University has the right to nullify any admission done n error or for any other reason/cause.",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  Text(
                      "iv) Foundation certificate Programme (FCP) is a bridging course and for one (1) year for International Students and on completion. the student is admitted on a Bachelors degree.",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                  Text(
                      "v) Higher Education Certificate (HEC) is a bridging course to either a Diploma or Bachelor course for students that have undertaken National Examinations (UNEB) at UACE and attained atleast a subsidiary in a principle subject.",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500))
                ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("6.0 SPONSORSHIP",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // color: theme.primaryColor,
              // height: 150,
              width: media.width,
              child: SponsorshipForm()),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("7.0 INFORMATION ABOUT PARENTS/GUARDIAN",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              // color: theme.primaryColor,
              // height: 350,
              width: media.width,
              child: IPGForm()),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("8.0 DECLARATION BY THE APPLICANT",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            height: 60,
            width: media.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                  "I declare that to the best of my knowledge the information given on this form is correct"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: media.width * 0.4,
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: const BoxDecoration(
                      // color: Color(0x486598C7),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextFormField(
                      scrollPadding: EdgeInsets.all(0),
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Open Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        // hintText: "Input your full name",
                        // labelText: "SURNAME",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 2),
                          child: Text("Signature of the applicant:    ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        sign = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'Enter a valid surname';
                        else
                          return null;
                      },
                    ),
                  ),
                  Container(
                    height: 30,
                    width: media.width * 0.3,
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    decoration: const BoxDecoration(
                      // color: Color(0x486598C7),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    child: TextFormField(
                      scrollPadding: EdgeInsets.all(0),
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Open Sans',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        // hintText: "Input your full name",
                        // labelText: "SURNAME",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 2),
                          child: Text("Date:    ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Roboto',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.black, style: BorderStyle.solid),
                        ),
                      ),
                      onChanged: (val) => setState(() {
                        decDate = val.trim();
                      }),
                      validator: (emVal) {
                        String pattern = r"^[a-zA-Z]";
                        RegExp regex = RegExp(pattern);
                        if (emVal == null ||
                            emVal.isEmpty ||
                            !regex.hasMatch(emVal))
                          return 'Enter a valid surname';
                        else
                          return null;
                      },
                    ),
                  ),
                ],
              ),
            ]),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text("9.0 FOR ACADEMIC REGISTRAR'S USE ONLY",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    wordSpacing: 3,
                    fontWeight: FontWeight.w700)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // color: theme.primaryColor,
            // height: 350,
            width: media.width,
            child: AcadRegForm(),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.centerLeft,
            child: Text(
                "This Application form is only valid if a fee of 50,000 Ushs is paid and the receipt atached with" +
                    "the application"),
          ),
        ],
      )),
    );
  }

  Future getImage(String scenario) async {
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

  void uploadImageFile(file, scenario) async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference =
        FirebaseStorage.instance.ref().child('images/${fileName}');
    //var bytes = await pickedFile?.readAsBytes();
    UploadTask uploadTask = reference.putBlob(file);
    try {
      TaskSnapshot snapshot = await uploadTask;
      switch (scenario) {
        case 'thumbprint':
          imageUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            imageURL = imageUrl;
            isUploaded = true;
          });
          break;

        case 'passport':
          passImageUrl = await snapshot.ref.getDownloadURL();
          setState(() {
            passImageURL = passImageUrl;
            isPassUploaded = true;
          });
          break;
      }
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

  String serialGen() {
    final now = DateTime.now();
    serialNo = '${now.millisecondsSinceEpoch % 100000000}';
    return serialNo;
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 200);
    path.lineTo(60, 200);
    path.lineTo(200, 0);
    path.lineTo(30, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
