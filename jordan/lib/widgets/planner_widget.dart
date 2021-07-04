import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class PlannerWidget extends StatelessWidget {
  const PlannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: InkWell(
        child: Container(
          constraints: BoxConstraints.expand(),
          // width: 220,
          //height: 150,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(AppMargins.edgeInsets),
          margin: EdgeInsets.fromLTRB(
              AppMargins.edgeInsets,
              0,
              AppMargins.edgeInsets,
              AppMargins
                  .edgeInsets), // make space even between top and bottom row
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
            color: AppColors.foreground,
          ),
          child: ListView(
            children: <Widget>[
              Text(
                'Kalendarium SDS',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.highlightText),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Imieniny ks. Roman Słupek SDS'),
                trailing: Text('3 III'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.cake,
                  color: Colors.yellow,
                ),
              ),
              ListTile(
                title: Text('Zm. ks. Tadeusz Styczeń SDS'),
                trailing: Text('13 III'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.hourglass_empty,
                  color: Colors.red,
                ),
              ),
              ListTile(
                title: Text('10 rocz. św. ks. Łukasz Darowski SDS'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.timer,
                  color: Colors.greenAccent,
                ),
              ),
              ListTile(
                title: Text('8 rocz. św. ks. Paweł Radziejewski SDS'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.timer,
                  color: Colors.greenAccent,
                ),
              ),
              ListTile(
                title: Text('12 rocz. św. ks. Maciej Dalibor SDS'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.timer,
                  color: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
        onTap: null,
      ),
    );
  }
}
