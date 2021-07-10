import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

// Custom widgets
import 'package:jordan/widgets/saintcard_widget.dart';
import 'package:jordan/widgets/drawer_widget.dart';
import 'package:jordan/widgets/progress_widget.dart';
import 'package:jordan/widgets/planner_widget.dart';

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  // Saint Prayer Card
                  SaintCardWidget(),
                  // Progress display
                  Expanded(
                    child: InkWell(
                      child: ProgressWidget(),
                      onTap: () {
                        // Navigate to new page, but refresh contents after return
                        Navigator.pushNamed(context, AppNavigator.plan)
                            .then((value) => setState(() {}));
                      },
                    ),
                  ),
                ],
              ),
            ),
            PlannerWidget(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    Hive.close(); // important to close all open Hives
    super.dispose();
  }
}
