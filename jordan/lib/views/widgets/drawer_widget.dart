import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            //header of drawer
            decoration: BoxDecoration(
              color: AppColors.foreground,
            ),
            child: Text(
              '',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text(TrStrings.trProfileTitle.tr),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(TrStrings.trSettingsTitle.tr),
            onTap: () {
              Get.toNamed(AppRoutes.settings);
            },
          ),
        ],
      ),
    );
  }
}
