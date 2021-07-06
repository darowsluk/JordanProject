import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          //width: 220,
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
          child: ListView(
            children: <Widget>[
              Text(
                'Progress',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.highlightText),
              ),
              SizedBox(
                height: AppMargins.separation,
              ),
            ],
          ),
        ),
        onTap: null,
      ),
    );
  }
}
