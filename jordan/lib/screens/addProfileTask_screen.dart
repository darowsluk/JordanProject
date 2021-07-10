import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
import 'package:nanoid/nanoid.dart';

class AddProfileTaskPage extends StatefulWidget {
  const AddProfileTaskPage({Key? key}) : super(key: key);

  @override
  _AddProfileTaskPageState createState() => _AddProfileTaskPageState();
}

class _AddProfileTaskPageState extends State<AddProfileTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _controller;
  late AddProfileTaskData _formData;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _formData = AddProfileTaskData();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.card,
      child: Padding(
        padding: const EdgeInsets.all(AppMargins.edgeInsets),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: AppMargins.separation),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    // Close form without saving
                    onPressed: () => {
                      Get.back(result: false) // no need to refresh
                    },
                    icon: Icon(Icons.close_rounded),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState!.validate()) {
                        // Process data.
                        setState(
                          () {
                            _controller.clear();
                            _addTaskToProfile(context, _formData.name);
                            Get.back(result: true); // refresh upon return
                          },
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
              TextFormField(
                controller: _controller,
                autofocus: true,
                style: TextStyle(fontSize: 36),
                decoration: const InputDecoration(
                  hintText: 'Spiritual task',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter text';
                  }
                  return null;
                },
                onChanged: (text) {
                  // update local _formData
                  _formData.name = text;
                },
                onFieldSubmitted: (text) {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _controller.clear();
                      _addTaskToProfile(context, text);
                    });
                    Get.back(result: true); // refresh upon return
                  }
                },
              ),
              SizedBox(height: AppMargins.separation),
              ListTile(
                leading: Icon(Icons.repeat),
                title: Text("Repeatable"),
                trailing: Text(_formData.frequencyToString()),
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text("Link"),
                trailing: Text(_formData.linkToString()),
              ),
            ],
          ),
        ),
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
}

// Helper Form data class
class AddProfileTaskData {
  String name = "";
  String link = "";
  bool untilDone = false;
  int frequency = 1; // daily

  String linkToString() {
    if (link.isEmpty) {
      return "none";
    } else {
      return link;
    }
  }

  String frequencyToString() {
    switch (frequency) {
      case 0:
        return "once";
      case 1:
        return "daily";
      case 2:
        return "weekly";
      case 3:
        return "monthly";
      case 4:
        return "annually";
      default:
        return "daily";
    }
  }
}
