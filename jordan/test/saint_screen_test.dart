// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:jordan/screens/saint_screen.dart';
// Extras
import 'package:jordan/extras/statics.dart';

void main() {
  group('ScreenCard widget testing:', () {
    testWidgets('Saint asset image on stack', (WidgetTester tester) async {
      // Define test keys
      const assetKey = Key(AppSaintCard.cardAsset);
      const prayerKey = Key(AppSaintCard.jordanPrayerTitle);

      // Build a MaterialApp
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SaintPage())));

      // Find only the image, but no reserve prayer
      expect(find.byKey(assetKey), findsOneWidget);
      expect(find.byKey(prayerKey), findsNothing);
    });
    testWidgets('Tapping card adds reverse', (WidgetTester tester) async {
      // Define test keys
      const assetKey = Key(AppSaintCard.cardAsset);
      const prayerKey = Key(AppSaintCard.jordanPrayerTitle);

      // Build a MaterialApp
      await tester.pumpWidget(MaterialApp(home: Scaffold(body: SaintPage())));

      // tap the card and wait for animation
      await tester.tap(find.byType(InkWell));
      await tester.pump(Duration(seconds: 2));

      // Front and back are on the stack
      expect(find.byKey(assetKey), findsOneWidget);
      expect(find.byKey(prayerKey), findsOneWidget);
    });
  });
}
