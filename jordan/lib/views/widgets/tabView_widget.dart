import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/options_controller.dart';
import 'package:jordan/controllers/profile_controller.dart';
import 'package:jordan/controllers/task_controller.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

class TabViewWidget extends StatelessWidget {
  TabViewWidget({Key? key}) : super(key: key);

  final ProfileController _profileController = Get.find<ProfileController>();
  final TasksController _tasksController = Get.find<TasksController>();
  final OptionsController _optionsController = Get.find<OptionsController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        constraints: BoxConstraints.expand(),
        alignment: Alignment.topCenter,
        //padding: EdgeInsets.all(AppMargins.edgeInsets),
        margin: EdgeInsets.fromLTRB(
            AppMargins.edgeInsets,
            0,
            AppMargins.edgeInsets,
            AppMargins
                .edgeInsets), // make space even between top and bottom row
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
          color: AppColors.foreground,
        ),
        child: DefaultTabController(
          initialIndex: 1,
          length: 3,
          child: Scaffold(
            backgroundColor: AppColors.foreground,
            extendBody: false,
            appBar: AppBar(
              backgroundColor: AppColors.foreground,
              elevation: 0,
              flexibleSpace: SafeArea(
                child: TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("ZADANIA"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("PLAN"),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("HISTORIA"),
                    ),
                  ),
                ]),
              ),
            ),
            body:
                TabBarView(physics: NeverScrollableScrollPhysics(), children: [
              generateTaskList(),
              generatePlanList(),
              Icon(Icons.history_outlined),
            ]),
            floatingActionButton: Visibility(
              visible: true,
              child: FloatingActionButton(
                // add new profile task
                onPressed: () {
                  Get.toNamed(AppRoutes.addProfileTask, arguments: "");
                },
                child: const Icon(Icons.add),
                backgroundColor: AppColors.primary,
                elevation: 8,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndDocked,
          ),
        ),
      ),
    );
  }

//        child: Column(
// children: <Widget>[
//             Text(
//               // show current day as title
//               DateFormat("EEEE - MMMM d, ''yy")
//                   .format(ViaStorage.createViaDay().date),
//               textAlign: TextAlign.start,
//               style: TextStyle(color: AppColors.highlightText),
//             ),
//             generateItemsList(),
//           ],

  Widget generateTaskList() {
    if (_tasksController.getTaskList().isEmpty) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("SDS",
                style: TextStyle(
                    color: AppColors.background,
                    fontSize: 128,
                    fontWeight: FontWeight.bold)),
            Column(
              children: [
                Text('"Nie mam żadnych obaw o Towarzystwo,',
                    style: TextStyle(
                        color: AppColors.backgroundText, fontSize: 16)),
                Text('jeśli będziecie dążyć do świętości."',
                    style: TextStyle(
                        color: AppColors.backgroundText, fontSize: 16)),
                SizedBox(height: 8),
                Text("- błogosławiony Franciszek Jordan",
                    style: TextStyle(
                        color: AppColors.backgroundText, fontSize: 16)),
              ],
            ),
          ],
        ),
      );
    } else {
      return Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: _tasksController.getTaskList().length,
          itemBuilder: (context, index) {
            return InkWell(
              child: ListTile(
                enableFeedback: true,
                title: Text(
                  '${_tasksController.getTaskList()[index].name}',
                  style: TextStyle(
                      color:
                          _tasksController.getTaskList()[index].link.isNotEmpty
                              ? AppColors.highlightText
                              : AppColors.normalText),
                ),
                //subtitle: Text('daily'), // TODO: do proper parsing
                leading: Icon(Icons.circle, size: 8, color: Colors.green),
                trailing: IconButton(
                  icon: _tasksController.getTaskList()[index].done
                      ? (Icon(Icons.check_circle_outline_outlined))
                      : (Icon(Icons.circle_outlined)),
                  color: Colors.greenAccent,
                  onPressed: () =>
                      _tasksController.toggleTask(taskIndex: index),
                ),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                //dense: true,
                horizontalTitleGap: 0,
              ),
              onTap: () {
                String tempLink = _tasksController.getTaskList()[index].link;
                // open on link if available
                if (tempLink.isNotEmpty) {
                  Get.toNamed(AppRoutes.pluginPrayer,
                      arguments: Arguments(tempLink, false));
                  // no data returned
                } else {
                  print(
                      "${_tasksController.getTaskList()[index].name} clicked");
                }
              },
            );
          },
        ),
      );
    }
  }

  Widget generatePlanList() {
    return Obx(
      () => ReorderableListView.builder(
        // header: Text(
        //   TrStrings.trPlanSubtitle.tr,
        //   textAlign: TextAlign.start,
        //   style: TextStyle(color: AppColors.highlightText),
        // ),
        onReorder: (int oldIndex, int newIndex) => {
          _profileController.reorderProfileTask(
              oldIndex: oldIndex, newIndex: newIndex)
        },
        shrinkWrap: true,
        itemCount: _profileController.getProfileTasks().length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(_profileController.getProfileTasks()[index].uid),
            background: slideRightBackground(),
            secondaryBackground: slideLeftBackground(),
            direction: DismissDirection.endToStart,
            confirmDismiss: (DismissDirection direction) async {
              if (_optionsController.getSafetySwitch()) {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(TrStrings.trDeleteConfirmation.tr),
                      content: Text(TrStrings.trDeleteConfirmationNote.tr),
                      actions: <Widget>[
                        TextButton(
                          child: Text(TrStrings.trCancel.tr),
                          onPressed: () {
                            Get.back(result: false);
                          },
                        ),
                        TextButton(
                          child: Text(TrStrings.trDelete.tr),
                          onPressed: () {
                            // delete the current profile task
                            Get.back(result: true);
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                return true;
              }
            },
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.startToEnd) {
                print("Add to favorite");
              } else {
                print(
                    'Removing task ${_profileController.getProfileTasks()[index].name}');
                // delete the current profile task
                _profileController
                    .delTask(_profileController.getProfileTasks()[index].uid);
              }
            },
            child: InkWell(
              child: ListTile(
                enableFeedback: true,
                title:
                    Text('${_profileController.getProfileTasks()[index].name}'),
                subtitle: Text('daily'), // TODO: do proper parsing
                leading: Icon(Icons.circle, size: 8, color: Colors.green),
                //trailing: Icon(Icons.minimize_rounded, color: AppColors.primary),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                //dense: true,
                horizontalTitleGap: 0,
              ),
              onTap: () {
                // pass profile task uid to edit
                Get.toNamed(AppRoutes.addProfileTask,
                    arguments: _profileController.getProfileTasks()[index].uid);
              },
            ),
          );
        },
      ),
    );
  }

  Widget slideRightBackground() {
    // not called, because "direction: DismissDirection.endToStart"
    // but needed to avoid exceptions
    return Text("");
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              TrStrings.trDelete.tr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}

/// Arguments(String link, bool show)
class Arguments {
  String link;
  bool show;
  Arguments(this.link, this.show);
}
