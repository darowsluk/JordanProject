import 'package:flutter/material.dart';
// Screens
import 'package:jordan/screens/display_screen.dart';
// Extras
import 'package:jordan/extras/colors.dart';

/// Defines data structure for prayer list items
class Item {
  Item({
    this.titleValue,
    this.subtitleValue,
    this.subItems,
    this.onTapFunction,
    this.isExpanded = false,
  });

  String titleValue;
  String subtitleValue;
  List<Item> subItems;
  var onTapFunction;
  bool isExpanded;
}

/// Generates static list of items in the prayer list
List<Item> generateItems() {
  return [
    Item(
      titleValue: 'I. MODLITWY CODZIENNE',
      subtitleValue: 'Poranne i wieczorne',
      onTapFunction: null,
      subItems: [
        Item(
          titleValue: 'Modlitwy poranne (wersja 1)',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy poranne (wersja 2)',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy wieczorne (wersja 1)',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy wieczorne (wersja 2)',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
    Item(
      titleValue: 'II. MIESIĘCZNE ODNOWIENIE DUCHOWE',
      subtitleValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          subtitleValue: 'Test1',
          titleValue: 'Test2',
          onTapFunction: null,
        ),
        Item(
          subtitleValue: 'Test3',
          titleValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
    Item(
      titleValue: 'III. DROGA KRZYŻOWA',
      subtitleValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          subtitleValue: 'Test1',
          titleValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
    Item(
      titleValue: 'IV. ŚWIĘTA PATRONALNE',
      subtitleValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          subtitleValue: 'Test1',
          titleValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
    Item(
      titleValue: 'V. NABOŻEŃSTWA',
      subtitleValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          subtitleValue: 'Test1',
          titleValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
  ];
}

/// This is the stateful widget that the main application instantiates.
class PrayerTreeStatefulWidget extends StatefulWidget {
  const PrayerTreeStatefulWidget({Key key}) : super(key: key);

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
            children: item.subItems.map(
              (subItem) {
                return ListTile(
                  title: Text(subItem.titleValue),
                  visualDensity: VisualDensity.compact,
                  trailing: const Icon(
                    Icons.arrow_right,
                    color: AppColors.secondary,
                  ),
                  onTap: () => {
                    if (subItem.onTapFunction != null)
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => subItem.onTapFunction)),
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

/*
/// VERSION with ListView
/// This is the private State class that goes with PrayerTreeStatefulWidget.
class _PrayerTreeStatefulWidgetState extends State<PrayerTreeStatefulWidget> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _data.length,
      separatorBuilder: (context, index) {
        return const Divider(height: 1.0);
      },
      itemBuilder: (context, index) {
        final item = _data[index];
        return ExpansionTile(
          title: Text(item.headerValue,
              style: TextStyle(color: AppColors.highlightText)),
          subtitle: Text(
            item.subtitleValue,
            style: TextStyle(color: AppColors.regularText),
          ),
          children: item.subItems.map((subItem) {
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Text(
                  subItem.subtitleValue,
                ),
              ),
              minVerticalPadding: 0,
              onTap: () => {
                if (subItem.onTapFunction != null)
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => subItem.onTapFunction)),
              },
              trailing: Icon(
                Icons.arrow_right,
                color: AppColors.highlightText,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
*/
