import 'package:hive/hive.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/via_calendar.dart';
import 'package:jordan/models/via_profile.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:jordan/models/via_task.dart';
import 'package:jordan/models/via_day.dart';
import 'package:jordan/services/timeManager.dart';

/// Exposes storage global functions
class ViaStorage {
  static Box<ViaCalendar> getViaCalendarBox() =>
      Hive.box<ViaCalendar>(AppHiveStorage.boxViaCalendar);
  static Box<ViaProfile> getViaProfileBox() =>
      Hive.box<ViaProfile>(AppHiveStorage.boxViaProfile);

  /// Populate new day with tasks based on current profile
  static void createDayFromProfile() {
    // currently only single profile and calendar may exist
    ViaProfile? profile = createViaProfile();
    ViaCalendar? calendar = createViaCalendar();

    if (profile.profileTasks.isEmpty) {
      return;
    } else {
      if (calendar.viaCalendar.isEmpty) {
        // populate empty calendar from non-empty profile
        // strange situation - should assert
        assert(true,
            "createDayFromProfile(): Empty calendar, while profile is not empty");
      } else {
        // normal case: populate calendar from profile
        // first check for matching day (populate on mismatch - new day)
        var index = calendar.viaCalendar.indexWhere((element) =>
            element.date.isSameDate(ViaTime.getCurrentDay()) == true);
        if (index == -1) {
          // populate profile tasks on new day
          updateCalendarFromProfile();
        } else {
          // still the same day - no need to repopulate data
          // maybe senity check on data should be done here...
          return;
        }
      }
    }
  }

  /// Create new profile if necessary
  static ViaProfile createViaProfile() {
    final profileBox = ViaStorage.getViaProfileBox();
    ViaProfile profile;

    if (profileBox.isEmpty || profileBox.getAt(0) == null) {
      profile = ViaProfile(name: AppHiveStorage.profileDefaultName);
      profileBox.add(profile);
      profile.save();
    } else {
      profile = profileBox.getAt(0)!; // already checked for null
    }
    return profile;
  }

  /// Populates new day with tasks based on profile
  static void updateCalendarFromProfile() {
    ViaProfile profile = createViaProfile();

    for (var task in profile.profileTasks) {
      switch (Frequency.values[task.frequency]) {
        case Frequency.Never:
          if (task.untilDone) {
            createViaTask(uid: task.uid, name: task.name);
          } else {
            // TODO: safe to delete task from profile as done (maybe keep as history)
          }
          break;
        case Frequency.Daily:
          // create new task or update existing one (dirty flag?)
          createViaTask(uid: task.uid, name: task.name, repeat: "daily");
          break;
        case Frequency.Weekly:
          break;
        case Frequency.Monthly:
          break;
        case Frequency.Annually:
          break;
        default:
        // fall-through for future updates
      }
    }
    return;
  }

  static bool reorderTaskProfile(
      {required int oldIndex, required int newIndex}) {
    ViaProfile profile = createViaProfile();
    ViaProfileTask temp;

    // CAUTION: this algorithm is taking into account bad ReorderableListView code
    // TODO: must create a thorough test to flag when flutter will fix its bug and break our algorithm
    if (newIndex > oldIndex) {
      newIndex--; // this fixes flutter bug
      temp = profile.profileTasks.removeAt(oldIndex);
      profile.profileTasks.insert(newIndex, temp);
    } else {
      temp = profile.profileTasks.removeAt(oldIndex);
      profile.profileTasks.insert(newIndex, temp);
    }
    profile.save();
    return true;
  }

  static bool reorderViaTasks({required int oldIndex, required int newIndex}) {
    ViaCalendar calendar = createViaCalendar();
    ViaDay day = createViaDay();
    ViaTask temp;

    temp = day.viaDay.removeAt(oldIndex);
    day.viaDay.insert(newIndex, temp);

    calendar.save();
    return true;
  }

  /// Reorder List<ViaTask> based on Profile tasks swapped indexes
  static bool reorderViaTasksOnProfile(
      {required int oldProfileIndex, required int newProfileIndex}) {
    ViaProfile profile = createViaProfile();
    ViaDay day = createViaDay();
    String oldProfileUID, newProfileUID;
    int oldViaIndex;
    int newViaIndex;

    // get reordered profile uids
    // CAUTION: this algorithm is taking into account bad ReorderableListView code
    // TODO: must create a thorough test to flag when flutter will fix its bug and break our algorithm
    if (newProfileIndex > oldProfileIndex) {
      newProfileIndex--; // this fixes flutter bug
    }
    oldProfileUID = profile.profileTasks.elementAt(oldProfileIndex).uid;
    newProfileUID = profile.profileTasks.elementAt(newProfileIndex).uid;
    // find corresponding ViaTask indexes
    oldViaIndex = day.viaDay
        .indexWhere((element) => element.uid.compareTo(oldProfileUID) == 0);
    newViaIndex = day.viaDay
        .indexWhere((element) => element.uid.compareTo(newProfileUID) == 0);
    if (oldViaIndex == -1 || newViaIndex == -1) {
      return false;
    } else {
      return reorderViaTasks(oldIndex: oldViaIndex, newIndex: newViaIndex);
    }
  }

