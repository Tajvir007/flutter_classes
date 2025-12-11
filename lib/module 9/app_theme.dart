import 'package:flutter/material.dart';

class AppTheme{

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.deepOrange, // Primary Color applied to all widgets (like AppBar)
    primarySwatch: Colors.blue, // Primary Swatch applied to all widgets (like AppBar)
    scaffoldBackgroundColor: Colors.grey.shade300, // Scaffold Background Color automatically applied to all screens
    brightness: Brightness.light, // Dark Theme for entire app

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Colors.purple,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        ),
      ),

      hintStyle: TextStyle(
          color: Colors.red,
          fontSize: 14
      ),


      labelStyle: TextStyle(
          color: Colors.purple,
          fontSize: 16,
          fontWeight: FontWeight.bold

      ),



    ),

    // Text Theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.lightGreenAccent, // Primary Color applied to all widgets (like AppBar)
    primarySwatch: Colors.blue, // Primary Swatch applied to all widgets (like AppBar)
    scaffoldBackgroundColor: Colors.black87, // Scaffold Background Color automatically applied to all screens
    brightness: Brightness.dark, // Dark Theme for entire app

    // Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          color: Colors.purple,
        ),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Colors.deepPurpleAccent,
          width: 2,
        ),
      ),

      hintStyle: TextStyle(
          color: Colors.red,
          fontSize: 14
      ),


      labelStyle: TextStyle(
          color: Colors.blue,
          fontSize: 16,
          fontWeight: FontWeight.bold

      ),



    ),

    // Text Theme
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    ),
  );

}
