import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/task_controller.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_task.dart';
import 'package:jordan/views/home.dart';

class TaskViewWidget extends StatefulWidget {
  const TaskViewWidget({Key? key}) : super(key: key);

  @override
  _TaskViewWidgetState createState() => _TaskViewWidgetState();
}

class _TaskViewWidgetState extends State<TaskViewWidget> {
  @override
  void initState() {
    super.initState();
  }

  void _toggleDone(String uid) {
    // use Rx function to update toggle change. This should automatically update widget that uses it in progress.
    Get.find<TasksController>().toggleTask();

    setState(() {
      // forces widget to update - hopefully? :)
      ViaStorage.toggleDoneViaTask(uid: uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        constraints: BoxConstraints.expand(),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(AppMargins.edgeInsets),
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
          length: 1,
          child: generateItemsList(),
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

  Widget generateItemsList() {
    if (_getViaTasks().isEmpty) {
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
      return ListView.builder(
        shrinkWrap: true,
        itemCount: _getViaTasks().length,
        itemBuilder: (context, index) {
          return InkWell(
            child: ListTile(
              enableFeedback: true,
              title: Text(
                '${_getViaTasks()[index].name}',
                style: TextStyle(
                    color: _getViaTasks()[index].link.isNotEmpty
                        ? AppColors.highlightText
                        : AppColors.normalText),
              ),
              //subtitle: Text('daily'), // TODO: do proper parsing
              leading: Icon(Icons.circle, size: 8, color: Colors.green),
              trailing: IconButton(
                icon: _getViaTasks()[index].done
                    ? (Icon(Icons.check_circle_outline_outlined))
                    : (Icon(Icons.circle_outlined)),
                color: Colors.greenAccent,
                onPressed: () => _toggleDone(_getViaTasks()[index].uid),
              ),
              visualDensity:
                  VisualDensity(vertical: VisualDensity.minimumDensity),
              //dense: true,
              horizontalTitleGap: 0,
            ),
            onTap: () {
              String tempLink = _getViaTasks()[index].link;
              // open on link if available
              if (tempLink.isNotEmpty) {
                Get.toNamed(AppRoutes.pluginPrayer,
                    arguments: Arguments(tempLink, false));
                // no data returned
              } else {
                print("${_getViaTasks()[index].name} clicked");
              }
            },
          );
        },
      );
    }
  }
}

List<ViaTask> _getViaTasks() {
  return ViaStorage.readViaDay().viaDay;
}

/// Arguments(String link, bool show)
class Arguments {
  String link;
  bool show;
  Arguments(this.link, this.show);
}
