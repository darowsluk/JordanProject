import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/profile_controller.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';
import 'package:jordan/views/widgets/taskView_widget.dart';

class AddProfileTaskPage extends StatefulWidget {
  const AddProfileTaskPage({Key? key}) : super(key: key);

  @override
  _AddProfileTaskPageState createState() => _AddProfileTaskPageState();
}

class _AddProfileTaskPageState extends State<AddProfileTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _controller = TextEditingController();
  var _profileControllerTemp = Get.find<ProfileController>();
  late bool _edit; // false=add new; true=edit
  late String _uid; // Profile Task uid in "edit" mode
  // temporary form structure to be saved to profile task (copy of ViaProfileTask)
  // used because local variables are copied by value and we want the form to save only on pressing the button
  late String _formName;
  late String _formLink;
  late int _formPriority;
  late bool _formUntilDone;
  late int _formFrequency;
  late int _formRepeatWeekday;
  late int _formRepeatDayOfMonth;
  late int _formRepeatDateDay;
  late int _formRepeatDateMonth;

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
      index = _profileControllerTemp.findProfileTaskIndex(uid: _uid);
      if (index != -1) {
        _edit = true;
      }
    }
    // 3. Initialize form fields
    // TODO: think about creating a new empty profile task to save only on button press instead of local variables
    if (_edit) {
      // "Edit" mode: copy to form fields from Profile Task at index
      _formName = _profileControllerTemp.getProfileTask(index: index).name;
      _controller.text = _formName; // update form field
      _formLink = _profileControllerTemp.getProfileTask(index: index).link;
      _formPriority =
          _profileControllerTemp.getProfileTask(index: index).priority;
      _formUntilDone =
          _profileControllerTemp.getProfileTask(index: index).untilDone;
      _formFrequency =
          _profileControllerTemp.getProfileTask(index: index).frequency;
      _formRepeatWeekday =
          _profileControllerTemp.getProfileTask(index: index).repeatWeekday;
      _formRepeatDayOfMonth =
          _profileControllerTemp.getProfileTask(index: index).repeatDayOfMonth;
      _formRepeatDateDay =
          _profileControllerTemp.getProfileTask(index: index).repeatDateDay;
      _formRepeatDateMonth =
          _profileControllerTemp.getProfileTask(index: index).repeatDateMonth;
    } else {
      // "Add new" mode: initialize form fields to defaults
      // TODO: make these static constants
      _formName = "";
      _formLink = "";
      _formPriority = 0;
      _formUntilDone = false;
      _formFrequency = 1; // daily
      _formRepeatWeekday = 0;
      _formRepeatDayOfMonth = 0;
      _formRepeatDateDay = 0;
      _formRepeatDateMonth = 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // helper function
  _saveForm() {
    var form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        if (_edit) {
          // "Edit" mode: copy form fields to existing Profile Task and save
          // updates all observers automatically
          _profileControllerTemp.editProfileTask(
            uid: _uid,
            name: _formName,
            link: _formLink,
            priority: _formPriority,
            untilDone: _formUntilDone,
            frequency: _formFrequency,
            repeatWeekday: _formRepeatWeekday,
            repeatDayOfMonth: _formRepeatDayOfMonth,
            repeatDateDay: _formRepeatDateDay,
            repeatDateMonth: _formRepeatDateMonth,
          );
        } else {
          // "Add new" mode: create a new Profile Task and copy form fields to it for save
          // updates all observers automatically
          _profileControllerTemp.addTaskToProfile(
            name: _formName,
            link: _formLink,
            priority: _formPriority,
            untilDone: _formUntilDone,
            frequency: _formFrequency,
            repeatWeekday: _formRepeatWeekday,
            repeatDayOfMonth: _formRepeatDayOfMonth,
            repeatDateDay: _formRepeatDateDay,
            repeatDateMonth: _formRepeatDateMonth,
          );
        }
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
                      // TODO: result for refreshing should be obsolete since obx handles automatic refresh
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
                    var val = await Get.toNamed(AppRoutes.pluginContainer,
                        arguments: Arguments(_formLink, true));
                    if (val != null) {
                      String temp = val as String;
                      if (temp.isNotEmpty) {
                        // new link has been passed
                        setState(() {
                          _formLink = temp;
                        });
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  // Helper functions

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
