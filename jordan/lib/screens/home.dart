import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Custom widgets
import 'package:jordan/widgets/jordan_widget.dart';
import 'package:jordan/widgets/drawer_widget.dart';
import 'package:jordan/widgets/prayers_widget.dart';

// Custom screens
import 'package:jordan/screens/prayer.dart';

class HomePage extends StatefulWidget {
  // const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

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
        title: Text("Salwatowianie App"),
        // backgroundColor: Colors.orange,
      ),
      drawer: DrawerWidget(scaffoldKey: scaffoldKey),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              // SDS Prayer Box
              JordanWidget(),
              // SDS Daily prayers
              PrayersWidget(),
            ],
          ),
          Row(
            children: <Widget>[
              // SDS Prayer Box
              JordanWidget(),
              // SDS Daily prayers
              PrayersWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
