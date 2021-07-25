import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/options_controller.dart';
import 'package:jordan/controllers/profile_controller.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

class PlanPage extends StatelessWidget {
  PlanPage({Key? key}) : super(key: key);

  final OptionsController _optionsController = Get.put(OptionsController());
  final ProfileController _profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: Text(TrStrings.trPlanTitle.tr),
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
        // add new profile task
        onPressed: () {
          Get.toNamed(AppRoutes.addProfileTask, arguments: "");
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColors.primary,
        elevation: 8,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
    );
  }

  Widget generateItemsList() {
    return Obx(
      () => ReorderableListView.builder(
        header: Text(
          TrStrings.trPlanSubtitle.tr,
          textAlign: TextAlign.start,
          style: TextStyle(color: AppColors.highlightText),
        ),
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
