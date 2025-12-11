import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {

  /**
      // Receiving data from previous screen using constructor
      final String phone;
      final String ? password;

      Dashboard({super.key, required this.phone, this.password});
   */

  // Receiving data from previous screen using navigation arguments
  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {

    // Retrieving the arguments passed from the previous screen
    final args = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard Page"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      
      body: Column(

        /**
         *  data received using navigator
         *   children: [
            Text(phone, style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.teal
            ),)
            ],
         */

        children: [
          Text(args.toString(), style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.teal
          ),)
        ],

      ),
      
    );
  }
}
