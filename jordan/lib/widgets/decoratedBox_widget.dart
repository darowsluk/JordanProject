import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/colors.dart';

Container buildDecoradedBoxWidget(
    {Widget child,
    double height = 150,
    double width = 150,
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
      color: AppColors.foreground,
    ),
    child: child,
  );
}
