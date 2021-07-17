import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/via_options.dart';

class OptionsController extends GetxController {
  final _options = ViaOptions().obs;

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
      _options.value.historySize = size;
    }
  }

  void setEndOfDay({required DateTime time}) {
    _options.value.endOfDay = time;
  }

  /// Toggle safety switch for dangerous actions (deleting data)
  void toggleSafetySwitch() {
    _options.value.safetyCheck = !_options.value.safetyCheck;
  }

  bool getSafetySwitch() {
    return _options.value.safetyCheck;
  }

  /// 0 = "en_US"; 1 = "pl_PL"
  void setLanguage({required int languageID}) {
    switch (languageID) {
      case 0:
        _options.value.languageCode = "en";
        _options.value.countryCode = "US";
        break;
      case 1:
        _options.value.languageCode = "pl";
        _options.value.countryCode = "PL";
        break;
      default:
        _options.value.languageCode = "en";
        _options.value.countryCode = "US";
    }
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
