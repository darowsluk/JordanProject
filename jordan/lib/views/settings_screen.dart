import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/services/transMessages.dart';

/// Displays options screen from drawer
class SettingsPage extends StatelessWidget {
  SettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(TrStrings.trSettingsTitle.tr),
          backgroundColor: AppColors.foreground,
        ),
        body: SafeArea(
            child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(AppMargins.edgeInsets),
          child: ListView(
            children: <Widget>[
              SizedBox(height: AppMargins.separation),
              Text(TrStrings.trSettingsDeveloperTitle.tr),
              Divider(),
              ListTile(
                leading: Icon(Icons.delete_forever_rounded),
                title: Text(TrStrings.trSettingsDeleteAll.tr),
                onTap: () {
                  _showDialog(context);
                },
              ),
            ],
          ),
        )));
  }

  /// Helper function
  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      useRootNavigator: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(TrStrings.trCaution.tr),
          content: Text(TrStrings.trDeleteCautionNote.tr),
          elevation: 24,
          actions: <Widget>[
            TextButton(
              child: Text(TrStrings.trCancel.tr),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(TrStrings.trUnderstand.tr),
              onPressed: () {
                // deletes and closes all boxes
                ViaStorage.deleteAllBoxes();
                // exit the app
                // TODO: fix this temporary solution
                //exit(0);
                SystemNavigator.pop();
              },
            ),
          ],
        );
      },
    );
  }
}
