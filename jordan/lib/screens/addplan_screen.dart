import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_task.dart';
import 'package:nanoid/nanoid.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({Key? key}) : super(key: key);

  @override
  _AddPlanPageState createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.foreground,
          title: Text(AppAddPlan.title),
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
          child: ListView(children: <Widget>[
            Text(
              'Mój plan wakacyjny',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
            SizedBox(
              height: AppMargins.separation,
            ),
            generateItemsList(),
            TextField(
              controller: _controller,
              //autofocus: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                //labelText: 'Add item',
                suffixIcon: IconButton(
                  onPressed: () => setState(() {
                    _controller.clear();
                    _addTaskToProfile(context, _controller.text);
                  }),
                  icon: Icon(Icons.add_rounded),
                  color: AppColors.primary,
                ),
              ),
              onSubmitted: (text) => setState(() {
                _controller.clear();
                _addTaskToProfile(context, text);
              }),
            ),
          ]),
        )));
  }

  ListView generateItemsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _getViaDay().length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(_getViaDay()[index].uid),
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
                          Navigator.pop(context, false);
                        },
                      ),
                      TextButton(
                        child: Text("Delete"),
                        onPressed: () {
                          // delete the current profile task
                          Navigator.pop(context, true);
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
              print('Removing task ${_getViaDay()[index].name}');
              setState(() {
                // delete the current profile task
                _removeTask(context, _getViaDay()[index].uid);
              });
            }
          },
          child: InkWell(
            child: ListTile(
              title: Text('${_getViaDay()[index].name}'),
              subtitle: Text('${_getViaDay()[index].repeat}'),
              leading: Icon(Icons.circle, size: 8, color: Colors.green),
              //trailing: Icon(Icons.minimize_rounded, color: AppColors.primary),
            ),
            onTap: () {
              print("${_getViaDay()[index].name} clicked");
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
  void _addTaskToProfile(BuildContext _context, String name) {
    String uid = nanoid();
    String appendedName = name;
    int appendIndex = 1;
    bool finished = false;
    while (!finished) {
      try {
        ViaStorage.createProfileTask(
            uid: uid, name: appendedName, frequency: 1 /* daily */);
        finished = true;
      } on FormatException {
        // append number to the name and try again
        appendedName = name + " ($appendIndex)";
        appendIndex++;
      } on ArgumentError {
        rethrow; // bad error
      }
    }
    ViaStorage.updateCalendarFromProfile();
  }

  void _removeTask(BuildContext _context, String uid) {
    ViaStorage.deleteProfileTask(uid: uid);
    ViaStorage.deleteViaTask(uid: uid);
  }

  List<ViaTask> _getViaDay() {
    return ViaStorage.readViaDay().viaDay;
  }
}
