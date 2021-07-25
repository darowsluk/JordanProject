import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/services/transMessages.dart';
// Custom widgets
import 'package:jordan/views/widgets/prayerTree_widget.dart';
// Extras
import 'package:jordan/extras/statics.dart';

/// Displays list of plugins
class PluginContainerPage extends StatefulWidget {
  const PluginContainerPage({Key? key}) : super(key: key);

  @override
  _PluginContainerPageState createState() => _PluginContainerPageState();
}

class _PluginContainerPageState extends State<PluginContainerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
        title: Text(TrStrings.trPluginPrayersTitle.tr),
      ),
      body: const PrayerTreeStatefulWidget(),
    );
  }
}
