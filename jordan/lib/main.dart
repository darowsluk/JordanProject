import 'package:jordan/screens/addProfileTask_screen.dart';
import 'package:jordan/screens/plan_screen.dart';
import 'package:jordan/screens/settings_screen.dart';
import 'package:jordan/screens/saint_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_calendar.dart';
import 'package:jordan/models/via_profile.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:jordan/screens/home.dart';

// Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jordan/models/via_task.dart';
import 'package:jordan/models/via_options.dart';
import 'package:jordan/models/via_day.dart';

// Extras
import 'package:jordan/extras/statics.dart';

void main() async {
  // necessary for hive initialization
  WidgetsFlutterBinding.ensureInitialized();

  var dir = await getApplicationDocumentsDirectory();
  Hive
    ..init(dir.path)
    ..registerAdapter(ViaTaskAdapter())
    ..registerAdapter(ViaDayAdapter())
    ..registerAdapter(ViaCalendarAdapter());
  await Hive.openBox<ViaCalendar>(AppHiveStorage.boxViaCalendar);

  Hive
    /*..init(dir.path)*/
    ..registerAdapter(ViaProfileTaskAdapter())
    ..registerAdapter(ViaProfileAdapter());
  await Hive.openBox<ViaProfile>(AppHiveStorage.boxViaProfile);

  Hive.registerAdapter(ViaOptionsAdapter());
  await Hive.openBox<ViaOptions>(AppHiveStorage.boxViaOptions);

  // initialize current calendar day from profile (if necessary)
  ViaStorage.createDayFromProfile();

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

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavigator.home,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        AppNavigator.home: (context) => HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        AppNavigator.saint: (context) => SaintPage(),
        AppNavigator.plan: (context) => PlanPage(),
        AppNavigator.addProfileTask: (context) => AddProfileTaskPage(),
        AppNavigator.settings: (context) => SettingsPage(),
      },
    );
  }
}
