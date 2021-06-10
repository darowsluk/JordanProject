import 'package:flutter/material.dart';
import 'package:jordan/screens/home.dart';
// Extras
import 'package:jordan/extras/colors.dart';

void main() {
  runApp(JordanApp());
}

class JordanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jordan SDS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        brightness: Brightness.dark,
        backgroundColor: Colors.blueAccent,
        primaryColor: Colors.blueGrey,
        canvasColor: AppColors.foreground,
        cardColor: AppColors.foreground,
        // primarySwatch: Colors.orange,
        // canvasColor: Colors.black12, // drawer background
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
