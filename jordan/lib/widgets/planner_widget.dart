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
                'Planner',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.highlightText),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Rosary'),
                trailing:
                    Icon(Icons.circle_outlined, color: Colors.greenAccent),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                //dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.add_location_rounded,
                  color: Colors.yellow,
                ),
              ),
              ListTile(
                title: Text('Read Holy Scripture'),
                trailing:
                    Icon(Icons.circle_outlined, color: Colors.greenAccent),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                //dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.add_location_rounded,
                  color: Colors.red,
                ),
              ),
              ListTile(
                title: Text('Morning and Evening Prayers'),
                trailing:
                    Icon(Icons.circle_outlined, color: Colors.greenAccent),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                //dense: true,
                horizontalTitleGap: 0,
                leading: Icon(Icons.ac_unit, color: Colors.transparent),
              ),
            ],
          ),
        ),
        onTap: null,
      ),
    );
  }
}
