import 'package:flutter/material.dart';

class CalendariumWidget extends StatelessWidget {
  const CalendariumWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          width: 220,
          height: 220,
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
                'Kalendarium SDS',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.amber),
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
