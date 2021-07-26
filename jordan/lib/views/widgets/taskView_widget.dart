import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/task_controller.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class TaskViewWidget extends StatelessWidget {
  TaskViewWidget({Key? key}) : super(key: key);

  final TasksController _tasksController = Get.put(TasksController());

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
              length: 3,
              child: Scaffold(
                backgroundColor: AppColors.foreground,
                extendBody: false,
                appBar: AppBar(
                  backgroundColor: AppColors.foreground,
                  elevation: 0,
                  flexibleSpace: SafeArea(
                    child:
                        TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
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
                body: TabBarView(children: [
                  generateItemsList(),
                  Icon(Icons.movie),
                  Icon(Icons.games),
                ]),
              ))),
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

  Widget generateItemsList() {
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
                Text(
                    '"Nie mam żadnych obaw o Towarzystwo, jeśli będziecie dążyć do świętości."',
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
}

/// Arguments(String link, bool show)
class Arguments {
  String link;
  bool show;
  Arguments(this.link, this.show);
}
