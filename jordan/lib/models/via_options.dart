import 'package:hive/hive.dart';
import 'package:jordan/services/transMessages.dart';

// To generate automatic TypeAdapter for HIVE
// run: flutter packages pub run build_runner build
part 'via_options.g.dart';

@HiveType(typeId: 5)
class ViaOptions extends HiveObject {
  @HiveField(0)

  /// Time when the next day begins
  late DateTime endOfDay;

  @HiveField(1)

  /// Number of days kept in history (default = 10)
  late int historySize;

  @HiveField(2)

  /// Internationalization - language code (ex. "en" = English)
  late String languageCode;

  @HiveField(3)

  /// Internationalization - country code (ex. "US" = United States)
  late String countryCode;

  @HiveField(4)

  /// Switch for poping dialog boxes when taking dangerous actions (ex. deleting data)
  late bool safetyCheck;

  /// Default Constructor
  ViaOptions({
    DateTime? endOfDay,
    int? historySize,
    String? languageCode,
    String? countryCode,
    bool? safetyCheck,
  }) {
    this.endOfDay =
        endOfDay ?? DateTime(2000, 01, 01, 23, 59); // almost midnight
    this.historySize = historySize ?? 10;
    this.languageCode = languageCode ?? TrSupportedLanguage.englishLang;
    this.countryCode = countryCode ?? TrSupportedLanguage.usCountry;
    this.safetyCheck = safetyCheck ?? true;
  }
}
