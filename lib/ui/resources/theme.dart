import 'package:flutter/material.dart';

class AppTheme {
  final Color swatchColor  = Colors.black;
  ThemeData theme() {
    return ThemeData(
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0.0
      ),
      scaffoldBackgroundColor: Colors.black
    );
  }
}
