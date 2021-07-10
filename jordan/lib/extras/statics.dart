import 'package:flutter/material.dart';

class AppColors {
  static const Color foreground = const Color.fromRGBO(24, 33, 54, 1.0);
  static const Color background = const Color.fromRGBO(14, 17, 33, 1.0);
  static const Color textBackground = const Color.fromRGBO(244, 235, 208, 1.0);
  static const Color highlightText = Colors.amber;
  static const Color regularText = Colors.white;
  static const Color darkText = Colors.black87;
  static const Color primary = Colors.orange;
  static const Color secondary = Colors.green;
  static const Color disabled = Colors.blueGrey;
}

class AppTextStyle {
  static const double defaultTextSize = 18;
}

class AppStrings {
  /// "Via Sancti"
  static const String appName = "Via Sancti";

  /// "Settings"
  static const String titleSettings = "Settings";
}

class AppNavigator {
  /// "/"
  static const String home = '/';

  /// "/saint"
  static const String saint = '/saint';

  /// "/plan"
  static const String plan = '/plan';

  /// "/settings"
  static const String settings = '/settings';
}

class AppMargins {
  static const double edgeInsets = 16.0;
  static const double cornerRadius = 4.0;
  static const double separation = 16.0;
}

class AppSaintCard {
  static const String title = "Saint Card";

  /// Name of the asset image for saint card
  static const String cardAsset = "assets/images/Jordan_600px.jpg";

  /// Large saint card image proportions: 3/4
  static const double cardProportions = 3.0 / 4.0;

  /// Size of the card in relationship to available screen: from 0.1 - 1.0
  static const double cardScale = 0.9;

  /// Maximum width of the saint card image asset
  static const double maxWidth = 600;

  /// Maximum height of the saint card image asset
  static const double maxHeight = 800;

  /// Margins for the large saint card image display
  static const double cardMargins = 32;

  static const String jordanPrayerTitle =
      "Modlitwa przez wstawiennictwo Bł. Franciszka Marii od Krzyża Jordana";
  static const String jordanPrayer =
      "Panie Jezu Chryste, Zbawicielu świata, * przez wstawiennictwo Błogosławionego Franciszka Marii od Krzyża Jordana, * któremu udzieliłeś daru głębokiej i żywej wiary, * niezachwianej nadziei i heroicznej miłości Boga i bliźniego * oraz wielkiej gorliwości o zbawienie dusz, * prosimy Cię, * obdarz nas głęboką wiarą i otwartym sercem, * abyśmy nigdy nie spoczęli w poznawaniu Ciebie i głoszeniu Ewangelii wszystkim narodom. * Udziel nam również łaski, * o którą Cię pokornie prosimy. * Który żyjesz i królujesz na wieki wieków. * Amen.";
  static const String jordanPrayerEndnote =
      "Imprimatur: abp Marek Jędraszewski\nKraków, 29 kwietnia 2021 r., nr 1541/2021";
}

class AppPlan {
  static const String title = "Spiritual Plan";
}

class AppHiveStorage {
  static const String storageVersion =
      "v1.0.0"; // todo: automatic versioning of storage datastructure
  static const String boxViaProfile = "viaprofile";
  static const String boxViaCalendar = "viacalendar";
  static const String boxViaOptions = "viaoptions";
  static const String calendarDefaultName = "My Spiritual Calendar";
  static const String profileDefaultName = "My Spiritual Profile";
}

class AppOptions {
  static const bool confirmDelete = true;
}
