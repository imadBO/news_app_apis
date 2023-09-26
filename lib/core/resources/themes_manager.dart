import 'package:flutter/material.dart';

class ThemesManager {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.deepOrange,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.deepOrange,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black12,
    primarySwatch: Colors.deepOrange,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black12,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.deepOrange,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        backgroundColor: Colors.black12,
        unselectedItemColor: Colors.grey),
  );
}
