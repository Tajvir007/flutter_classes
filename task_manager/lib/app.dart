import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        colorSchemeSeed: Colors.green,

        // Custom theme for every page title
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),

        // InputDecoration theme is used to style the text field input decoration
        inputDecorationTheme: InputDecorationTheme(

          hintStyle: TextStyle(
              color: Colors.grey
          ),

          labelStyle: TextStyle(
              color: Colors.grey
          ),

          fillColor: Colors.white,
          filled: true,

          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none
          ),

        ),

        // FilledButton theme is used to style the filled button
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
          ),
        ),

      ),

      home: SplashScreen(),

    );
  }
}
