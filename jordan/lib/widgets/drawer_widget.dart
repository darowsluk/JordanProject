import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key key,
    @required this.scaffoldKey,
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
                // color: Colors.orange,
                ),
            child: Text(
              'Options',
              style: TextStyle(
                // color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            //menu item of Drawer
            leading: Icon(Icons.home),
            title: Text('Home Page'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Account Settings'),
          ),
          ListTile(
              onTap: () {
                if (widget.scaffoldKey.currentState.isDrawerOpen) {
                  //check if drawer is open
                  Navigator.pop(context); //context of drawer is different
                }
              },
              leading: Icon(Icons.close),
              title: Text("Close Drawer"))
        ],
      ),
    );
  }
}
