import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/screens/addplan_screen.dart';
import 'package:jordan/services/storageManager.dart';

class PlannerWidget extends StatefulWidget {
  const PlannerWidget({Key? key}) : super(key: key);

  @override
  _PlannerWidgetState createState() => _PlannerWidgetState();
}

class _PlannerWidgetState extends State<PlannerWidget> {
  late StorageManager _storageManager; // singleton

  @override
  void initState() {
    super.initState();
    _storageManager = StorageManager();
  }

  void _toggleDone(String itemName) {
    setState(() {
      _storageManager.editToggleDone(itemName);
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
              'Planner',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
            SizedBox(
              height: AppMargins.separation,
            ),
            for (var item in _storageManager.getList())
              ListTile(
                title: Text(item.getName()),
                trailing: IconButton(
                  icon: item.getDone()
                      ? (Icon(Icons.check_circle_outline_outlined))
                      : (Icon(Icons.circle_outlined)),
                  color: Colors.greenAccent,
                  onPressed: () => _toggleDone(item.getName()),
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
