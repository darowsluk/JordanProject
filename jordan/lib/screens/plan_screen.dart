import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:jordan/screens/addProfileTask_screen.dart';

class PlanPage extends StatefulWidget {
  const PlanPage({Key? key}) : super(key: key);

  @override
  _PlanPageState createState() => _PlanPageState();
}

class _PlanPageState extends State<PlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: Text(AppPlan.title),
      ),
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(AppMargins.edgeInsets),
          margin: EdgeInsets.all(AppMargins.edgeInsets),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
            color: AppColors.foreground,
          ),
          child: generateItemsList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to new page, but refresh contents after return
          // old style:
          // await Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => AddProfileTaskPage(),
          //   ),
          // ).then((val) {
          //   setState(() {});
          // });
          await Get.to(() => AddProfileTaskPage())?.then((val) {
            setState(() {});
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
        elevation: 8,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }

  ReorderableListView generateItemsList() {
    return ReorderableListView.builder(
      header: Text(
        'Mój plan wakacyjny',
        textAlign: TextAlign.start,
        style: TextStyle(color: AppColors.highlightText),
      ),
      onReorder: (int oldIndex, int newIndex) => {
        setState(() {
          _reorderTaskProfile(oldIndex, newIndex);
        })
      },
      shrinkWrap: true,
      itemCount: _getProfileTasks().length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(_getProfileTasks()[index].uid),
          background: slideRightBackground(),
          secondaryBackground: slideLeftBackground(),
          direction: DismissDirection.endToStart,
          confirmDismiss: (DismissDirection direction) async {
            if (AppOptions.confirmDelete) {
              return true;
            } else {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Delete Confirmation"),
                    content: const Text(
                        "Are you sure you want to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Get.back(result: false);
                        },
                      ),
                      TextButton(
                        child: Text("Delete"),
                        onPressed: () {
                          // delete the current profile task
                          Get.back(result: true);
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              print("Add to favorite");
            } else {
              print('Removing task ${_getProfileTasks()[index].name}');
              setState(() {
                // delete the current profile task
                _removeTask(context, _getProfileTasks()[index].uid);
              });
            }
          },
          child: InkWell(
            child: ListTile(
              enableFeedback: true,
              title: Text('${_getProfileTasks()[index].name}'),
              subtitle: Text('daily'), // TODO: do proper parsing
              leading: Icon(Icons.circle, size: 8, color: Colors.green),
              //trailing: Icon(Icons.minimize_rounded, color: AppColors.primary),
              visualDensity:
                  VisualDensity(vertical: VisualDensity.minimumDensity),
              //dense: true,
              horizontalTitleGap: 0,
            ),
            onTap: () {
              print("${_getProfileTasks()[index].name} clicked");
            },
          ),
        );
      },
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
              " Delete",
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

  // Helper functions
  void _reorderTaskProfile(int oldIndex, int newIndex) {
    // First try to reorder via task list using profile uids
    ViaStorage.reorderViaTasksOnProfile(
        oldProfileIndex: oldIndex, newProfileIndex: newIndex);
    if (ViaStorage.reorderTaskProfile(oldIndex: oldIndex, newIndex: newIndex)) {
      // worked
    } else {
      // some error
      assert(true, "_reorderTaskProfile()");
    }
    ViaStorage.updateCalendarFromProfile();
  }

  void _removeTask(BuildContext _context, String uid) {
    ViaStorage.deleteProfileTask(uid: uid);
    ViaStorage.deleteViaTask(uid: uid);
  }

  List<ViaProfileTask> _getProfileTasks() {
    return ViaStorage.readProfileTasks();
  }
}
