// Screens
import 'package:intl/intl.dart';

class Item {
  Item({
    this.titleValue = "",
    this.subtitleValue = "",
    this.subItems,
    this.link = "",
    this.isExpanded = false,
    this.enabled = false,
  });

  String titleValue;
  String subtitleValue;
  List<Item>? subItems;
  String link;
  bool isExpanded;
  bool enabled;
}

/// Select texts based on the current day of the week
String selectOnDay({
  required String day1,
  required String day2,
  required String day3,
  required String day4,
  required String day5,
  required String day6,
  required String day7,
}) {
  DateTime date = DateTime.now();
  String day = DateFormat('EEEE').format(date);
  switch (day) {
    case "Sunday":
      return day1;
    case "Monday":
      return day2;
    case "Tuesday":
      return day3;
    case "Wednesday":
      return day4;
    case "Thursday":
      return day5;
    case "Friday":
      return day6;
    case "Saturday":
      return day7;
    default:
      return day1;
  }
}

/// Generates static list of items in the prayer list
List<Item> generateItems() {
  return [
    Item(
      titleValue: 'I. MODLITWY CODZIENNE',
      subtitleValue: 'Poranne, wieczorne, w różnych intencjach',
      link: "",
      enabled: true,
      subItems: [
        // Item(
        //   titleValue: 'Modlitwy o powołania',
        //   link: PluginPrayerPage(
        //     asset: selectOnDay(
        //         day1: "assets/texts/vocations_sunday.html",
        //         day2: "assets/texts/vocations_monday.html",
        //         day3: "assets/texts/vocations_tuesday.html",
        //         day4: "assets/texts/vocations_wednesday.html",
        //         day5: "assets/texts/vocations_thursday.html",
        //         day6: "assets/texts/vocations_friday.html",
        //         day7: "assets/texts/vocations_saturday.html"),
        //   ),
        //   enabled: true,
        // ),
        Item(
          titleValue: 'Modlitwy o powołania',
          link: "assets/texts/vocations_sunday.html",
          enabled: true,
        ),
        Item(
          titleValue: 'Modlitwy poranne (wersja 1)',
          link: "",
          enabled: false,
        ),
        Item(
          titleValue: 'Modlitwy poranne (wersja 2)',
          link: "",
          enabled: false,
        ),
        Item(
          titleValue: 'Modlitwy wieczorne (wersja 1)',
          link: "",
          enabled: false,
        ),
        Item(
          titleValue: 'Modlitwy wieczorne (wersja 2)',
          link: "",
          enabled: false,
        ),
      ],
    ),
    Item(
      titleValue: 'II. MIESIĘCZNE ODNOWIENIE DUCHOWE',
      subtitleValue: 'Rachunek sumienia, modlitwy rekolekcyjne',
      link: "",
      enabled: true,
      subItems: [
        Item(
          titleValue: 'Modlitwa rekolekcyjna',
          link: "",
        ),
        Item(
          titleValue: 'Miesięczny rachunek sumienia',
          link: "",
        ),
        Item(
          titleValue: 'Odnowienie ślubów zakonnych',
          link: "",
        ),
        Item(
          titleValue: 'Przygotowanie na śmierć',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwa o dobrą śmierć',
          link: "",
        ),
        Item(
          titleValue: 'Nowicjat duchowy',
          link: "",
        ),
      ],
    ),
    Item(
      titleValue: 'III. Z CHRYSTUSEM NA DRODZE KRZYŻOWEJ',
      subtitleValue: 'Nabożeństwa Drogi Krzyżowej',
      link: "",
      enabled: true,
      subItems: [
        Item(
          titleValue: 'Droga Krzyżowa kapłana zakonnika',
          link: "",
        ),
        Item(
          titleValue: 'Droga Krzyżowa zakonnika',
          link: "",
        ),
        Item(
          titleValue: 'Medytacja o cierpieniach Zbawiciela',
          link: "",
        ),
      ],
    ),
    Item(
      titleValue: 'IV. ŚWIĘTA PATRONALNE',
      subtitleValue: 'Nowenny i Tridua',
      link: "",
      enabled: true,
      subItems: [
        Item(
          titleValue: 'Nowenna przed Uroczystością Niepokalanego Poczęcia NMP',
          link: "",
        ),
        Item(
          titleValue: 'Nowenna przed Uroczystością Narodzenia Pańskiego',
          link: "",
        ),
        Item(
          titleValue: 'Nowenna przed Uroczystością św. Józefa',
          link: "",
        ),
        Item(
          titleValue: 'Nowenna przed Uroczystością NMP Matki Zbawiciela',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem NMP Królowej Apostołów',
          link: "",
        ),
        Item(
          titleValue:
              'Triduum przed Świętem św. Archaniołów Michała, Gabriela i Rafała',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Marka, Ewangelisty',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Apostołów Filipa i Jakuba',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Macieja, Apostoła',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Apostołów Piotra i Pawła',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Tomasza, Apostoła',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Jakuba, Apostoła',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Bartłomieja, Apostoła',
          link: "",
        ),
        Item(
          titleValue:
              'Triduum przed Świętem św. Mateusza, Apostoła i Ewangelisty',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Łukasza, Ewangelisty',
          link: "",
        ),
        Item(
          titleValue:
              'Triduum przed Świętem św. Apostołów Szymona i Judy Tadeusza',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Andrzeja, Apostoła',
          link: "",
        ),
        Item(
          titleValue: 'Triduum przed Świętem św. Jana, Apostoła i Ewangelisty',
          link: "",
        ),
      ],
    ),
    Item(
      titleValue: 'V. INNE NABOŻEŃSTWA I MODLITWY',
      subtitleValue: 'Litania, hymny, modlitwy na różne okresy',
      link: "",
      enabled: true,
      subItems: [
        Item(
          titleValue: 'Litania do Boskiego Zbawiciela',
          link: "",
        ),
        Item(
          titleValue: 'Hymny',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy do Boga Trójjedynego',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy ku czci NMP',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy do św. Józefa',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy w intencji Kościoła',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy o świętość życia chrześcijańskiego',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy w chorobie i cierpieniu',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy o pokój w duszach i w świecie',
          link: "",
        ),
        Item(
          titleValue: 'Modlitwy za zmarłych',
          link: "",
        ),
      ],
    ),
  ];
}
