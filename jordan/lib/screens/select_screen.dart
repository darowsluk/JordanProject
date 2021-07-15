import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.close_rounded),
          onTap: () => Get.back(),
        ),
        backgroundColor: AppColors.background,
        //title: Text(TrStrings.trSelectTitle.tr),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(
              padding: EdgeInsets.all(AppMargins.edgeInsets),
              children: [
                Card(
                    color: AppColors.background,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Zaplanuj swoją drogę świętości",
                          style:
                              TextStyle(fontSize: AppTextStyle.defaultTextSize),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Wybrane ćwiczenia zostaną dodane do Twojego planu duchowego",
                          style: TextStyle(color: AppColors.normalText),
                        ),
                        SizedBox(
                          height: 32,
                        )
                      ],
                    )),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () => Get.toNamed(AppRoutes.selectWays),
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(AppMargins.cornerRadius),
                          child: Image.asset(
                            "assets/images/Jordan_bar.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Positioned(
                          bottom: AppMargins.separation,
                          left: AppMargins.separation / 2,
                          child: Container(
                            padding: EdgeInsets.all(AppMargins.edgeInsets / 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                  AppMargins.cornerRadius),
                              //color: AppColors.disabled,
                            ),
                            child: Text(
                              "Drogi Salwatoriańskie",
                              style: TextStyle(
                                  fontSize: AppTextStyle.defaultTextSize),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppMargins.cornerRadius),
                        child: Image.asset(
                          "assets/images/prayer_bar.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        bottom: AppMargins.separation,
                        left: AppMargins.separation / 2,
                        child: Container(
                          padding: EdgeInsets.all(AppMargins.edgeInsets / 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(AppMargins.cornerRadius),
                            //color: AppColors.disabled,
                          ),
                          child: Text(
                            "Modlitwy",
                            style: TextStyle(
                                fontSize: AppTextStyle.defaultTextSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppMargins.cornerRadius),
                        child: Image.asset(
                          "assets/images/library_bar.jpg",
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        bottom: AppMargins.separation,
                        left: AppMargins.separation / 2,
                        child: Container(
                          padding: EdgeInsets.all(AppMargins.edgeInsets / 4),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                BorderRadius.circular(AppMargins.cornerRadius),
                            //color: AppColors.disabled,
                          ),
                          child: Text(
                            "Biblioteka Duchowa",
                            style: TextStyle(
                                fontSize: AppTextStyle.defaultTextSize),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
