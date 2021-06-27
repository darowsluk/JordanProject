import 'dart:math';

import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

//////////////////////////////////////////////////////////////////////////
/// Displays prayer through the intercession of Blessed Francis Jordan ///
//////////////////////////////////////////////////////////////////////////
class JordanPage extends StatefulWidget {
  const JordanPage({Key key}) : super(key: key);

  @override
  _JordanPageState createState() => _JordanPageState();
}

class _JordanPageState extends State<JordanPage> {
  bool _displayFront;

  @override
  void initState() {
    super.initState();
    _displayFront = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.foreground,
      ),
      body: Center(
        child: Container(
          //constraints: BoxConstraints.tight(Size.square(200.0)),
          alignment: Alignment.topCenter,
          //padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(32),
          child: _buildFlipAnimation(),
        ),
      ),
    );
  }

  /// Helper Functions
  Widget __buildLayout({
    Key key,
    Color backgroundColor,
    Widget displayCard,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
        color: backgroundColor,
      ),
      child: displayCard,
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      backgroundColor: AppColors.textBackground,
      displayCard: ClipRRect(
        borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
        child: Image.asset(
          "assets/images/Jordan_414px.jpg",
        ),
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: ValueKey(false),
      backgroundColor: AppColors.textBackground,
      displayCard:
          //ClipRRect(
          //  borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
          SizedBox(
        width: 414,
        height: 460,
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.all(AppMargins.edgeInsets * 2),
          child: Column(
            children: [
              Text(
                AppPrayers.jordanPrayerTitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(AppMargins.edgeInsets / 2),
              ),
              Text(AppPrayers.jordanPrayer,
                  style: TextStyle(
                    color: AppColors.darkText,
                    fontSize: 16,
                  )),
              // Padding(
              //   padding: EdgeInsets.all(AppMargins.edgeInsets),
              // ),
              // Text(AppPrayers.jordanPrayerEndnote,
              //     style: TextStyle(
              //       color: AppColors.darkText,
              //       fontSize: 12,
              //     )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFlipAnimation() {
    return GestureDetector(
      onTap: () => setState(() => _displayFront = !_displayFront),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget, ...list]),
        child: _displayFront ? _buildFront() : _buildRear(),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
      ),
    );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_displayFront) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }
}
