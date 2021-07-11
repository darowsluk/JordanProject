import 'package:hive/hive.dart';

// To generate automatic TypeAdapter
// run: flutter packages pub run build_runner build
part 'via_profileTask.g.dart';

@HiveType(typeId: 4)
class ViaProfileTask extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String name;

  /// dynamic link to the content when clicked (default: "" = no link)
  @HiveField(2)
  late String link;

  /// 0:none, 1:Must, 2:Should, 3:Could, 4:Would like
  @HiveField(3)
  late int priority;

  /// persist until marked done
  @HiveField(4)
  late bool untilDone;

  /// 0:once, 1:daily, 2:weekly, 3:monthly, 4:annually
  @HiveField(5)
  late int frequency;

  /// 0:never, 1:Sunday, 2:Monday, 4:Tuesday, 8:Wednesday, 16:Thursday, 32:Friday, 64:Saturday
  @HiveField(6)
  late int repeatWeekday;

  /// 0:never, 1:first, 2:second, 4:third, 8:fourth, 16:last (day of the month)
  @HiveField(7)
  late int repeatDayOfMonth;

  /// 0:never, 1-31:day of the month
  @HiveField(8)
  late int repeatDateDay;

  /// 0:never, 1-12:month
  @HiveField(9)
  late int repeatDateMonth;

  ViaProfileTask({
    required String uid,
    String? name,
    String? link,
  }) {
    this.uid = uid;
    this.name = name ?? "";
    this.link = link ?? "";
    this.priority = 0;
    this.untilDone = false;
    this.frequency = 1; // daily
    this.repeatWeekday = 0;
    this.repeatDayOfMonth = 0;
    this.repeatDateDay = 0;
    this.repeatDateMonth = 0;
  }
}

enum Priority { None, MustHave, Should, Could, Would }
enum Frequency { Never, Daily, Weekly, Monthly, Annually }
