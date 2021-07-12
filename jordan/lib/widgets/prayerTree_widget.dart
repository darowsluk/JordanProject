import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Data
import 'package:jordan/data/prayer_list.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/plugins/pluginPrayer_screen.dart';
import 'package:jordan/widgets/planner_widget.dart';

/// Defines data structure for prayer list items
class PrayerTreeStatefulWidget extends StatefulWidget {
  const PrayerTreeStatefulWidget({Key? key}) : super(key: key);

  @override
  State<PrayerTreeStatefulWidget> createState() =>
      _PrayerTreeStatefulWidgetState();
}

/// VERSION with ExpansionPanelList
/// This is the private State class that goes with MyStatefulWidget.
class _PrayerTreeStatefulWidgetState extends State<PrayerTreeStatefulWidget> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.titleValue,
                  style: TextStyle(color: AppColors.highlightText)),
              subtitle: Text(item.subtitleValue,
                  style: TextStyle(color: AppColors.regularText)),
              visualDensity: VisualDensity.comfortable,
            );
          },
          body: Column(
            children: item.subItems!.map(
              (subItem) {
                return ListTile(
                  enabled: subItem.enabled,
                  title: Text(subItem.titleValue),
                  visualDensity: VisualDensity.compact,
                  trailing: subItem.enabled
                      ? const Icon(
                          Icons.arrow_right,
                          color: AppColors.secondary,
                        )
                      : const Icon(
                          Icons.lock_outline,
                          color: AppColors.disabled,
                        ),
                  onTap: () => {
                    if (subItem.link.isNotEmpty)
                      Get.to(() => PluginPrayerPage(),
                              arguments: Arguments(subItem.link, true))
                          ?.then((value) {
                        if (value != null) {
                          String temp = value as String;
                          if (temp.isNotEmpty) {
                            // pass link back to the add profile page
                            Get.back(result: temp);
                          }
                        }
                      }),
                    // Get.to(() => subItem.onTapFunction),
                  },
                );
              },
            ).toList(),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
