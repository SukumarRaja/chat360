
import 'package:chat360/Configs/app_constants.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  final bool? isShowOnlySpinner;

  Splashscreen({this.isShowOnlySpinner = false});
  @override
  Widget build(BuildContext context) {
    return IsSplashOnlySolidColor == true || this.isShowOnlySpinner == true
        ? Scaffold(
            backgroundColor: SplashBackgroundSolidColor,
            body: Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(chat360LightGreen)),
            ))
        : Scaffold(
            backgroundColor: SplashBackgroundSolidColor,
            body: Center(
                child: Image.asset(
              '$SplashPath',
              width: double.infinity,
              fit: MediaQuery.of(context).size.height >
                      MediaQuery.of(context).size.width
                  ? BoxFit.cover
                  : BoxFit.fitHeight,
              height: MediaQuery.of(context).size.height,
            )),
          );
  }
}
