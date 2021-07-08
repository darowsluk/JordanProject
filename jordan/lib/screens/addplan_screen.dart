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
              'Planner',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
            SizedBox(
              height: AppMargins.separation,
            ),
            for (var task in _getViaDay())
              TextField(
                decoration: InputDecoration(
                  hintText: task.name,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors.green,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _removeTaskReturn(context, task.uid);
                    },
                    icon: Icon(Icons.minimize_rounded),
                    color: AppColors.primary,
                  ),
                ),
              ),
            TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                //labelText: 'Add item',
                suffixIcon: IconButton(
                  onPressed: () =>
                      _addTaskToProfileReturn(context, _controller.text),
                  icon: Icon(Icons.add_rounded),
                  color: AppColors.primary,
                ),
              ),
              onSubmitted: (text) => _addTaskToProfileReturn(context, text),
            ),
          ]),
        )));
  }

  // Helper functions
  void _addTaskToProfileReturn(BuildContext _context, String name) {
    String uid = nanoid();
    String appendedName = name;
    int appendIndex = 1;
    bool finished = false;
    while (!finished) {
      try {
        ViaStorage.createProfileTask(uid: uid, name: appendedName);
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
    Navigator.pop(_context);
  }

  void _removeTaskReturn(BuildContext _context, String uid) {
    ViaStorage.deleteViaTask(uid: uid);
    ViaStorage.deleteProfileTask(uid: uid);
    ViaStorage.updateCalendarFromProfile(); // is it needed?
    Navigator.pop(_context);
  }

  List<ViaTask> _getViaDay() {
    return ViaStorage.readViaDay().viaDay;
  }
}
