
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:chat360/Configs/Dbpaths.dart';
import 'package:chat360/Configs/Enum.dart';
import 'package:chat360/Configs/app_constants.dart';
import 'package:chat360/Screens/homepage/homepage.dart';
import 'package:chat360/Services/Providers/call_history_provider.dart';
import 'package:chat360/Services/localization/language_constants.dart';
import 'package:chat360/Screens/calling_screen/audio_call.dart';
import 'package:chat360/Screens/calling_screen/video_call.dart';
import 'package:chat360/widgets/Common/cached_image.dart';
import 'package:chat360/Utils/open_settings.dart';
import 'package:chat360/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:chat360/Models/call.dart';
import 'package:chat360/Models/call_methods.dart';
import 'package:chat360/Utils/permissions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:audioplayers/audioplayers.dart' as audioPlayers;


// ignore: must_be_immutable
class PickupScreen extends StatefulWidget {
  final Call call;
  final String? currentuseruid;
  final SharedPreferences prefs;

  PickupScreen({
    required this.call,
    required this.currentuseruid,
    required this.prefs,
  });

  @override
  State<PickupScreen> createState() => _PickupScreenState();
}
class _PickupScreenState extends State<PickupScreen> {
  final CallMethods callMethods = CallMethods();

  late audioPlayers.AudioPlayer player;
  onCall()async{
    AudioCache audioCache = AudioCache();

    print("oncall");
    player = await audioCache.play('sounds/callingtone.mp3', volume: 100);
  }

