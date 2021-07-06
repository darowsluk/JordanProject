import 'package:flutter/cupertino.dart';

/// SINGLETON pattern for storage management

class StorageManager {
  static final StorageManager _instance = StorageManager._internal();

  // using a factory is important
  // because it promises to return _an_ object of this type
  // but it doesn't promise to make a new one.
  factory StorageManager() {
    return _instance;
  }

  // This named constructor is the "real" constructor
  // It'll be called exactly once, by the static property assignment above
  // it's also private, so it can only be called in this class
  StorageManager._internal() {
    // initialization logic
    // load data from internal storage
    _list = [];
  }

  // members
  // list of todo items (no duplicates)
  @protected
  late List<ViaData> _list;

  // methods
  void addItem(String item) {
    _list.add(ViaData(item, false));
  }

  void removeItem(String item) {
    _list.removeWhere((element) => element.getName().compareTo(item) == 0);
  }

  List<ViaData> getList() {
    return _list;
  }

  ViaData getItem(String item) {
    var index =
        _list.indexWhere((element) => element.getName().compareTo(item) == 0);
    return _list.elementAt(index);
  }

  editItem(String item) {}

  void editToggleDone(String item) {
    var index =
        _list.indexWhere((element) => element.getName().compareTo(item) == 0);
    // create a new instance with toggled data
    ViaData newItem = ViaData(item, !_list.elementAt(index)._done);
    // remove old instance
    _list.removeAt(index);
    // add new instance
    _list.insert(index, newItem);
  }
}

class ViaData {
  @protected
  String _name = "";
  bool _done = false;

  ViaData(String item, bool done) {
    _name = item;
    _done = done;
  }
  String getName() {
    return _name;
  }

  bool getDone() {
    return _done;
  }

  void toggleDone() {
    _done = !_done;
  }
}
