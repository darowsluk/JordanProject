import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/options_storage.dart';
import 'package:jordan/models/via_calendar.dart';
import 'package:jordan/models/via_options.dart';
import 'package:jordan/models/via_profile.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:jordan/models/via_task.dart';
import 'package:jordan/models/via_day.dart';
import 'package:jordan/services/timeManager.dart';
import 'package:path_provider/path_provider.dart';

/// Exposes storage global functions
class ViaStorage {
  static Box<ViaCalendar> getViaCalendarBox() =>
      Hive.box<ViaCalendar>(AppHiveStorage.boxViaCalendar);
  static Box<ViaProfile> getViaProfileBox() =>
      Hive.box<ViaProfile>(AppHiveStorage.boxViaProfile);

  /// Call from main() to initialize HIVE storage
  static Future initializeStorage() async {
    if (GetPlatform.isWeb) {
      //Hive.init();
    } else {
      var dir = await getApplicationDocumentsDirectory();
      Hive..init(dir.path);
    }
    Hive
      ..registerAdapter(ViaTaskAdapter())
      ..registerAdapter(ViaDayAdapter())
      ..registerAdapter(ViaCalendarAdapter());
    await Hive.openBox<ViaCalendar>(AppHiveStorage.boxViaCalendar);

    Hive
      ..registerAdapter(ViaProfileTaskAdapter())
      ..registerAdapter(ViaProfileAdapter());
    await Hive.openBox<ViaProfile>(AppHiveStorage.boxViaProfile);

    Hive.registerAdapter(ViaOptionsAdapter());
    await Hive.openBox<ViaOptions>(AppHiveStorage.boxViaOptions);

    // initialize current calendar day from profile (if necessary)
    ViaStorage.createDayFromProfile();

    // initialize default options (if necessary)
    OptionsStorage.initializeViaOptions(initLocale: Get.deviceLocale);
    return true;
  }

  /// Populate new day with tasks based on current profile
  static void createDayFromProfile() {
    // currently only single profile and calendar may exist
    ViaProfile? profile = createViaProfile();
    ViaCalendar calendar = _createViaCalendar();

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
      _createViaTask(
          uid: task.uid, name: task.name, link: task.link, repeat: "daily");
      //         uid: task.uid, name: task.name, link: task.link, repeat: "daily");
      // switch (Frequency.values[task.frequency]) {
      //   case Frequency.Never:
      //     if (task.untilDone) {
      //       createViaTask(uid: task.uid, name: task.name, link: task.link);
      //     } else {
      //       // TODO: safe to delete task from profile as done (maybe keep as history)
      //     }
      //     break;
      //   case Frequency.Daily:
      //     // create new task or update existing one (dirty flag?)
      //     createViaTask(
      //         uid: task.uid, name: task.name, link: task.link, repeat: "daily");
      //     break;
      //   case Frequency.Weekly:
      //     break;
      //   case Frequency.Monthly:
      //     break;
      //   case Frequency.Annually:
      //     break;
      //   default:
      //   // fall-through for future updates
      // }
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

  static bool _reorderViaTasks({required int oldIndex, required int newIndex}) {
    ViaCalendar calendar = _createViaCalendar();
    ViaDay day = _createViaDay();
    ViaTask temp;

    temp = day.viaDay.removeAt(oldIndex);
    day.viaDay.insert(newIndex, temp);

    calendar.save();
    return true;
  }

  /// Reorder List<ViaTask> based on Profile tasks swapped indexes
  static bool reorderViaTasksOnProfile(
      {required ViaProfile profile,
      required int oldProfileIndex,
      required int newProfileIndex}) {
    ViaDay day = _createViaDay();
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
      return _reorderViaTasks(oldIndex: oldViaIndex, newIndex: newViaIndex);
    }
  }

  /// CRUD interface for via storage:
  /// (true = success and false = failure)
  static ViaCalendar _createViaCalendar() {
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

  static ViaDay _createViaDay({DateTime? date}) {
    // first get or create calendar
    ViaCalendar calendar = _createViaCalendar();
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
  static bool _createViaTask({
    required String uid,
    required String name,
    DateTime? date,
    String link = "",
    String repeat = "daily",
  }) {
    ViaCalendar calendar = _createViaCalendar();
    ViaDay day;
    ViaTask task;
    DateTime currentDate;

    if (date == null) {
      currentDate = ViaTime.getCurrentDay();
    } else {
      currentDate = date;
    }

    // create a new ViaDay or get existing with the current date
    day = _createViaDay(date: currentDate);

    // check for existing task name and uid
    var index =
        day.viaDay.indexWhere((element) => element.uid.compareTo(uid) == 0);
    if (index != -1) {
      // editing existing task
      task = day.viaDay.elementAt(index);
      task.name = name;
      task.link = link;
      task.repeat = repeat;
      //day.viaDay.add(task);
      //calendar.viaCalendar.add(day);
      calendar.save();
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

  static ViaDay readViaDay({DateTime? date}) {
    ViaCalendar calendar = _createViaCalendar();
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
      return _createViaDay();
    } else {
      return calendar.viaCalendar.elementAt(index);
    }
  }

  static saveCurrentDay() {
    ViaCalendar calendar = _createViaCalendar();
    calendar.save();
  }

  static deleteViaTask({required String uid}) {
    ViaCalendar calendar = _createViaCalendar();
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

  static toggleDoneViaTask({required String uid}) {
    ViaCalendar calendar = _createViaCalendar();
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
