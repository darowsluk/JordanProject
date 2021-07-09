extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}

class ViaTime {
  static DateTime getCurrentDay() {
    return DateTime
        .now(); // TODO: make adjustable end of day and prepare for testing
  }
}
