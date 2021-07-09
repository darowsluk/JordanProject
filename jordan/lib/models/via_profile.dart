import 'package:hive/hive.dart';
import 'package:jordan/models/via_profileTask.dart';
import 'package:nanoid/nanoid.dart';

// To generate automatic TypeAdapter
// run: flutter packages pub run build_runner build
part 'via_profile.g.dart';

@HiveType(typeId: 3)
class ViaProfile extends HiveObject {
  @HiveField(0)
  late String uid;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late List<ViaProfileTask> profileTasks;

  ViaProfile({
    required String name,
  }) {
    this.uid = nanoid();
    this.name = name;
    this.profileTasks = List<ViaProfileTask>.empty(growable: true);
  }
}
