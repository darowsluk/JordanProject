import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:jordan/screens/prayer.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent
            //color set to transperent or set your own color
            ));
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromRGBO(14, 17, 33, 1.0),
      appBar: AppBar(
        title: Text("Bł. Franciszek Jordan"),
        // backgroundColor: Colors.orange,
      ),
      drawer: Drawer(
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
                  if (scaffoldKey.currentState.isDrawerOpen) {
                    //check if drawer is open
                    Navigator.pop(context); //context of drawer is different
                  }
                },
                leading: Icon(Icons.close),
                title: Text("Close Drawer"))
          ],
        ),
      ),
      body: Container(
        width: 120,
        height: 120,
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(24, 33, 54, 1.0),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PrayerPage()),
            );
          },
          child: Hero(
            tag: 'jordan',
            child: Image.asset(
              "assets/Jordan_100px.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
