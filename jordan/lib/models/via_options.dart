import 'package:hive/hive.dart';

// To generate automatic TypeAdapter
// run: flutter packages pub run build_runner build
part 'via_options.g.dart';

@HiveType(typeId: 5)
class ViaOptions extends HiveObject {
  @HiveField(0)
  late DateTime endOfDay;

  @HiveField(1)
  late int historySize;
}
