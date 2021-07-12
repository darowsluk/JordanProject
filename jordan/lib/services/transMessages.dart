import 'package:get/get.dart';

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

  /// HomePage
  static const String trAppName = "Via Sancti";

  // ProfilePage
  static const String trProfileTitle = "Profile";
  // SettingsPage
  static const String trSettingsTitle = "Settings";
  static const String trSettingsDeveloperTitle = "DeveloperOptions";
  static const String trSettingsDeleteAll = "DeleteAll";

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
          TrStrings.trAppName: 'Via Sancti',
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
          TrStrings.trSaintTitle: 'Saint Card',
          TrStrings.trPlanTitle: 'Spiritual Plan',
          TrStrings.trPlanSubtitle: "My Spiritual Routine",
          TrStrings.trProfileTask: "Spiritual task",
          TrStrings.trProfileTaskValidator: "Please enter some text",
          TrStrings.trPluginPrayersTitle: "Prayers",
        },
        'pl_PL': {
          TrStrings.trAppName: 'Via Sancti',
          TrStrings.trCaution: 'Uwaga!',
          TrStrings.trDeleteCautionNote:
              'Wszystkie dane zostaną usunięte, a apka zamknięta!',
          TrStrings.trDeleteConfirmation: 'Potwierdzenie usunięcia danych',
          TrStrings.trDeleteConfirmationNote:
              'Czy na pewno chcesz usunąć ten element?',
          TrStrings.trCancel: 'Odrzuć',
          TrStrings.trDelete: 'Usuń',
          TrStrings.trUnderstand: 'Rozumiem',
          TrStrings.trSubmit: "Zapisz",
          TrStrings.trProfileTitle: 'Profil',
          TrStrings.trSettingsTitle: 'Ustawienia',
          TrStrings.trSettingsDeveloperTitle: 'Opcje programistów (ALPHA):',
          TrStrings.trSettingsDeleteAll: 'Usuń wszystkie dane',
          TrStrings.trSaintTitle: 'Święty Obrazek',
          TrStrings.trPlanTitle: 'Plan Świętości',
          TrStrings.trPlanSubtitle: "Mój duchowy porządek",
          TrStrings.trProfileTask: "Duchowe zadanie",
          TrStrings.trProfileTaskValidator: "Proszę wpisać tekst",
          TrStrings.trPluginPrayersTitle: "Modlitwy",
        }
      };
}
