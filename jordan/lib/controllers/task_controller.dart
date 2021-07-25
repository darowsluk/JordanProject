import 'package:get/get.dart';
import 'package:jordan/models/storage.dart';
import 'package:jordan/models/via_task.dart';

class TasksController extends GetxController {
  final _viaDay = ViaStorage.readViaDay().obs;

  void toggleTask({required int taskIndex}) {
    _viaDay.update((val) {
      _viaDay.value.viaDay[taskIndex].done =
          !_viaDay.value.viaDay[taskIndex].done;
    });
    // update HIVE
    ViaStorage.saveCurrentDay();
  }

  bool getToggleTask({required int taskIndex}) {
    return _viaDay.value.viaDay[taskIndex].done;
  }

  List<ViaTask> getTaskList() {
    return _viaDay.value.viaDay;
  }
}
