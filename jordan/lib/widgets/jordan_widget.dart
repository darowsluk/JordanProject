import 'package:flutter/material.dart';
import 'package:jordan/screens/jordan_screen.dart';
// Custom widgets
import 'package:jordan/widgets/decoratedBox_widget.dart';

class JordanWidget extends StatelessWidget {
  const JordanWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildDecoratedBoxWidget(
      alignment: Alignment.center,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => JordanPage()),
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
