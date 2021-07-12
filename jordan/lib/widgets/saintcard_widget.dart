import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/screens/saint_screen.dart';

class SaintCardWidget extends StatelessWidget {
  const SaintCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppMargins.edgeInsets),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutes.saint);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
          child: Image.asset(
            "assets/images/Jordan_150px.jpg",
          ),
        ),
      ),
    );
  }
}
