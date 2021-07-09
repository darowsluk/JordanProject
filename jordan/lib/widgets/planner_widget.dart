import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
//import 'package:jordan/screens/addplan_screen.dart';

class PlannerWidget extends StatefulWidget {
  const PlannerWidget({Key? key}) : super(key: key);

  @override
  _PlannerWidgetState createState() => _PlannerWidgetState();
}

class _PlannerWidgetState extends State<PlannerWidget> {
  @override
  void initState() {
    super.initState();
  }

  void _toggleDone(String uid) {
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
        child: ListView(
          children: <Widget>[
            Text(
              // show current day as title
              DateFormat("EEEE - MMMM d, ''yy")
                  .format(ViaStorage.createViaDay().date),
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
            SizedBox(
              height: AppMargins.separation,
            ),
            for (var task in ViaStorage.readViaDay().viaDay)
              ListTile(
                title: Text(task.name),
                trailing: IconButton(
                  icon: task.done
                      ? (Icon(Icons.check_circle_outline_outlined))
                      : (Icon(Icons.circle_outlined)),
                  color: Colors.greenAccent,
                  onPressed: () => _toggleDone(task.uid),
                ),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                //dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.circle,
                  size: 8,
                  color: Colors.green,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
