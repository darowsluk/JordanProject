import 'package:flutter/material.dart';
// Screens
import 'package:jordan/screens/display_screen.dart';
// Extras
import 'package:jordan/extras/colors.dart';

/// Defines data structure for prayer list items
class Item {
  Item({
    this.headerValue,
    this.expandedValue,
    this.subItems,
    this.onTapFunction,
  });

  String expandedValue;
  String headerValue;
  var onTapFunction;
  List<Item> subItems;
}

/// Generates static list of items in the prayer list
List<Item> generateItems() {
  return [
    Item(
      headerValue: 'I. MODLITWY CODZIENNE',
      expandedValue: 'Poranne i wieczorne',
      onTapFunction: null,
      subItems: [
        Item(
          expandedValue: 'Modlitwy poranne (wersja 1)',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          expandedValue: 'Modlitwy poranne (wersja 2)',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          expandedValue: 'Modlitwy wieczorne (wersja 1)',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          expandedValue: 'Modlitwy wieczorne (wersja 2)',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
    Item(
      headerValue: 'II. MIESIĘCZNE ODNOWIENIE DUCHOWE',
      expandedValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          expandedValue: 'Test1',
          headerValue: 'Test2',
          onTapFunction: null,
        ),
        Item(
          expandedValue: 'Test3',
          headerValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
    Item(
      headerValue: 'III. DROGA KRZYŻOWA',
      expandedValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          expandedValue: 'Test1',
          headerValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
    Item(
      headerValue: 'IV. ŚWIĘTA PATRONALNE',
      expandedValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          expandedValue: 'Test1',
          headerValue: 'Test2',
          onTapFunction: null,
        ),
      ],
    ),
    Item(
      headerValue: 'V. NABOŻEŃSTWA',
      expandedValue: 'Nabożeństwo słowa Bożego',
      onTapFunction: null,
      subItems: [
        Item(
          expandedValue: 'Test1',
          headerValue: 'Test2',
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
            item.expandedValue,
            style: TextStyle(color: AppColors.regularText),
          ),
          children: item.subItems.map((subItem) {
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                child: Text(
                  subItem.expandedValue,
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
