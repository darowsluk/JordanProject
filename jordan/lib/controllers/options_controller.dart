import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/options_storage.dart';

class OptionsController extends GetxController {
  final _options = OptionsStorage.createViaOptions().obs;

  DateTime getEndOfDay() {
    return _options.value.endOfDay;
  }

  String getEndOfDayString() {
    return DateFormat('HH:mm').format(_options.value.endOfDay);
  }

  int getHistorySize() {
    return _options.value.historySize;
  }

  void setHistorySize({required int size}) {
    if (size > 0 && size < AppOptions.maxHistorySize) {
      _options.update((val) {
        _options.value.historySize = size;
        OptionsStorage.saveViaOptions();
      });
    }
  }

  void setEndOfDay({required DateTime time}) {
    _options.update((val) {
      _options.value.endOfDay = time;
      OptionsStorage.saveViaOptions();
    });
  }

  /// Toggle safety switch for dangerous actions (deleting data)
  void toggleSafetySwitch() {
    _options.update((val) {
      _options.value.safetyCheck = !_options.value.safetyCheck;
      OptionsStorage.saveViaOptions();
    });
  }

  bool getSafetySwitch() {
    return _options.value.safetyCheck;
  }

  /// "en" = "en_US"; "pl" = "pl_PL"
  void setLanguage({required String? languageID, bool update = false}) {
    _options.update(
      (val) {
        switch (languageID) {
          case "en":
            _options.value.languageCode = "en";
            _options.value.countryCode = "US";
            break;
          case "pl":
            _options.value.languageCode = "pl";
            _options.value.countryCode = "PL";
            break;
          default:
            _options.value.languageCode = "en";
            _options.value.countryCode = "US";
        }
        OptionsStorage.saveViaOptions();
        if (update) {
          Get.updateLocale(
              Locale(_options.value.languageCode, _options.value.countryCode));
        }
      },
    );
  }

  /// ex. "en" or "pl"
  String getLanguageCode() {
    return _options.value.languageCode;
  }

  /// ex. "US" or "PL"
  String getCountryCode() {
    return _options.value.countryCode;
  }
}
