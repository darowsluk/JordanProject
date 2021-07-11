import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/widgets/htmlBuilder_widget.dart';

import 'dart:async' show Future;

import 'package:jordan/widgets/planner_widget.dart';

Future<String> loadAsset(BuildContext context, String asset) async {
  return await DefaultAssetBundle.of(context).loadString(asset);
}

//////////////////////////////////////////////////////////////////////////
/// Displays prayer through the intercession of Blessed Francis Jordan ///
//////////////////////////////////////////////////////////////////////////
class DisplayPrayerPage extends StatefulWidget {
  DisplayPrayerPage({
    Key? key,
  }) : super(key: key);

  @override
  _DisplayPrayerPageState createState() => _DisplayPrayerPageState();
}

class _DisplayPrayerPageState extends State<DisplayPrayerPage> {
  late final Arguments _args;

  @override
  void initState() {
    super.initState();
    _args = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    if (_args.link.isEmpty) {
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
          future: loadAsset(context, _args.link),
          initialData: 'Loading text...',
          builder: (BuildContext context, AsyncSnapshot<String> text) {
            if (text.data == null) {
              AssertionError();
              return Text("");
            } else {
              return BuildHtml(data: text.data!);
            }
          },
        ),
        floatingActionButton: Visibility(
          visible: _args.show,
          child: FloatingActionButton(
            onPressed: () => Get.back(result: _args.link),
            child: const Icon(Icons.add),
            backgroundColor: AppColors.primary,
            elevation: 8,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      );
    }
  }
}
