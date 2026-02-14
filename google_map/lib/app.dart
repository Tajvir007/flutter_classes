import 'package:flutter/material.dart';

import 'assignment/map_screen.dart';
import 'home_screen.dart';
import 'my_location_screen.dart';

class GoogleMap extends StatelessWidget {
  const GoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
     // home: HomeScreen(),
     // home: MyLocationScreen(),
      home: MapScreen(),
    );
  }
}
