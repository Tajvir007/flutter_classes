import 'package:flutter/material.dart';

import 'home_screen.dart';

class GoogleMap extends StatelessWidget {
  const GoogleMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Map',
      home: HomeScreen(),
    );
  }
}
