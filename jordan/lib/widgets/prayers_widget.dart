import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class PrayersWidget extends StatelessWidget {
  const PrayersWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          //width: 220,
          height: 200,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(24, 33, 54, 1.0),
          ),
          child: ListView(
            children: <Widget>[
              Text(
                'Życie duchowe',
                textAlign: TextAlign.start,
                style: TextStyle(color: AppColors.highlightText),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                title: Text('Rozmyślanie'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.check,
                  color: Colors.greenAccent,
                ),
              ),
              ListTile(
                title: Text('Różaniec'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text('Brewiarz'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text('Anioł Pański'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.close,
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                title: Text('Rachunek Sumienia'),
                visualDensity:
                    VisualDensity(vertical: VisualDensity.minimumDensity),
                dense: true,
                horizontalTitleGap: 0,
                leading: Icon(
                  Icons.close,
                  color: Colors.redAccent,
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
