import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info/device_info.dart';
import 'package:chat360/Configs/Dbkeys.dart';
import 'package:chat360/Configs/app_constants.dart';
import 'package:chat360/Screens/homepage/homepage.dart';
import 'package:chat360/Screens/splash_screen/splash_screen.dart';
import 'package:chat360/Utils/batch_write_component.dart';
import 'package:chat360/Utils/error_codes.dart';
import 'package:chat360/Utils/unawaited.dart';
import 'package:chat360/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as web;

class Initialize extends StatefulWidget {
  const Initialize(
      {Key? key,
      required this.prefs,
      required this.app,
      required this.doc,
      this.id})
      : super(key: key);

  final SharedPreferences prefs;
  final String? id;
  final String app;
  final String doc;

  @override
  _InitializeState createState() => _InitializeState();
}

class _InitializeState extends State<Initialize> {
  bool isprocessing = true;
  bool iscircleprogressindicator = false;
  bool isSecuritySetupPending = false;
  String securityRuleName = "";
  bool isready = false;
  var mapDeviceInfo = {};
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? deviceid;
  bool isemulator = false;
  var doc;
  Color mycolor = chat360DeepGreen;
  String platform = "";
  bool isDocHave = false;

  initialise() async {
    print("doc is $doc");
    platform = Platform.isIOS
        ? "ios"
        : Platform.isAndroid
            ? "android"
            : "web";
    setState(() {
      k1 = K1;
      k2 = K2;
      k3 = K3;
      k4 = K4;
      k5 = K5;
      k6 = K6;
      k7 = K7;
      project = K8;
    });

    await FirebaseFirestore.instance
        .collection("appsettings")
        .doc("userapp")
        .get()
        .then((firestoredoc) async {
      print("jkhjk $firestoredoc");
      if (firestoredoc.exists) {
        var fd = firestoredoc.data();
        isDocHave = fd!.containsKey(Dbkeys.latestappversionandroid);
        print("key is ${fd.containsKey('5fy6dtg')}");

        if (!fd.containsKey("5fy6dtg")) {
          print("key obtain ${fd.containsKey('5fy6dtg')}");

          setState(() {
            iscircleprogressindicator = false;
            isprocessing = false;
            k7 = "s384tvrhd74fnacs3r92gt3urv";
          });
        } else {
          print("no data ${fd['3h64ft']}");
          if (fd['3h64ft'] != null) {
            Codec<String, String> stringToBase64 = utf8.fuse(base64);
            String v = fd["3h64ft"];
            print("version is $v");
            print('INSTALLED VERSION : ${int.parse(v)}');
            print('CURRENT VERSION : ${int.parse(k4)}');
            if (int.parse(v) >= int.parse(k4)) {
              setState(() {
                doc = firestoredoc;
                print("after doc is $doc");

                isready = true;
                iscircleprogressindicator = false;
                isprocessing = false;
              });
            } else {
              setState(() {
                doc = firestoredoc;
                iscircleprogressindicator = false;
                isprocessing = false;
                k7 = "kj485bfud87jxh9824hdb";
              });
            }
          } else {
            showERRORSheet(this.context, "7034");
          }
        }
      } else {
        setState(() {
          iscircleprogressindicator = false;
          isprocessing = false;
          k7 = "s384tvrhd74fnacs3r92gt3urv";
        });
      }
    }).catchError((onError) async {
      print("catech error is $onError");
      if (onError.message.toString().contains("permission") ||
          onError.message.toString().contains("missing") ||
          onError.message.toString().contains("denied") ||
          onError.message.toString().contains("permissions") ||
          onError.message.toString().contains("insufficient")) {
        this.isSecuritySetupPending = true;
        securityRuleName = "SECURITY RULES TEST ENVIRONMENT";
        setState(() {});
      } else {
        setState(() {
          iscircleprogressindicator = false;
          isinstalled = false;
        });
        showERRORSheet(this.context, "7121",
            message: onError.message.toString());
      }
    });
  }

  String maintaincemssg = "";

  @override
  void initState() {
    initialise();

    super.initState();
  }

  String ss446gpy5 = '';
  String sspf7fke84 = '';
  String sse06rfgk = '';
  String ss5fy6dtg = '';
  String ssgfy5p6 = '';
  String ssck86gb = '';
  String ssp2494hdj = '';
  String ss3h64ft = '';
  String sshl29dvik = '';
  String ssk4xpf648 = '';
  String ssI39489sn = '';
  String ssg236dt65 = '';
  var id;
  bool isinstalled = false;
  FirebaseApp? app = Firebase.app();

  final _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  String project = "";
  String k1 = '';
  String k2 = '';
  String k3 = '';
  String k4 = '';
  String k5 = '';
  String k6 = '';
  String k7 = '';

  // ignore: unused_field
  String _code = '';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(" id is ${app!.options.projectId}");
    var w = MediaQuery.of(this.context).size.width;
    var h = MediaQuery.of(this.context).size.height;
    return isSecuritySetupPending == true
        ? Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topRight,
                    height: 6,
                  ),
                  Icon(
                    Icons.error_outline_rounded,
                    color: Colors.pink[400],
                    size: 80,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Firebase Security Rules Pending Setup",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.4, fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "Firebase Security Rules are currently not set as required for this task. Kindly setup the Security Rules as instructed in the Installation Guide & RESTART the app to proceed ahead.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2, fontSize: 13, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Kindly copy the security rules code provided in Source Code INSTALLATION GUIDE and paste it in your:\n\n  Firebase Dashboard -> Firestore Database -> Rule\n\n  Firebase Dashboard -> Storage -> Rules",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        height: 1.2,
                        color: Colors.orange[800],
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        : isprocessing == true
            ? Splashscreen()
            : Homepage(
                doc: doc!, currentUserNo: widget.id, prefs: widget.prefs);
  }

  String reverse(String string) {
    if (string.length < 2) {
      return string;
    }

    final characters = Characters(string);
    return characters.toList().reversed.join();
  }
}
