import 'package:chat360/Configs/app_constants.dart';
import 'package:chat360/Services/localization/language_constants.dart';
import 'package:chat360/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';

class GalleryDownloader {
  static void saveNetworkVideoInGallery(BuildContext context, String url,
      bool isFurtherOpenFile, String fileName, GlobalKey keyloader) async {
    String path = url + "&ext=.mp4";
    Dialogs.showLoadingDialog(context, keyloader);
    GallerySaver.saveVideo(path).then((success) async {
      if (success == true) {
        Navigator.of(keyloader.currentContext!, rootNavigator: true).pop();

        chat360.toast("$fileName  " + getTranslated(context, "folder"));
      } else {
        Navigator.of(keyloader.currentContext!, rootNavigator: true).pop();
        chat360.toast("Failed to Download !");
      }
    }).catchError((err) {
      Navigator.of(keyloader.currentContext!, rootNavigator: true).pop();
      chat360.toast(err.toString());
    });
  }

  static void saveNetworkImage(BuildContext context, String url,
      bool isFurtherOpenFile, String fileName, GlobalKey keyloader) async {
    // String path =
    //     'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';

    String path = url + "&ext=.jpg";
    Dialogs.showLoadingDialog(context, keyloader);
    GallerySaver.saveImage(path, toDcim: true).then((success) async {
      if (success == true) {
        Navigator.of(keyloader.currentContext!, rootNavigator: true).pop();
        chat360.toast(fileName == ""
            ? getTranslated(context, "folder")
            : "$fileName  " + getTranslated(context, "folder"));
      } else {
        chat360.toast("Failed to Download !");
        Navigator.of(keyloader.currentContext!, rootNavigator: true).pop();
      }
    }).catchError((err) {
      Navigator.of(keyloader.currentContext!, rootNavigator: true).pop();
      chat360.toast(err.toString());
    });
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.white,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 18,
                              ),
                              CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    chat360Blue),
                              ),
                              SizedBox(
                                width: 23,
                              ),
                              Text(
                                getTranslated(context, "downloading"),
                                style: TextStyle(color: Colors.black87),
                              )
                            ]),
                      ),
                    )
                  ]));
        });
  }
}
