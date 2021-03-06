import 'package:get/get.dart';
import 'package:jordan/models/options_storage.dart';
import 'package:jordan/views/plugins/pluginContainer_screen.dart';
import 'package:jordan/views/plugins/pluginPrayer_screen.dart';
import 'package:jordan/views/addProfileTask_screen.dart';
import 'package:jordan/views/home.dart';
import 'package:jordan/views/saint_screen.dart';
import 'package:jordan/views/selectWays_screen.dart';
import 'package:jordan/views/select_screen.dart';
import 'package:jordan/views/settings_screen.dart';
import 'package:jordan/services/transMessages.dart';
import 'package:flutter/material.dart';
import 'package:jordan/models/storage.dart';

// Extras
import 'package:jordan/extras/statics.dart';

import 'views/plan_screen.dart';

void main() async {
  // necessary for hive initialization
  WidgetsFlutterBinding.ensureInitialized();

  await ViaStorage.initializeStorage();

  runApp(JordanApp());
}

class JordanApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TransMessages(),
      locale: Locale(
        OptionsStorage.getLanguageCode(),
        OptionsStorage.getCountryCode(),
      ),
      fallbackLocale: Locale(
          TrSupportedLanguage.defaultLang, TrSupportedLanguage.defaultCountry),
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
        GetPage(name: AppRoutes.select, page: () => SelectPage()),
        GetPage(name: AppRoutes.selectWays, page: () => SelectWaysPage()),
        GetPage(
            name: AppRoutes.addProfileTask, page: () => AddProfileTaskPage()),
        GetPage(
            name: AppRoutes.pluginContainer, page: () => PluginContainerPage()),
        GetPage(name: AppRoutes.pluginPrayer, page: () => PluginPrayerPage()),
        GetPage(name: AppRoutes.saint, page: () => SaintPage()),
      ],
    );
  }
}
