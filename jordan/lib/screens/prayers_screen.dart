import 'package:flutter/material.dart';
// Custom widgets
import 'package:jordan/widgets/prayerTree_widget.dart';
// Extras
import 'package:jordan/extras/statics.dart';

/////////////////////////////////////////////
/// Displays list of salvatorian prayers  ///
/////////////////////////////////////////////
class PrayerPage extends StatefulWidget {
  const PrayerPage({Key? key}) : super(key: key);

  @override
  _PrayerPageState createState() => _PrayerPageState();
}

class _PrayerPageState extends State<PrayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: Text('Modlitwy SDS'),
      ),
      body: const PrayerTreeStatefulWidget(),
    );
  }
}
