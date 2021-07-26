import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jordan/controllers/task_controller.dart';
// Extras
import 'package:jordan/extras/statics.dart';
import 'package:jordan/models/via_task.dart';

class ProgressWidget extends StatelessWidget {
  ProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.all(AppMargins.edgeInsets),
      margin: EdgeInsets.fromLTRB(
          0,
          AppMargins.edgeInsets,
          AppMargins.edgeInsets,
          AppMargins
              .edgeInsets), // make space even between saint card and progress
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
        color: AppColors.foreground,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // create custom circle buttons
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(30, 30)),
                // Prayer texts
                onPressed: () {
                  Get.toNamed(AppRoutes.pluginContainer, arguments: "");
                },
                fillColor: AppColors.icon1,
                child: Icon(
                  Icons.playlist_play_outlined,
                  color: AppColors.darkText,
                  size: 20,
                ),
                //padding: EdgeInsets.all(AppMargins.edgeInsets),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(30, 30)),
                onPressed: () {},
                fillColor: AppColors.icon2,
                child: Icon(
                  Icons.audiotrack_outlined,
                  color: AppColors.darkText,
                  size: 20,
                ),
                //padding: EdgeInsets.all(AppMargins.edgeInsets),
                shape: CircleBorder(),
              ),
              RawMaterialButton(
                constraints: BoxConstraints.tight(Size(30, 30)),
                onPressed: () {},
                fillColor: AppColors.icon3,
                child: Icon(
                  Icons.video_library_outlined,
                  color: AppColors.darkText,
                  size: 20,
                ),
                //padding: EdgeInsets.all(AppMargins.edgeInsets),
                shape: CircleBorder(),
              ),
            ],
          ),
          Center(
            child: Obx(
              () => CustomPaint(
                size:
                    Size(3000, 50), // overkill just to be safe: TODO: fix later
                painter: LinePainter().obs.value,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  final TasksController _painterTasksController = Get.put(TasksController());
  @override
  void paint(Canvas canvas, Size size) {
    Offset start, end;
    var paint = Paint()
      ..color = AppColors.graphPrimary
      ..strokeWidth = 4;

    // 1. Get all current tasks
    List<ViaTask> _tasks = _painterTasksController.getTaskList();
    // 2. For each task draw a line
    final double widthOffset = size.width / _tasks.length;
    double xOffset = 0;

    for (ViaTask task in _tasks) {
      start = Offset(xOffset, size.height);

      if (task.done) {
        end = Offset(xOffset, 0);
      } else {
        end = Offset(xOffset, size.height - 10);
      }
      canvas.drawLine(start, end, paint);
      xOffset += widthOffset; // move to the next line
      if (xOffset >= size.width) {
        // end of viewing area
        break;
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
