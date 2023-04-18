
import 'package:chat360/Configs/app_constants.dart';
import 'package:chat360/Services/localization/language_constants.dart';
import 'package:chat360/Utils/utils.dart';
import 'package:chat360/widgets/MyElevatedButton/MyElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenSettings extends StatefulWidget {
  @override
  State<OpenSettings> createState() => _OpenSettingsState();
}

class _OpenSettingsState extends State<OpenSettings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return chat360.getNTPWrappedWidget(Material(
        color: chat360DeepGreen,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                getTranslated(this.context, "settingsexplanation"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                getTranslated(this.context, "settingssteps"),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: myElevatedButton(
                    color: chat360LightGreen,
                    onPressed: () {
                      openAppSettings();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getTranslated(this.context, "openappsettings"),
                        style: TextStyle(color: chat360White),
                      ),
                    ))),
            SizedBox(height: 20),
            // Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 30.0),
            //     // ignore: deprecated_member_use
            //     child: MaterialButton(
            //         elevation: 0.5,
            //         color: Colors.green,
            //         textColor: chat360White,
            //         onPressed: () {
            //           Navigator.of(context).pop();
            //         },
            //         child: Text(
            //           'Go Back',
            //           style: TextStyle(color: chat360White),
            //         ))),
          ],
        ))));
  }
}
