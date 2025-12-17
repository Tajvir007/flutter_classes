import 'package:flutter/material.dart' hide GridView;
import 'package:flutter_classes/home.dart';
import 'package:flutter_classes/module%2012/state_concept.dart';
import 'package:flutter_classes/module%2012/stateful_lifecycle.dart';
import 'package:flutter_classes/module%2013/CRUD/crud.dart';
import 'package:flutter_classes/module%208/dashboard.dart';
import 'package:flutter_classes/module%209/app_theme.dart';
import 'package:flutter_classes/module%209/list.dart';
import 'package:flutter_classes/module%209/ownWidget.dart';
import 'package:flutter_classes/module%209/stack_flutter.dart';
import 'package:flutter_classes/module%209/theme.dart';
import 'package:flutter_classes/module11/expanded_todo.dart';
import 'package:flutter_classes/module11/responsive_design.dart';
import 'package:flutter_classes/module11/responsive_package.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button.dart';
import 'input.dart';
import 'live_test/module_14/recipe_list.dart';
import 'module 12/calculator/calculator.dart';
import 'module 13/BMI Calculator/bmi_calculator.dart';
import 'module 13/api_call.dart';
import 'module 8/contai_ner.dart';
import 'module 8/text_form.dart';
import 'module 8/grid_view.dart';
import 'package:flutter_classes/module 9/theme.dart';

import 'module11/extanded.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child) {


          return MaterialApp(
            title: '1st flutter app',

            debugShowCheckedModeBanner: false,

            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,

            themeMode: ThemeMode.light, // ThemeMode.system, ThemeMode.light, ThemeMode.dark

            /**
             * ThemeData is used to define the theme of the app
                theme: ThemeData(

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


                ),
             */

            // home: Home(),
            // home: Button(),
            // home: Input(),
            // home: TextForm(),
            // home: Containner(),
            // home: GridV(),
            home: ThemeTest(),

            // 1. Name routes. Navigate using named routes
            initialRoute: 'crud',
            routes: {
              'home': (context) => Home(),
              'button' : (context) => Button(),
              'input' : (context) => Input(),
              'gridView': (context) => GridV(),
              'textForm': (context) => TextForm(),
              // named route to Dashboard page with parameter
              'dashboard': (context) => Dashboard(),
              'listView': (context) => ListV(),
              'stack': (context) => StackFlutter(),
              'ownWidget': (context) => Ownwidget(),
              'responsiveDesign': (context) => ResponsiveDesign(),
              'responsivePackage': (context) => ResponsivePackage(),
              'recipe': (context) => RecipeListPage(jsonString: 'asset/recipes.json',),
              'expanded': (context) => ExpandedK(),
              'todoexpand': (context) => ToDoExpanded(),
              'stateConcept': (context) => StateConcept(),
              'statefulLifecycle': (context) => StatefulLifecycle(),
              'calculator': (context) => Calculator(),
              'apiCall': (context) => ApiCall(),
              'bmiCalculator': (context) => BmiCalculator(),
              'crud': (context) => Crud(),
            },

          );


        });


  }
}