  ClientRole _role = ClientRole.Broadcaster;
@override
  void initState() {
   onCall();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Consumer<FirestoreDataProviderCALLHISTORY>(
        builder: (context, firestoreDataProviderCALLHISTORY, _child) => h > w &&
                ((h / w) > 1.5)
            ? Scaffold(
                backgroundColor: chat360DeepGreen,
                body: Container(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).padding.top),
                        color: DESIGN_TYPE == Themetype.messenger
                            ? chat360DeepGreen
                            : chat360DeepGreen,
                        height: h / 4,
                        width: w,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 7,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  widget.call.isvideocall == true
                                      ? Icons.videocam
                                      : Icons.mic_rounded,
                                  size: 40,
                                  color: DESIGN_TYPE == Themetype.whatsapp
                                      ? chat360LightGreen
                                      : Colors.white.withOpacity(0.5),
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  widget.call.isvideocall == true
                                      ? getTranslated(context, 'incomingvideo')
                                      : getTranslated(context, 'incomingaudio'),
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: DESIGN_TYPE == Themetype.whatsapp
                                          ? chat360LightGreen
                                          : Colors.white.withOpacity(0.5),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h / 9,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 7),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    child: Text(
                                      widget.call.callerName!,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: DESIGN_TYPE == Themetype.whatsapp
                                            ? chat360White
                                            : chat360White,
                                        fontSize: 27,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    widget.call.callerId!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: DESIGN_TYPE == Themetype.whatsapp
                                          ? chat360White.withOpacity(0.34)
                                          : chat360White.withOpacity(0.34),
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // SizedBox(height: h / 25),

                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      widget.call.callerPic == null || widget.call.callerPic == ''
                          ? Container(
                              height: w + (w / 140),
                              width: w,
                              color: Colors.white12,
                              child: Icon(
                                Icons.person,
                                size: 140,
                                color: chat360DeepGreen,
                              ),
                            )
                          : Stack(
                              children: [
                                Container(
                                    height: w + (w / 140),
                                    width: w,
                                    color: Colors.white12,
                                    child: CachedNetworkImage(
                                      imageUrl: widget.call.callerPic!,
                                      fit: BoxFit.cover,
                                      height: w + (w / 140),
                                      width: w,
                                      placeholder: (context, url) => Center(
                                          child: Container(
                                        height: w + (w / 140),
                                        width: w,
                                        color: Colors.white12,
                                        child: Icon(
                                          Icons.person,
                                          size: 140,
                                          color: chat360DeepGreen,
                                        ),
                                      )),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        height: w + (w / 140),
                                        width: w,
                                        color: Colors.white12,
                                        child: Icon(
                                          Icons.person,
                                          size: 140,
                                          color: chat360DeepGreen,
                                        ),
                                      ),
                                    )),
                                Container(
                                  height: w + (w / 140),
                                  width: w,
                                  color: Colors.black.withOpacity(0.18),
                                ),
                              ],
                            ),
                      Container(
                        height: h / 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () async {
                                player.stop();
                                flutterLocalNotificationsPlugin.cancelAll();
                                await callMethods.endCall(call: widget.call);
                                FirebaseFirestore.instance
                                    .collection(DbPaths.collectionusers)
                                    .doc(widget.call.callerId)
                                    .collection(DbPaths.collectioncallhistory)
                                    .doc(widget.call.timeepoch.toString())
                                    .set({
                                  'STATUS': 'rejected',
                                  'ENDED': DateTime.now(),
                                }, SetOptions(merge: true));
                                FirebaseFirestore.instance
                                    .collection(DbPaths.collectionusers)
                                    .doc(widget.call.receiverId)
                                    .collection(DbPaths.collectioncallhistory)
                                    .doc(widget.call.timeepoch.toString())
                                    .set({
                                  'STATUS': 'rejected',
                                  'ENDED': DateTime.now(),
                                }, SetOptions(merge: true));
                                //----------
                                // await FirebaseFirestore.instance
                                //     .collection(DbPaths.collectionusers)
                                //     .doc(call.receiverId)
                                //     .collection('recent')
                                //     .doc('callended')
                                //     .delete();

                                // await FirebaseFirestore.instance
                                //     .collection(DbPaths.collectionusers)
                                //     .doc(call.receiverId)
                                //     .collection('recent')
                                //     .doc('callended')
                                //     .set({
                                //   'id': call.receiverId,
                                //   'ENDED': DateTime.now().millisecondsSinceEpoch
                                // });
                                await FirebaseFirestore.instance
                                    .collection(DbPaths.collectionusers)
                                    .doc(widget.call.callerId)
                                    .collection('recent')
                                    .doc('callended')
                                    .delete();
                                Future.delayed(
                                    const Duration(milliseconds: 200),
                                    () async {
                                  await FirebaseFirestore.instance
                                      .collection(DbPaths.collectionusers)
                                      .doc(widget.call.callerId)
                                      .collection('recent')
                                      .doc('callended')
                                      .set({
                                    'id': widget.call.callerId,
                                    'ENDED':
                                        DateTime.now().millisecondsSinceEpoch
                                  });
                                });

                                firestoreDataProviderCALLHISTORY.fetchNextData(
                                    'CALLHISTORY',
                                    FirebaseFirestore.instance
                                        .collection(DbPaths.collectionusers)
                                        .doc(widget.call.receiverId)
                                        .collection(
                                            DbPaths.collectioncallhistory)
                                        .orderBy('TIME', descending: true)
                                        .limit(14),
                                    true);
                                flutterLocalNotificationsPlugin.cancelAll();
                              },
                              child: Icon(
                                Icons.call_end,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              shape: CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.redAccent,
                              padding: const EdgeInsets.all(15.0),
                            ),
                            SizedBox(width: 45),
                            RawMaterialButton(
                              onPressed: () async {
                                player.stop();
                                flutterLocalNotificationsPlugin.cancelAll();
                                await Permissions
                                        .cameraAndMicrophonePermissionsGranted()
                                    .then((isgranted) async {
                                  if (isgranted == true) {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => widget.call
                                                    .isvideocall ==
                                                true
                                            ? VideoCall(
                                                prefs: widget.prefs,
                                                currentuseruid: widget.currentuseruid!,
                                                call: widget.call,
                                                channelName: widget.call.channelId!,
                                                role: _role,
                                              )
                                            : AudioCall(
                                                prefs: widget.prefs,
                                                currentuseruid: widget.currentuseruid,
                                                call: widget.call,
                                                channelName: widget.call.channelId,
                                                role: _role,
                                              ),
                                      ),
                                    );
                                  } else {
                                    chat360.showRationale(
                                        getTranslated(context, 'pmc'));
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                OpenSettings()));
                                  }
                                }).catchError((onError) {
                                  chat360.showRationale(
                                      getTranslated(context, 'pmc'));
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              OpenSettings()));
                                });
                              },
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              shape: CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.green[400],
                              padding: const EdgeInsets.all(15.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
            : Scaffold(
                backgroundColor: DESIGN_TYPE == Themetype.whatsapp
                    ? chat360green
                    : chat360White,
                body: SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: w > h ? 60 : 100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        w > h
                            ? SizedBox(
                                height: 0,
                              )
                            : Icon(
                                widget.call.isvideocall == true
                                    ? Icons.videocam_outlined
                                    : Icons.mic,
                                size: 80,
                                color: DESIGN_TYPE == Themetype.whatsapp
                                    ? chat360White.withOpacity(0.3)
                                    : chat360Black.withOpacity(0.3),
                              ),
                        w > h
                            ? SizedBox(
                                height: 0,
                              )
                            : SizedBox(
                                height: 20,
                              ),
                        Text(
                          widget.call.isvideocall == true
                              ? getTranslated(context, 'incomingvideo')
                              : getTranslated(context, 'incomingaudio'),
                          style: TextStyle(
                            fontSize: 19,
                            color: DESIGN_TYPE == Themetype.whatsapp
                                ? chat360White.withOpacity(0.54)
                                : chat360Black.withOpacity(0.54),
                          ),
                        ),
                        SizedBox(height: w > h ? 16 : 50),
                        CachedImage(
                          widget.call.callerPic,
                          isRound: true,
                          height: w > h ? 60 : 110,
                          width: w > h ? 60 : 110,
                          radius: w > h ? 70 : 138,
                        ),
                        SizedBox(height: 15),
                        Text(
                          widget.call.callerName!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: DESIGN_TYPE == Themetype.whatsapp
                                ? chat360White
                                : chat360Black,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: w > h ? 30 : 75),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () async {
                                player.stop();
                                flutterLocalNotificationsPlugin.cancelAll();
                                await callMethods.endCall(call: widget.call);
                                FirebaseFirestore.instance
                                    .collection(DbPaths.collectionusers)
                                    .doc(widget.call.callerId)
                                    .collection(DbPaths.collectioncallhistory)
                                    .doc(widget.call.timeepoch.toString())
                                    .set({
                                  'STATUS': 'rejected',
                                  'ENDED': DateTime.now(),
                                }, SetOptions(merge: true));
                                FirebaseFirestore.instance
                                    .collection(DbPaths.collectionusers)
                                    .doc(widget.call.receiverId)
                                    .collection(DbPaths.collectioncallhistory)
                                    .doc(widget.call.timeepoch.toString())
                                    .set({
                                  'STATUS': 'rejected',
                                  'ENDED': DateTime.now(),
                                }, SetOptions(merge: true));
                                //----------
                                await FirebaseFirestore.instance
                                    .collection(DbPaths.collectionusers)
                                    .doc(widget.call.callerId)
                                    .collection('recent')
                                    .doc('callended')
                                    .delete();
                                Future.delayed(
                                    const Duration(milliseconds: 200),
                                    () async {
                                  await FirebaseFirestore.instance
                                      .collection(DbPaths.collectionusers)
                                      .doc(widget.call.callerId)
                                      .collection('recent')
                                      .doc('callended')
                                      .set({
                                    'id': widget.call.callerId,
                                    'ENDED':
                                        DateTime.now().millisecondsSinceEpoch
                                  });
                                });

                                firestoreDataProviderCALLHISTORY.fetchNextData(
                                    'CALLHISTORY',
                                    FirebaseFirestore.instance
                                        .collection(DbPaths.collectionusers)
                                        .doc(widget.call.receiverId)
                                        .collection(
                                            DbPaths.collectioncallhistory)
                                        .orderBy('TIME', descending: true)
                                        .limit(14),
                                    true);
                                flutterLocalNotificationsPlugin.cancelAll();
                              },
                              child: Icon(
                                Icons.call_end,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              shape: CircleBorder(),
                              elevation: 2.0,
                              fillColor: Colors.redAccent,
                              padding: const EdgeInsets.all(15.0),
                            ),
                            SizedBox(width: 45),
                            RawMaterialButton(
                              onPressed: () async {
                                player.stop();
                                flutterLocalNotificationsPlugin.cancelAll();
                                await Permissions
                                        .cameraAndMicrophonePermissionsGranted()
                                    .then((isgranted) async {
                                  if (isgranted == true) {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => widget.call
                                                    .isvideocall ==
                                                true
                                            ? VideoCall(
                                                prefs: widget.prefs,
                                                currentuseruid: widget.currentuseruid!,
                                                call: widget.call,
                                                channelName: widget.call.channelId!,
                                                role: _role,
                                              )
                                            : AudioCall(
                                                prefs: widget.prefs,
                                                currentuseruid: widget.currentuseruid,
                                                call: widget.call,
                                                channelName: widget.call.channelId,
                                                role: _role,
                                              ),
                                      ),
                                    );
                                  } else {
                                    chat360.showRationale(
                                        getTranslated(context, 'pmc'));
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                OpenSettings()));
                                  }
                                }).catchError((onError) {
                                  chat360.showRationale(
                                      getTranslated(context, 'pmc'));
                                  Navigator.push(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              OpenSettings()));
                                });
                              },
                              child: Icon(
                                Icons.call,
                                color: Colors.white,
                                size: 35.0,
                              ),
                              shape: CircleBorder(),
                              elevation: 2.0,
                              fillColor: chat360LightGreen,
                              padding: const EdgeInsets.all(15.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
  }
}
