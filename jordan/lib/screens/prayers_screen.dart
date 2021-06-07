import 'package:flutter/material.dart';
// Custom widgets
import 'package:jordan/widgets/decoratedBox_widget.dart';
// Extras
import 'package:jordan/extras/colors.dart';

/////////////////////////////////////////////
/// Displays list of salvatorian prayers  ///
/////////////////////////////////////////////
class PrayerPage extends StatelessWidget {
  const PrayerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: Text('Modlitwy SDS'),
      ),
      body: Container(
          child: ListView(
        children: <Widget>[
          buildDecoradedBoxWidget(
            child: Text(
              'I. MODLITWY W CIĄGU DNIA',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
          ),
          buildDecoradedBoxWidget(
            child: Text(
              'II. MIESIĘCZNE ODNOWIENIE DUCHOWE',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
          ),
          buildDecoradedBoxWidget(
            child: Text(
              'III. Z CHRYSTUSEM NA DRODZE KRZYŻOWEJ',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
          ),
          buildDecoradedBoxWidget(
            child: Text(
              'IV. ŚWIĘTA PATRONALNE, NOWENNY I TRIDUA',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
          ),
          buildDecoradedBoxWidget(
            child: Text(
              'V. INNE NABOŻEŃSTWA I MODLITWY',
              textAlign: TextAlign.start,
              style: TextStyle(color: AppColors.highlightText),
            ),
          ),
        ],
      )),
    );
  }
}
