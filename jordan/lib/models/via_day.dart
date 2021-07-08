import 'package:hive/hive.dart';
import 'package:jordan/models/via_task.dart';
import 'package:nanoid/nanoid.dart';

// To generate automatic TypeAdapter
// run: flutter packages pub run build_runner build
part 'via_day.g.dart';

@HiveType(typeId: 1)
class ViaDay extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late DateTime date;

  @HiveField(3)
  late List<ViaTask> viaDay;

  ViaDay({
    required DateTime date,
    this.description = "",
  }) {
    this.uid = nanoid();
    this.date = date;
    this.viaDay = List<ViaTask>.empty(growable: true);
  }
}
