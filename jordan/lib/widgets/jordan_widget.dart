import 'package:flutter/material.dart';
import 'package:jordan/screens/prayer.dart';

class JordanWidget extends StatelessWidget {
  const JordanWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      alignment: Alignment.center,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(24, 33, 54, 1.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrayerPage()),
          );
        },
        child: Hero(
          tag: 'jordan',
          child: Image.asset(
            "assets/Jordan_100px.jpg",
          ),
        ),
      ),
    );
  }
}
