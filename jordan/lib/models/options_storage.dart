import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/via_options.dart';
import 'package:jordan/services/transMessages.dart';

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

  /// Initialize options
  static initializeViaOptions({required Locale? initLocale}) {
    final optionsBox = OptionsStorage.getViaOptionsBox();
    ViaOptions options;

    if (optionsBox.isEmpty || optionsBox.getAt(0) == null) {
      options = ViaOptions();

      // initialize language
      if (initLocale == null) {
        options.countryCode = TrSupportedLanguage.defaultCountry;
        options.languageCode = TrSupportedLanguage.defaultLang;
      } else {
        options.countryCode = initLocale.countryCode ?? "";
        options.languageCode = initLocale.languageCode;
      }
      optionsBox.add(options);
      options.save();
    } else {
      // use data from HIVE
    }
  }

  /// Get country code
  static String getCountryCode() {
    ViaOptions options = createViaOptions();
    return options.countryCode;
  }

  /// Get language code
  static String getLanguageCode() {
    ViaOptions options = createViaOptions();
    return options.languageCode;
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
