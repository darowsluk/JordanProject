import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

Container buildDecoratedBoxWidget(
    {required Widget child,
    double height = 150,
    double width = 150,
    Color color = AppColors.foreground,
    AlignmentGeometry alignment = Alignment.topCenter}) {
  return Container(
    height: height,
    width: width,
    alignment: alignment,
    padding: EdgeInsets.all(15),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    child: child,
  );
}
