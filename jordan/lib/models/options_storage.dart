import 'package:hive/hive.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/via_options.dart';

/// storage abstraction for use in controller
class OptionsStorage {
  static Box<ViaOptions> getViaOptionsBox() =>
      Hive.box<ViaOptions>(AppHiveStorage.boxViaOptions);

  /// Create new options if necessary
  static ViaOptions createViaOptions() {
    final optionsBox = OptionsStorage.getViaOptionsBox();
    ViaOptions options;

    if (optionsBox.isEmpty || optionsBox.getAt(0) == null) {
      options = ViaOptions();
      optionsBox.add(options);
      options.save();
    } else {
      options = optionsBox.getAt(0)!; // already checked for null
    }
    return options;
  }

  /// Save options to HIVE
  static void saveViaOptions() {
    final optionsBox = OptionsStorage.getViaOptionsBox();
    ViaOptions options;

    if (optionsBox.isEmpty || optionsBox.getAt(0) == null) {
    } else {
      options = optionsBox.getAt(0)!;
      options.save();
    }
  }
}
