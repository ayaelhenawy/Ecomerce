import 'package:flutter/material.dart';

class MyTheme {
  static final MyTheme instance = MyTheme();

  ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(
        255, 255, 255, 255), // Set the scaffold background to black
  );

  ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor:
        Colors.black, // Set the scaffold background to black
  );
}