  /// CRUD interface for via storage:
  /// (true = success and false = failure)
  static ViaCalendar createViaCalendar() {
    final calendarBox = ViaStorage.getViaCalendarBox();
    ViaCalendar calendar;

    if (calendarBox.isEmpty || calendarBox.getAt(0) == null) {
      calendar = ViaCalendar(name: AppHiveStorage.calendarDefaultName);
      calendarBox.add(calendar);
      calendar.save();
    } else {
      calendar = calendarBox.getAt(0)!; // already checked for null
    }
    return calendar;
  }

  static ViaDay createViaDay({DateTime? date}) {
    // first get or create calendar
    ViaCalendar calendar = createViaCalendar();
    DateTime temp;

    if (date == null) {
      temp = ViaTime.getCurrentDay();
    } else {
      temp = date;
    }

    // only single day entry may exist - no duplicates
    // create a new day or return current
    ViaDay day;
    if (calendar.viaCalendar.isEmpty) {
      // create a new day
      day = ViaDay(date: temp);
    } else {
      // check for duplicate dates in ViaDay
      var index = calendar.viaCalendar
          .indexWhere((element) => element.date.isSameDate(temp) == true);
      if (index == -1) {
        // no duplicate - create a new day
        day = ViaDay(date: temp);
      } else {
        // duplicate found
        // return the current day
        day = calendar.viaCalendar.elementAt(index);
        return day; // no need to save calendar
      }
    }
    calendar.viaCalendar.add(day);
    calendar.save();

    return day;
  }

  /// Create a new via task and save to calendar
  static bool createViaTask({
    required String uid,
    required String name,
    DateTime? date,
    String link = "",
    String repeat = "daily",
  }) {
    ViaCalendar calendar = createViaCalendar();
    ViaDay day;
    ViaTask task;
    DateTime currentDate;

    if (date == null) {
      currentDate = ViaTime.getCurrentDay();
    } else {
      currentDate = date;
    }

    // create a new ViaDay or get existing with the current date
    day = createViaDay(date: currentDate);

    // check for existing task name and uid
    var index =
        day.viaDay.indexWhere((element) => element.uid.compareTo(uid) == 0);
    if (index != -1) {
      // existing task uid - task already exists, so skip
      // throw ArgumentError("ArgumentError: duplicate task uid ($uid)");
      return true;
    } else {
      // check for duplicate task name
      var index2 =
          day.viaDay.indexWhere((element) => element.name.compareTo(name) == 0);
      if (index2 != -1) {
        // duplicate name found
        throw FormatException("FormatException: duplicate name ($name)");
      } else {
        // everything ok, create a new via task
        task = ViaTask(
          uid: uid,
          name: name,
          repeat: repeat,
          link: link,
        );
        day.viaDay.add(task);
        calendar.viaCalendar.add(day);
        calendar.save();
        return true;
      }
    }
  }

  /// Create a new profile task and save to profile
  static bool createProfileTask({
    required String uid,
    required String name,
    String link = "",
    int frequency = 1,
  }) {
    ViaProfile profile = createViaProfile();
    ViaProfileTask task;

    // check for duplicate profile task name and uid
    var index = profile.profileTasks
        .indexWhere((element) => element.uid.compareTo(uid) == 0);
    if (index != -1) {
      // duplicate profile task uid
      throw ArgumentError("ArgumentError: duplicate profile task uid ($uid)");
    } else {
      // check if there are no duplicate names
      var index2 = profile.profileTasks
          .indexWhere((element) => element.name.compareTo(name) == 0);
      if (index2 != -1) {
        // duplicate name found
        throw FormatException("FormatException: duplicate name ($name)");
      } else {
        // everything ok, create new profile task
        task = ViaProfileTask(uid: uid, name: name);
        profile.profileTasks.add(task);
        profile.save();
        return true;
      }
    }
  }

  static List<ViaProfileTask> readProfileTasks() {
    ViaProfile profile = createViaProfile();
    return profile.profileTasks;
  }

  static ViaDay readViaDay({DateTime? date}) {
    ViaCalendar calendar = createViaCalendar();
    DateTime tempDate;

    if (date == null) {
      tempDate = ViaTime.getCurrentDay();
    } else {
      tempDate = date;
    }
    var index = calendar.viaCalendar
        .indexWhere((element) => element.date.isSameDate(tempDate));
    if (index == -1) {
      // no ViaDay found at provided date
      return createViaDay();
    } else {
      return calendar.viaCalendar.elementAt(index);
    }
  }

  static updateViaTask({required String name}) {}

  static deleteViaTask({required String uid}) {
    ViaCalendar calendar = createViaCalendar();
    ViaDay day = readViaDay();
    day.viaDay.removeWhere((element) => element.uid.compareTo(uid) == 0);
    calendar.save();
  }

  static deleteProfileTask({required String uid}) {
    ViaProfile profile = createViaProfile();
    profile.profileTasks
        .removeWhere((element) => element.uid.compareTo(uid) == 0);
    profile.save();
  }

  static deleteAllBoxes() {
    getViaCalendarBox().deleteFromDisk();
    getViaProfileBox().deleteFromDisk();
  }

  static toggleDoneViaTask({required String uid}) {
    ViaCalendar calendar = createViaCalendar();
    ViaDay day = readViaDay();
    var index =
        day.viaDay.indexWhere((element) => element.uid.compareTo(uid) == 0);
    if (index != -1) {
      // toggle
      day.viaDay.elementAt(index).done = !day.viaDay.elementAt(index).done;
      calendar.save();
    } else {
      assert(true, "toggleDoneViaTask(): via task uid not found");
    }
  }
}
