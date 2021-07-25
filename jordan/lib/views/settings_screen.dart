import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/options_controller.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

/// Displays options screen from drawer
class SettingsPage extends StatelessWidget {
  SettingsPage({
    Key? key,
  }) : super(key: key);

  final OptionsController _optionsController = Get.put(OptionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(TrStrings.trSettingsTitle.tr),
        backgroundColor: AppColors.foreground,
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(AppMargins.edgeInsets),
          child: ListView(
            children: <Widget>[
              SizedBox(height: AppMargins.separation),
              Obx(
                () => ListTile(
                  title: Text(TrStrings.trLanguageTitle.tr),
                  trailing: DropdownButton<String>(
                    underline: Text(""),
                    icon: Icon(Icons.arrow_drop_down),
                    value: _optionsController.getLanguageCode(),
                    items: [
                      DropdownMenuItem<String>(
                        child: Text(TrStrings.trLanguagePolish.tr),
                        value: TrSupportedLanguage.polishLang,
                      ),
                      DropdownMenuItem<String>(
                          child: Text(TrStrings.trLanguageDefault.tr),
                          value: TrSupportedLanguage.englishLang)
                    ],
                    onChanged: (String? value) {
                      _optionsController.setLanguage(
                          languageID: value, update: true);
                    },
                  ),
                ),
              ),
              Obx(
                () => ListTile(
                  title: Text(TrStrings.trSettingsSafetySwitchTitle.tr),
                  subtitle: Text(TrStrings.trSettingsSafetySwitchSubtitle.tr),
                  trailing: Switch(
                      value: _optionsController.getSafetySwitch(),
                      onChanged: (bool newValue) => {
                            _optionsController.toggleSafetySwitch(),
                          }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
