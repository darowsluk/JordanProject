import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jordan/controllers/task_controller.dart';
import 'package:jordan/services/transMessages.dart';

// Custom widgets
import 'package:jordan/views/widgets/saintcard_widget.dart';
import 'package:jordan/views/widgets/drawer_widget.dart';
import 'package:jordan/views/widgets/progress_widget.dart';
import 'package:jordan/views/widgets/taskView_widget.dart';

// Extras
import 'package:jordan/extras/statics.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  // Create instance of Controller
  TasksController _homeController = Get.put(TasksController());

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
        title: Text(TrStrings.trAppName.tr),
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
                        onTap: () async {
                          // todo
                          await Get.toNamed(AppRoutes.plan);
                          setState(() {});
                        }),
                  ),
                ],
              ),
            ),
            TaskViewWidget(),
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
