import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';

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
          title: Text(AppStrings.titleSettings),
          backgroundColor: AppColors.foreground,
        ),
        body: SafeArea(
            child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(AppMargins.edgeInsets),
          child: ListView(
            children: <Widget>[
              SizedBox(height: AppMargins.separation),
              Text("Developer options (BETA):"),
              Divider(),
              ListTile(
                leading: Icon(Icons.delete_forever_rounded),
                title: Text("Delete all data"),
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
          title: Text("Caution!"),
          content: Text("All saved data will be deleted.\nApp will exit!"),
          elevation: 24,
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text("Understand"),
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
