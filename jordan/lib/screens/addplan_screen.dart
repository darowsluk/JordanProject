import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({Key? key}) : super(key: key);

  @override
  _AddPlanPageState createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  late bool _displayFront;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
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
              height: 16,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                //labelText: 'Add item',
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.add),
                  color: AppColors.primary,
                ),
              ),
            )
          ]),
        )));
  }
}
