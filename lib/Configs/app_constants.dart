
import 'package:chat360/Configs/Enum.dart';
import 'package:flutter/material.dart';

//-**********---------- WHATSAPP Color Theme: -------------------------
final chat360Black = new Color(0xFF1E1E1E);
final chat360Blue = new Color(0xFF02ac88);
final chat360DeepGreen = Color.fromRGBO(73, 75, 162, 1);
final chat360LightGreen =Color.fromRGBO(105, 106, 171, 1);
final chat360green = Color.fromRGBO(105, 106, 171, 1);
final chat360teagreen = new Color(0xFFe9fedf);
final chat360White = Colors.white;
final chat360Grey = Color(0xff85959f);
final chat360Chatbackground = new Color(0xffe8ded5);
const DESIGN_TYPE = Themetype.whatsapp;
const IsSplashOnlySolidColor = false;
const SplashBackgroundSolidColor =  Color.fromRGBO(73, 75, 162, 1);//applies this colors to fill the areas around splash screen.  Color Code: 0xFF01826b for Whatsapp theme & 0xFFFFFFFF for messenger theme.
final statusBarColor = chat360DeepGreen;
final isDarkIconsinStatusBar =
    false; // This Color will be applied to status bar across the App if App is messenger theme. For whatsapp theme, it picks the color automatically.

//*--Admob Configurations- (By default Test Ad Units pasted)----------
const IsBannerAdShow =
    false; // Set this to 'true' if you want to show Banner ads throughout the app
const Admob_BannerAdUnitID_Android =
    'ca-app-pub-3940256099942544/6300978111'; // Test Id: 'ca-app-pub-3940256099942544/6300978111'
const Admob_BannerAdUnitID_Ios =
    'ca-app-pub-3940256099942544/2934735716'; // Test Id: 'ca-app-pub-3940256099942544/2934735716'
const IsInterstitialAdShow =
    false; // Set this to 'true' if you want to show Interstitial ads throughout the app
const Admob_InterstitialAdUnitID_Android =
    'ca-app-pub-3940256099942544/1033173712'; // Test Id:  'ca-app-pub-3940256099942544/1033173712'
const Admob_InterstitialAdUnitID_Ios =
    'ca-app-pub-3940256099942544/4411468910'; // Test Id: 'ca-app-pub-3940256099942544/4411468910'
const IsVideoAdShow =
    false; // Set this to 'true' if you want to show Video ads throughout the app
const Admob_RewardedAdUnitID_Android =
    'ca-app-pub-3940256099942544/5224354917'; // Test Id: 'ca-app-pub-3940256099942544/5224354917'
const Admob_RewardedAdUnitID_Ios =
    'ca-app-pub-3940256099942544/1712485313'; // Test Id: 'ca-app-pub-3940256099942544/1712485313'
//Also don't forget to Change the Admob App Id in "chat360/android/app/src/main/AndroidManifest.xml" & "chat360/ios/Runner/Info.plist"

//*--Agora Configurations---
const Agora_APP_IDD =
    '337bb4522dbe4ebd9d7338668703035d'; // Grab it from: https://www.agora.io/en/
const dynamic Agora_TOKEN =
    null; // not required until you have planned to setup high level of authentication of users in Agora.

//*--Giphy Configurations---
const GiphyAPIKey =
    'MUlrfWiTuTJBr0V6rEU6Q9IgdloDTrMT'; // Grab it from: https://developers.giphy.com/

//*--App Configurations---
const Appname =
    'Chat 360'; //app name shown evrywhere with the app where required
const DEFAULT_COUNTTRYCODE_ISO =
    'IN'; //default country ISO 2 letter for login screen
const DEFAULT_COUNTTRYCODE_NUMBER =
    '+91'; //default country code number for login screen
const FONTFAMILY_NAME =
    null; // make sure you have registered the font in pubspec.yaml

//--WARNING----- PLEASE DONT EDIT THE BELOW LINES UNLESS YOU ARE A DEVELOPER -------
const SplashPath = 'assets/images/chat.png';
const AppLogoPath = 'assets/images/logo.png';
