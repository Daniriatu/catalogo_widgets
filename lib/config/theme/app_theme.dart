import 'package:flutter/material.dart';

const List<Color> colorum = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int electusColor;

  final bool tenebrisModusEst;

  AppTheme({this.tenebrisModusEst = false, this.electusColor = 0});

  ThemeData getTheme() => ThemeData(
      useMaterial3: true,
      brightness: tenebrisModusEst ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorum[electusColor],
      appBarTheme: const AppBarTheme(centerTitle: false));

  AppTheme copyWith({int? electusColor, bool? tenebrisModusEst}) => AppTheme(
      electusColor: electusColor ?? this.electusColor,
      tenebrisModusEst: tenebrisModusEst ?? this.tenebrisModusEst);
}
