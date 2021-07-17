import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/services/transMessages.dart';
import 'package:jordan/views/widgets/htmlBuilder_widget.dart';

import 'dart:async' show Future;

import 'package:jordan/views/widgets/taskView_widget.dart';

Future<String> loadAsset(BuildContext context, String asset) async {
  return await DefaultAssetBundle.of(context).loadString(asset);
}

/// Displays prayer plugin with passed link
class PluginPrayerPage extends StatefulWidget {
  PluginPrayerPage({
    Key? key,
  }) : super(key: key);

  @override
  _PluginPrayerPageState createState() => _PluginPrayerPageState();
}

class _PluginPrayerPageState extends State<PluginPrayerPage> {
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
          title: Text(TrStrings.trPluginPrayersTitle.tr),
          backgroundColor: AppColors.foreground,
        ),
        body: Text(""),
      );
    } else {
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          title: Text(TrStrings.trPluginPrayersTitle.tr),
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
