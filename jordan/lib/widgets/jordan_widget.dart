import 'package:flutter/material.dart';
import 'package:jordan/screens/saint_screen.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class JordanWidget extends StatelessWidget {
  const JordanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppMargins.edgeInsets),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JordanPage(),
            ),
          );
        },
        child: //Hero(
            //tag: 'jordan',
            //child:
            ClipRRect(
          borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
          child: Image.asset(
            "assets/images/Jordan_150px.jpg",
          ),
        ),
      ),
      //),
    );
  }
}
