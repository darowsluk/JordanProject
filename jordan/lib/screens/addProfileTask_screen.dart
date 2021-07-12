import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_profile.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:jordan/plugins/pluginContainer_screen.dart';
import 'package:jordan/services/transMessages.dart';
import 'package:jordan/widgets/planner_widget.dart';
import 'package:nanoid/nanoid.dart';

class AddProfileTaskPage extends StatefulWidget {
  const AddProfileTaskPage({Key? key}) : super(key: key);

  @override
  _AddProfileTaskPageState createState() => _AddProfileTaskPageState();
}

class _AddProfileTaskPageState extends State<AddProfileTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _controller = TextEditingController();
  late bool _edit; // false=add new; true=edit
  late String _uid; // Profile Task uid in "edit" mode
  // temporary form structure to be saved to profile task
  late String _formName;
  late String _formLink;
  late int _formFrequency;

  @override
  void initState() {
    super.initState();
    _edit = false; // default "add new"
    int index = 0;
    // Populate local form fields:
    // 1. Get uid from caller
    _uid = Get.arguments ?? "";
    // 2. Find Profile Task
    if (_uid.isNotEmpty) {
      index = ViaStorage.findProfileTaskIndex(uid: _uid);
      if (index != -1) {
        _edit = true;
      }
    }
    // 3. Initialize form fields
    if (_edit) {
      // "Edit" mode: copy to form fields from Profile Task at index
      _formName = ViaStorage.getProfileTask(index: index).name;
      _controller.text = _formName; // update form field
      _formLink = ViaStorage.getProfileTask(index: index).link;
      _formFrequency = ViaStorage.getProfileTask(index: index).frequency;
    } else {
      // "Add new" mode: initialize form fields to defaults
      _formName = "";
      _formLink = "";
      _formFrequency = 1; // daily
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _saveForm() {
    var form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        setState(() {
          if (_edit) {
            // "Edit" mode: copy form fields to existing Profile Task and save
            _editTaskToProfile(
              uid: _uid,
              name: _formName,
              link: _formLink,
              frequency: _formFrequency,
            );
          } else {
            // "Add new" mode: create a new Profile Task and copy form fields to it for save
            _addTaskToProfile(
              name: _formName,
              link: _formLink,
              frequency: _formFrequency,
            ); // TODO: add all form fields
          }
          _saveProfile();
          ViaStorage.updateCalendarFromProfile();
        });
      }
      Get.back(result: true); // refresh upon return
    } else {
      Get.back(result: false); // no need to refresh
    }
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
                      _saveForm();
                    },
                    child: Text(TrStrings.trSubmit.tr),
                  ),
                ],
              ),
              TextFormField(
                controller: _controller,
                autofocus: true,
                style: TextStyle(fontSize: 36),
                decoration: InputDecoration(
                  hintText: TrStrings.trProfileTask.tr,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return TrStrings.trProfileTaskValidator.tr;
                  }
                  return null;
                },
                onChanged: (text) {
                  // update local form data
                  _formName = text;
                },
                onFieldSubmitted: (text) {
                  // clicking ok on keyboard saves form
                  _saveForm();
                },
              ),
              SizedBox(height: AppMargins.separation),
              ListTile(
                leading: Icon(Icons.repeat),
                title: Text("Repeatable"),
                trailing:
                    Text("daily"), // TODO: parse it and make human readable
              ),
              ListTile(
                leading: Icon(Icons.link),
                title: Text("Link"), // TODO: make it more human readable
                trailing: _getLinkDisplay(_formLink),
                onTap: () async {
                  await Get.to(() => PluginContainerPage(),
                          arguments: Arguments(_formLink, true))
                      ?.then((val) {
                    if (val != null) {
                      String temp = val as String;
                      if (temp.isNotEmpty) {
                        // new link has been passed
                        setState(() {
                          _formLink = temp;
                        });
                      }
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper functions
  void _addTaskToProfile({
    required String name,
    required String link,
    required int frequency,
  }) {
    String uid = nanoid();
    String appendedName = name;
    int appendIndex = 1;
    bool finished = false;
    while (!finished) {
      try {
        ViaStorage.createProfileTask(
            uid: uid, name: appendedName, link: link, frequency: frequency);
        finished = true;
      } on FormatException {
        // append number to the name and try again
        appendedName = name + " ($appendIndex)";
        appendIndex++;
      } on ArgumentError {
        rethrow; // bad error
      }
    }
  }

  void _editTaskToProfile({
    required String uid,
    required String name,
    required String link,
    required int frequency,
  }) {
    ViaProfileTask profileTask;
    String appendedName = name;
    int appendIndex = 1;
    bool finished = false;

    int index = ViaStorage.findProfileTaskIndex(uid: uid);
    if (index != -1) {
      profileTask = ViaStorage.getProfileTask(index: index);
      while (!finished) {
        if (ViaStorage.isProfileTask(name: appendedName)) {
          appendedName = name + " ($appendIndex)";
          appendIndex++;
        } else {
          finished = true;
        }
      }
      // copy form fields to Profile Task
      profileTask.name = appendedName;
      profileTask.link = _formLink;
      profileTask.frequency = _formFrequency;
    } else {
      assert(
          true, "_editTaskToProfile(): profile task not found with uid: $uid");
    }
  }

  void _saveProfile() {
    ViaProfile profile = ViaStorage.createViaProfile();
    profile.save();
  }

  _getLinkDisplay(String formLink) {
    if (formLink.isEmpty) {
      return Text("none");
    } else {
      return Text(
        "static",
        style: TextStyle(color: AppColors.primary),
      );
    }
  }
}
