import 'package:hive/hive.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/via_day.dart';
import 'package:nanoid/nanoid.dart';

// To generate automatic TypeAdapter
// run: flutter packages pub run build_runner build
part 'via_calendar.g.dart';

@HiveType(typeId: 2)
class ViaCalendar extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String version;

  @HiveField(2)
  late String name;

  @HiveField(3)
  late List<ViaDay> viaCalendar;

  ViaCalendar({
    required String name,
  }) {
    this.uid = nanoid();
    this.version = AppHiveStorage.storageVersion;
    this.name = name;
    this.viaCalendar = List<ViaDay>.empty(growable: true);
  }
}
