import 'package:get/get.dart';

class ProfileController extends GetxController {
  var _toggleTask = false.obs;

  void toggleTask() {
    _toggleTask.value = !_toggleTask.value;
  }

  bool getToggleTask() {
    return _toggleTask.value;
  }

  void addTask({required String name}) {}

  void delTask({required String uid}) {}

  void editTask({required String uid}) {}

  List<String> getTaskList() {
    return [];
  }
}
