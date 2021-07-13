import 'package:get/get.dart';
import 'package:jordan/plugins/pluginContainer_screen.dart';
import 'package:jordan/plugins/pluginPrayer_screen.dart';
import 'package:jordan/screens/addProfileTask_screen.dart';
import 'package:jordan/screens/home.dart';
import 'package:jordan/screens/saint_screen.dart';
import 'package:jordan/screens/settings_screen.dart';
import 'package:jordan/services/transMessages.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_calendar.dart';
import 'package:jordan/models/via_profile.dart';
import 'package:jordan/models/via_profileTask.dart';

// Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jordan/models/via_task.dart';
import 'package:jordan/models/via_options.dart';
import 'package:jordan/models/via_day.dart';

// Extras
import 'package:jordan/extras/statics.dart';

import 'screens/plan_screen.dart';

void main() async {
  // necessary for hive initialization
  WidgetsFlutterBinding.ensureInitialized();

  if (GetPlatform.isWeb) {
    //Hive.init();
  } else {
    var dir = await getApplicationDocumentsDirectory();
    Hive..init(dir.path);
  }
  Hive
    ..registerAdapter(ViaTaskAdapter())
    ..registerAdapter(ViaDayAdapter())
    ..registerAdapter(ViaCalendarAdapter());
  await Hive.openBox<ViaCalendar>(AppHiveStorage.boxViaCalendar);

  Hive
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
    return GetMaterialApp(
      translations: TransMessages(),
      locale: Get.deviceLocale, // Locale("pl", "PL"),
      fallbackLocale: Locale("en", "US"),
      title: TrStrings.trAppName.tr,
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
      initialRoute: AppRoutes.home,
      getPages: [
        GetPage(name: AppRoutes.home, page: () => HomePage()),
        GetPage(name: AppRoutes.saint, page: () => SaintPage()),
        GetPage(name: AppRoutes.plan, page: () => PlanPage()),
        GetPage(name: AppRoutes.settings, page: () => SettingsPage()),
        GetPage(
            name: AppRoutes.addProfileTask, page: () => AddProfileTaskPage()),
        GetPage(
            name: AppRoutes.pluginContainer, page: () => PluginContainerPage()),
        GetPage(name: AppRoutes.pluginPrayer, page: () => PluginPrayerPage()),
      ],
    );
  }
}
