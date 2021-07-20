import 'package:get/get.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:nanoid/nanoid.dart';

class ProfileController extends GetxController {
  final _profile = ViaStorage.createViaProfile().obs;
  var _toggleTask = false.obs;

// Public Methods: toggle task
  void toggleTask() {
    _toggleTask.value = !_toggleTask.value;
  }

  bool getToggleTask() {
    return _toggleTask.value;
  }

// Public Methods: add, edit, delete ProfileTask
  void addTaskToProfile({
    required String name,
    required String link,
    required int priority,
    required bool untilDone,
    required int frequency,
    required int repeatWeekday,
    required int repeatDayOfMonth,
    required int repeatDateDay,
    required int repeatDateMonth,
  }) {
    String newUID = nanoid();
    ViaProfileTask newProfileTask = ViaProfileTask(uid: newUID);

    _profile.update((val) {
      _profile.value.profileTasks.add(newProfileTask);
      _profile.value.save();
    });

    editProfileTask(
      uid: newUID,
      name: name,
      link: link,
      priority: priority,
      untilDone: untilDone,
      frequency: frequency,
      repeatWeekday: repeatWeekday,
      repeatDayOfMonth: repeatDayOfMonth,
      repeatDateDay: repeatDateDay,
      repeatDateMonth: repeatDateMonth,
    );
  }

  void editProfileTask({
    required String uid,
    required String name,
    required String link,
    required int priority,
    required bool untilDone,
    required int frequency,
    required int repeatWeekday,
    required int repeatDayOfMonth,
    required int repeatDateDay,
    required int repeatDateMonth,
  }) {
    int index = findProfileTaskIndex(uid: uid);

    // edit profile task at index
    _profile.update((val) {
      _profile.value.profileTasks[index].name =
          _generateUniqueProfileTaskName(taskName: name);
      _profile.value.profileTasks[index].link = link;
      _profile.value.profileTasks[index].priority = priority;
      _profile.value.profileTasks[index].untilDone = untilDone;
      _profile.value.profileTasks[index].frequency = frequency;
      _profile.value.profileTasks[index].repeatWeekday = repeatWeekday;
      _profile.value.profileTasks[index].repeatDayOfMonth = repeatDayOfMonth;
      _profile.value.profileTasks[index].repeatDateDay = repeatDateDay;
      _profile.value.profileTasks[index].repeatDateMonth = repeatDateMonth;
      _profile.value.save();
    });
    ViaStorage.updateCalendarFromProfile();
  }

  void delTask(String uid) {
    ViaStorage.deleteProfileTask(uid: uid);
    ViaStorage.deleteViaTask(uid: uid);
  }

  /// Find profile task and return its index
  int findProfileTaskIndex({
    required String uid,
  }) {
    return _profile.value.profileTasks
        .indexWhere((element) => element.uid.compareTo(uid) == 0);
  }

  /// Return list of profile tasks
  List<ViaProfileTask> getProfileTasks() {
    return _profile.value.profileTasks;
  }

  /// Return profile task at index
  ViaProfileTask getProfileTask({required int index}) {
    return _profile.value.profileTasks.elementAt(index);
  }

  /// Reorder two profile tasks with each other
  void reorderProfileTask({required int oldIndex, required int newIndex}) {
    // First try to reorder via task list using profile uids
    _profile.update((val) {
      ViaStorage.reorderViaTasksOnProfile(
          profile: _profile.value,
          oldProfileIndex: oldIndex,
          newProfileIndex: newIndex);
    });

    if (ViaStorage.reorderTaskProfile(oldIndex: oldIndex, newIndex: newIndex)) {
      // worked
    } else {
      // some error
      assert(true, "reorderProfileTask()");
    }
    ViaStorage.updateCalendarFromProfile();
  }

  //
  // private helper functions:
  //

  /// Append (1) to the name if already used
  String _generateUniqueProfileTaskName({required String taskName}) {
    String appendedName = taskName;
    int appendIndex = 1;
    bool finished = false;

    while (!finished) {
      if (_isProfileTask(name: appendedName)) {
        appendedName = taskName + " ($appendIndex)";
        appendIndex++;
      } else {
        finished = true;
      }
    }
    return appendedName;
  }

  /// Check for duplicate profile task name
  bool _isProfileTask({required String name}) {
    if (_profile.value.profileTasks
            .indexWhere((element) => element.name.compareTo(name) == 0) ==
        -1)
      return false;
    else
      return true;
  }
}
