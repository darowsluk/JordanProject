// Screens
import 'package:jordan/screens/display_screen.dart';

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
      subtitleValue: 'Poranne, wieczorne, w różnych intencjach',
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
        Item(
          titleValue: 'Modlitwy o powołania',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
    Item(
      titleValue: 'II. MIESIĘCZNE ODNOWIENIE DUCHOWE',
      subtitleValue: 'Rachunek sumienia, modlitwy rekolekcyjne',
      onTapFunction: null,
      subItems: [
        Item(
          titleValue: 'Modlitwa rekolekcyjna',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Miesięczny rachunek sumienia',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Odnowienie ślubów zakonnych',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Przygotowanie na śmierć',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwa o dobrą śmierć',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Nowicjat duchowy',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
    Item(
      titleValue: 'III. Z CHRYSTUSEM NA DRODZE KRZYŻOWEJ',
      subtitleValue: 'Nabożeństwa Drogi Krzyżowej',
      onTapFunction: null,
      subItems: [
        Item(
          titleValue: 'Droga Krzyżowa kapłana zakonnika',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Droga Krzyżowa zakonnika',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Medytacja o cierpieniach Zbawiciela',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
    Item(
      titleValue: 'IV. ŚWIĘTA PATRONALNE',
      subtitleValue: 'Nowenny i Tridua',
      onTapFunction: null,
      subItems: [
        Item(
          titleValue: 'Nowenna przed Uroczystością Niepokalanego Poczęcia NMP',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Nowenna przed Uroczystością Narodzenia Pańskiego',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Nowenna przed Uroczystością św. Józefa',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Nowenna przed Uroczystością NMP Matki Zbawiciela',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem NMP Królowej Apostołów',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue:
              'Triduum przed Świętem św. Archaniołów Michała, Gabriela i Rafała',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Marka, Ewangelisty',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Apostołów Filipa i Jakuba',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Macieja, Apostoła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Apostołów Piotra i Pawła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Tomasza, Apostoła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Jakuba, Apostoła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Bartłomieja, Apostoła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue:
              'Triduum przed Świętem św. Mateusza, Apostoła i Ewangelisty',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Łukasza, Ewangelisty',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue:
              'Triduum przed Świętem św. Apostołów Szymona i Judy Tadeusza',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Andrzeja, Apostoła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Jana, Apostoła i Ewangelisty',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
    Item(
      titleValue: 'V. INNE NABOŻEŃSTWA I MODLITWY',
      subtitleValue: 'Litania, hymny, modlitwy na różne okresy',
      onTapFunction: null,
      subItems: [
        Item(
          titleValue: 'Litania do Boskiego Zbawiciela',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Hymny',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy do Boga Trójjedynego',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy ku czci NMP',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy do św. Józefa',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy w intencji Kościoła',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy o świętość życia chrześcijańskiego',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy w chorobie i cierpieniu',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy o pokój w duszach i w świecie',
          onTapFunction: DisplayPrayerPage(),
        ),
        Item(
          titleValue: 'Modlitwy za zmarłych',
          onTapFunction: DisplayPrayerPage(),
        ),
      ],
    ),
  ];
}
