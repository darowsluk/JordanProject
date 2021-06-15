import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/widgets/htmlBuilder_widget.dart';

import 'dart:async' show Future;

Future<String> loadAsset(BuildContext context) async {
  return await DefaultAssetBundle.of(context)
      .loadString("assets/texts/vocations.html");
}

//////////////////////////////////////////////////////////////////////////
/// Displays prayer through the intercession of Blessed Francis Jordan ///
//////////////////////////////////////////////////////////////////////////
class DisplayPrayerPage extends StatefulWidget {
  DisplayPrayerPage({Key key}) : super(key: key);

  @override
  _DisplayPrayerPageState createState() => _DisplayPrayerPageState();
}

class _DisplayPrayerPageState extends State<DisplayPrayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Modlitwy SDS"),
        backgroundColor: AppColors.foreground,
      ),
      body: FutureBuilder(
          future: loadAsset(context),
          initialData: 'Loading text...',
          builder: (BuildContext context, AsyncSnapshot<String> text) {
            return BuildHtml(data: text.data);
          }),
    );
  }
}
