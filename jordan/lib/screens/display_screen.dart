import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/widgets/htmlBuilder_widget.dart';

import 'dart:async' show Future;

Future<String> loadAsset(BuildContext context, String asset) async {
  return await DefaultAssetBundle.of(context).loadString(asset);
}

//////////////////////////////////////////////////////////////////////////
/// Displays prayer through the intercession of Blessed Francis Jordan ///
//////////////////////////////////////////////////////////////////////////
class DisplayPrayerPage extends StatelessWidget {
  DisplayPrayerPage({
    Key? key,
    this.asset,
  }) : super(key: key);

  final String? asset;

  @override
  Widget build(BuildContext context) {
    if (asset == null) {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text("Modlitwy SDS"),
          backgroundColor: AppColors.foreground,
        ),
        body: Text(""),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text("Modlitwy SDS"),
          backgroundColor: AppColors.foreground,
        ),
        body: FutureBuilder(
            future: loadAsset(context, asset!),
            initialData: 'Loading text...',
            builder: (BuildContext context, AsyncSnapshot<String> text) {
              if (text.data == null) {
                AssertionError();
                return Text("");
              } else {
                return BuildHtml(data: text.data!);
              }
            }),
      );
    }
  }
}
