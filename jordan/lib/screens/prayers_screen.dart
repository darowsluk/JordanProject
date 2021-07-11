import 'package:flutter/material.dart';
// Custom widgets
import 'package:jordan/widgets/prayerTree_widget.dart';
// Extras
import 'package:jordan/extras/statics.dart';

/////////////////////////////////////////////
/// Displays list of salvatorian prayers  ///
/////////////////////////////////////////////
class PrayersPage extends StatefulWidget {
  const PrayersPage({Key? key}) : super(key: key);

  @override
  _PrayersPageState createState() => _PrayersPageState();
}

class _PrayersPageState extends State<PrayersPage> {
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
