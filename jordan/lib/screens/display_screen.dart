import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/colors.dart';

//////////////////////////////////////////////////////////////////////////
/// Displays prayer through the intercession of Blessed Francis Jordan ///
//////////////////////////////////////////////////////////////////////////
class DisplayPrayerPage extends StatelessWidget {
  const DisplayPrayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
      ),
      body: Container(
        child: Text(
          "Teksty modlitw...",
          softWrap: true,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            // color: Colors.white,
          ),
        ),
      ),
    );
  }
}
