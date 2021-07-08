import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';

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
              'Options',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profil'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Ustawienia'),
          ),
          ListTile(
            onTap: () {
              if (widget.scaffoldKey.currentState == null) {
              } else if (widget.scaffoldKey.currentState!.isDrawerOpen) {
                //check if drawer is open
                ViaStorage.deleteAllBoxes();
                Navigator.pop(context);
              }
            },
            leading: Icon(Icons.delete_forever_rounded),
            title: Text("Delete all data"),
          ),
        ],
      ),
    );
  }
}
