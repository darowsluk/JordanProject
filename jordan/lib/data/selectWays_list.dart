import 'package:jordan/models/via_profileTask.dart';

class SelectWayItem {
  SelectWayItem({
    this.title = "",
    this.subtitle = "",
    this.image = "",
    required this.listProfileTasks,
  });

  String title;
  String subtitle;
  String image;
  List<ViaProfileTask> listProfileTasks;
}

/// Generates static list of items in the prayer list
List<SelectWayItem> generateSelectWayItems() {
  return [
    SelectWayItem(
        title: 'Sympatycy SDS',
        subtitle: 'Wsparcie modlitewne',
        image: "assets/images/Jordan_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa o powołania',
              link: 'codziennie')
        ]),
    SelectWayItem(
        title: 'Ministranci',
        subtitle: 'Liturgiczna Służba Ołtarza',
        image: "assets/images/Ministranci_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa o powołania',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Służba niedzielna', link: 'w niedziele'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Służba tygodniowa',
              link: 'raz w tygodniu'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Zbiórka ministrantów', link: 'w sobotę'),
        ]),
    SelectWayItem(
        title: 'RMS',
        subtitle: 'Ruch Młodzieży Salwatoriańskiej',
        image: "assets/images/RMS_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Dziesiątka różańca', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Spotkania w grupie parafialnej',
              link: 'raz w tygodniu'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Rekolekcje RMS', link: 'raz w roku'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Forum młodych', link: 'raz w roku'),
        ]),
    SelectWayItem(
        title: 'SOP',
        subtitle: 'Salwatoriański Ośrodek Powołań',
        image: "assets/images/SOP_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Dziesiątka różańca', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa o powołania',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Rekolekcje powołaniowe',
              link: 'raz w roku'),
        ]),
    SelectWayItem(
        title: 'Salwatorianie Świeccy',
        subtitle: 'Formacja salwatoriańska',
        image: "assets/images/Jordan_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Różaniec', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa o powołania',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Spotkania formacyjne',
              link: 'raz w tygodniu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Salwatoriański dzień skupienia',
              link: '4x w roku'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Rekolekcje', link: 'raz w roku'),
        ]),
    SelectWayItem(
        title: 'Tak na Serio',
        subtitle: 'Formacja małżeństw i rodzin',
        image: "assets/images/TakNaSerio_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Różaniec rodzinny', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Modlitwa TnS', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Spotkania małżeńskie',
              link: 'raz w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Spotkania TnS', link: '2x w roku'),
        ]),
    SelectWayItem(
        title: 'Klerycy SDS',
        subtitle: 'Formacja podstawowa',
        image: "assets/images/WSDSDS_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Msza święta', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Rozmyślanie', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Czytanie duchowne', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Różaniec', link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater', name: 'Spowiedź święta', link: '2x w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Kierownictwo duchowe',
              link: 'raz w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Dzień formacyjny',
              link: 'raz w miesiącu'),
        ]),
    SelectWayItem(
        title: 'Zakonnicy SDS',
        subtitle: 'Formacja ciągła',
        image: "assets/images/Jordan_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Uczestnictwo w Ofierze Eucharystycznej',
              link: 'codziennie'),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Rozmyślanie',
            link: 'codziennie',
          ),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Czytanie duchowne',
            link: 'codziennie',
          ),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Liturgia Godzin',
            link: 'codziennie',
          ),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Modlitwa "Anioł Pański"',
            link: '3x dziennie',
          ),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa o powołania',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Różaniec',
            link: 'codziennie',
          ),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Sakrament pokuty',
              link: '2x w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Dzień skupienia',
              link: 'raz w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: '5-dniowe rekolekcje',
              link: 'raz w roku'),
        ]),
    SelectWayItem(
        title: 'Księża SDS',
        subtitle: 'Formacja ciągła',
        image: "assets/images/Jordan_100px.jpg",
        listProfileTasks: [
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Celebracja Ofiary Eucharystycznej',
              link: 'codziennie'),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Rozmyślanie',
            link: 'codziennie',
          ),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Czytanie duchowne',
            link: 'codziennie',
          ),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Liturgia Godzin',
            link: 'codziennie',
          ),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Modlitwa "Anioł Pański"',
            link: '3x dziennie',
          ),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa o powołania',
              link: 'codziennie'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Modlitwa za wstawiennictwem bł. Franciszka Jordana',
              link: 'codziennie'),
          ViaProfileTask(
            uid: 'ToDoLater',
            name: 'Różaniec',
            link: 'codziennie',
          ),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Sakrament pokuty',
              link: '2x w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: 'Dzień skupienia',
              link: 'raz w miesiącu'),
          ViaProfileTask(
              uid: 'ToDoLater',
              name: '5-dniowe rekolekcje',
              link: 'raz w roku'),
        ]),
  ];
}
