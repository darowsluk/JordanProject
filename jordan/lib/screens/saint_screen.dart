import 'dart:math';

import 'package:flutter/material.dart';
// Extras
import 'package:jordan/extras/statics.dart';

///////////////////////////
/// Displays Saint Card ///
///////////////////////////
class SaintPage extends StatefulWidget {
  const SaintPage({Key? key}) : super(key: key);

  @override
  _SaintPageState createState() => _SaintPageState();
}

class _SaintPageState extends State<SaintPage> {
  late bool _displayFront;

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
        title: Text(AppSaintCard.saintCardTitle),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: _buildCardConstraints(context),
            alignment: Alignment.topCenter,
            margin: EdgeInsets.all(AppSaintCard.cardMargins),
            child: _buildFlipAnimation(),
          ),
        ),
      ),
    );
  }

  // Helper Functions
  BoxConstraints _buildCardConstraints(BuildContext context) {
    if (MediaQuery.maybeOf(context) == null) {
      return BoxConstraints.tightFor(
        // default saint card size (1/2 size of max)
        width: (AppSaintCard.maxWidth / 2),
        height: (AppSaintCard.maxWidth / 2) / AppSaintCard.cardProportions,
      );
    }
    double w =
        (MediaQuery.of(context).size.width - (AppSaintCard.cardMargins * 2)) *
            AppSaintCard.cardScale;
    double h =
        (MediaQuery.of(context).size.height - (AppSaintCard.cardMargins * 2)) *
            AppSaintCard.cardScale;
    // Check for max picture size
    if (w > AppSaintCard.maxWidth && h < AppSaintCard.maxHeight) {
      // too wide, but height ok
      return BoxConstraints.tightFor(
        width: h * AppSaintCard.cardProportions,
        height: h,
      );
    } else if (w < AppSaintCard.maxWidth && h > AppSaintCard.maxHeight) {
      // too high, but width ok
      return BoxConstraints.tightFor(
        width: w,
        height: w / AppSaintCard.cardProportions,
      );
    } else if ((w / h) > AppSaintCard.cardProportions) {
      // proportions: larger width
      return BoxConstraints.tightFor(
        width: h * AppSaintCard.cardProportions,
        height: h,
      );
    } else {
      // proportions: larger height
      return BoxConstraints.tightFor(
        width: w,
        height: w / AppSaintCard.cardProportions,
      );
    }
  }

  Widget __buildLayout({
    required Key key,
    required Widget displayCard,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
        color: AppColors.textBackground,
      ),
      child: displayCard,
    );
  }

  Widget _buildFront() {
    return __buildLayout(
      key: ValueKey(true),
      displayCard: ClipRRect(
        borderRadius: BorderRadius.circular(AppMargins.cornerRadius),
        child: Image.asset(
          AppSaintCard.cardAsset,
          key: Key(AppSaintCard.cardAsset),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildRear() {
    return __buildLayout(
      key: ValueKey(false),
      displayCard: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(AppMargins.edgeInsets * 2),
        child: ListView(
          shrinkWrap:
              true, // necessary to size the height of the viewport to the sum of the heights of its children
          children: [
            Text(
              AppSaintCard.jordanPrayerTitle,
              key: Key(AppSaintCard.jordanPrayerTitle),
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
            Text(AppSaintCard.jordanPrayer,
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 16,
                )),
            Padding(
              padding: EdgeInsets.all(AppMargins.edgeInsets),
            ),
            Text(AppSaintCard.jordanPrayerEndnote,
                style: TextStyle(
                  color: AppColors.darkText,
                  fontSize: 12,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildFlipAnimation() {
    return InkWell(
      onTap: () => setState(() => _displayFront = !_displayFront),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: __transitionBuilder,
        layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
          return Stack(
            children: <Widget>[
              if (currentChild != null) currentChild,
              ...previousChildren,
            ],
          );
        },
        //layoutBuilder: (currentChild, previousChildren) => Stack(children: [currentChild!, ...previousChildren]),
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
        final isUnder = (ValueKey(_displayFront) != widget?.key);
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
