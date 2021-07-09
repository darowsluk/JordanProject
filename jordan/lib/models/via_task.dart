import 'package:hive/hive.dart';

// To generate automatic TypeAdapter
// run: flutter packages pub run build_runner build
part 'via_task.g.dart';

@HiveType(typeId: 0)
class ViaTask extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late bool done;

  /// dynamic link to content when clicked (default: no link)
  @HiveField(3)
  late String link;

  @HiveField(4)
  late String repeat; // for read only archivization (ex: "daily")

  ViaTask({
    required String uid,
    String? name,
    String? link,
    String? repeat,
  }) {
    this.uid = uid;
    this.name = name ?? "";
    this.done = false;
    this.link = link ?? "";
    this.repeat = repeat ?? "";
  }
}
