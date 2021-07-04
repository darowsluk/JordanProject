import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Custom widgets
import 'package:jordan/widgets/jordan_widget.dart';
import 'package:jordan/widgets/drawer_widget.dart';
import 'package:jordan/widgets/prayers_widget.dart';
import 'package:jordan/widgets/calendarium_widget.dart';

// Custom screens
import 'package:jordan/screens/prayers_screen.dart';

// Extras
import 'package:jordan/extras/statics.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: Text(AppStrings.appName),
      ),
      drawer: DrawerWidget(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(
        child: Column(
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
                // Calendarium SDS
                CalendariumWidget(),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrayerPage()),
          );
        },
        child: const Icon(Icons.library_books),
        backgroundColor: AppColors.primary,
      ),
    );
  }
}
