import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

class SaintCardWidget extends StatelessWidget {
  const SaintCardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppMargins.edgeInsets),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/saint');
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
