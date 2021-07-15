class SelectWayItem {
  SelectWayItem({
    this.title = "",
    this.subtitle = "",
    this.image = "",
  });

  String title;
  String subtitle;
  String image;
}

/// Generates static list of items in the prayer list
List<SelectWayItem> generateSelectWayItems() {
  return [
    SelectWayItem(
      title: 'Sympatycy SDS',
      subtitle: 'rodzina i przyjaciele',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'Ministranci',
      subtitle: 'Służba Ołtarza',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'RMS',
      subtitle: 'Ruch Młodzieży Salwatoriańskiej',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'SOP',
      subtitle: 'Salwatoriański Ośrodek Powołań',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'Świeccy SDS',
      subtitle: 'Formacja salwatoriańska',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'Tak na Serio',
      subtitle: 'Małżeństwa i Rodziny',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'Klerycy SDS',
      subtitle: 'Formacja podstawowa',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'Zakonnicy SDS',
      subtitle: 'Formacja ciągła',
      image: "assets/images/Jordan_100px.jpg",
    ),
    SelectWayItem(
      title: 'Księża SDS',
      subtitle: 'Formacja ciągła',
      image: "assets/images/Jordan_100px.jpg",
    ),
  ];
}
