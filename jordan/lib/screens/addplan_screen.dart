import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/screens/home.dart';
import 'package:jordan/services/storageManager.dart';

class AddPlanPage extends StatefulWidget {
  const AddPlanPage({Key? key}) : super(key: key);

  @override
  _AddPlanPageState createState() => _AddPlanPageState();
}

class _AddPlanPageState extends State<AddPlanPage> {
  late TextEditingController _controller;
  late StorageManager _storageManager; // singleton

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _storageManager = StorageManager();
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
            for (var item in _storageManager.getList())
              TextField(
                decoration: InputDecoration(
                  hintText: item.getName(),
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.circle,
                    size: 8,
                    color: Colors.green,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _storageManager.removeItem(item.getName());
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
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
                  onPressed: () => _addItem(context, _controller.text),
                  icon: Icon(Icons.add_rounded),
                  color: AppColors.primary,
                ),
              ),
              onSubmitted: (text) => _addItem(context, text),
            ),
          ]),
        )));
  }

  // Helper functions
  void _addItem(BuildContext _context, String item) {
    _storageManager.addItem(item);
    Navigator.push(
      _context,
      MaterialPageRoute(builder: (_context) => HomePage()),
    );
  }
}
