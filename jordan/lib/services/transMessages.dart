import 'package:get/get.dart';

class TrSupportedLanguage {
  static const String defaultLang = "en";
  static const String defaultCountry = "US";
  static const String englishLang = "en";
  static const String usCountry = "US";
  static const String polishLang = "pl";
  static const String polishCountry = "PL";
}

class TrStrings {
  // General
  static const String trCaution = "Caution";
  static const String trDeleteCautionNote = "DeleteCautionNote";
  static const String trDeleteConfirmation = "DeleteConfirmation";
  static const String trDeleteConfirmationNote = "DeleteConfirmationNote";
  static const String trCancel = "Cancel";
  static const String trDelete = "Delete";
  static const String trUnderstand = "Understand";
  static const String trSubmit = "Submit";

  //Language
  static const String trLanguageTitle = "LanguageTitle";
  static const String trLanguageDefault = "LanguageDefault";
  static const String trLanguagePolish = "LanguagePolish";

  // HomePage
  static const String trAppName = "Via Sancti";
  static const String trTabView1 = "TabView1";
  static const String trTabView2 = "TabView2";
  static const String trTabView3 = "TabView3";

  // ProfilePage
  static const String trProfileTitle = "Profile";
  // SettingsPage
  static const String trSettingsTitle = "Settings";
  static const String trSettingsDeveloperTitle = "DeveloperOptions";
  static const String trSettingsDeleteAll = "DeleteAll";
  static const String trSettingsSafetySwitchTitle = 'SafetySwitchTitle';
  static const String trSettingsSafetySwitchSubtitle = 'SafetySwitchSibtitle';

  // SelectPage
  static const String trSelectTitle = "Select";

  // SaintPage
  static const String trSaintTitle = "SaintCard";

  // PlanPage
  static const String trPlanTitle = "SpiritualPlan";
  static const String trPlanSubtitle = "MyRoutine";

  // AddProfileTaskPage
  static const String trProfileTask = "SpiritualTask";
  static const String trProfileTaskValidator = "ProfileTaskValidator";

  // Plugins
  static const String trPluginPrayersTitle = "Prayers";
}

class TransMessages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          TrStrings.trLanguageTitle: "Language",
          TrStrings.trLanguageDefault: "English",
          TrStrings.trLanguagePolish: "Polish",
          TrStrings.trAppName: 'Via Sancti',
          TrStrings.trTabView1: "TASKS",
          TrStrings.trTabView2: "PLAN",
          TrStrings.trTabView3: "HISTORY",
          TrStrings.trCaution: 'Caution!',
          TrStrings.trDeleteCautionNote:
              'All saved data will be deleted.\nApp will exit!',
          TrStrings.trDeleteConfirmation: 'Delete Confirmation',
          TrStrings.trDeleteConfirmationNote:
              'Are you sure you want to delete this item?',
          TrStrings.trCancel: 'Cancel',
          TrStrings.trDelete: 'Delete',
          TrStrings.trUnderstand: 'Understand',
          TrStrings.trSubmit: "Submit",
          TrStrings.trProfileTitle: 'Profile',
          TrStrings.trSettingsTitle: 'Settings',
          TrStrings.trSettingsDeveloperTitle: 'Developer options (ALPHA):',
          TrStrings.trSettingsDeleteAll: 'Delete all data',
          TrStrings.trSettingsSafetySwitchTitle: 'Safety switch',
          TrStrings.trSettingsSafetySwitchSubtitle: 'ask before deleting data',
          TrStrings.trSelectTitle: 'Select',
          TrStrings.trSaintTitle: 'Saint Card',
          TrStrings.trPlanTitle: 'Spiritual Plan',
          TrStrings.trPlanSubtitle: "My Spiritual Routine",
          TrStrings.trProfileTask: "Spiritual task",
          TrStrings.trProfileTaskValidator: "Please enter some text",
          TrStrings.trPluginPrayersTitle: "Prayers",
        },
        'pl_PL': {
          TrStrings.trLanguageTitle: "J??zyk",
          TrStrings.trLanguageDefault: "Angielski",
          TrStrings.trLanguagePolish: "Polski",
          TrStrings.trAppName: 'Via Sancti',
          TrStrings.trTabView1: "ZADANIA",
          TrStrings.trTabView2: "PLAN",
          TrStrings.trTabView3: "HISTORIA",
          TrStrings.trCaution: 'Uwaga!',
          TrStrings.trDeleteCautionNote:
              'Wszystkie dane zostan?? usuni??te, a apka zamkni??ta!',
          TrStrings.trDeleteConfirmation: 'Potwierdzenie usuni??cia danych',
          TrStrings.trDeleteConfirmationNote:
              'Czy na pewno chcesz usun???? ten element?',
          TrStrings.trCancel: 'Odrzu??',
          TrStrings.trDelete: 'Usu??',
          TrStrings.trUnderstand: 'Rozumiem',
          TrStrings.trSubmit: "Zapisz",
          TrStrings.trProfileTitle: 'Profil',
          TrStrings.trSettingsTitle: 'Ustawienia',
          TrStrings.trSettingsDeveloperTitle: 'Opcje programist??w (ALPHA):',
          TrStrings.trSettingsDeleteAll: 'Usu?? wszystkie dane',
          TrStrings.trSettingsSafetySwitchTitle: 'Zaw??r bezpiecze??stwa',
          TrStrings.trSettingsSafetySwitchSubtitle:
              'zapytaj przed usuni??ciem danych',
          TrStrings.trSelectTitle: 'Wybierz',
          TrStrings.trSaintTitle: '??wi??ty Obrazek',
          TrStrings.trPlanTitle: 'Plan ??wi??to??ci',
          TrStrings.trPlanSubtitle: "M??j duchowy porz??dek",
          TrStrings.trProfileTask: "Duchowe zadanie",
          TrStrings.trProfileTaskValidator: "Prosz?? wpisa?? tekst",
          TrStrings.trPluginPrayersTitle: "Modlitwy",
        }
      };
}
