import 'package:flutter/material.dart';

class Containner extends StatelessWidget {
  const Containner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container Widget"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: 10,),

            // Container Widget
            Container(
              height: 150,
              width: 150,

              // 1. decoration: decoration is used to decorate the container widget
              decoration: BoxDecoration( // BoxDecoration is used to decorate the container widget
               // color: Colors.green,

                // 2. gradient: gradient is used to add gradient color to the container widget
                gradient: LinearGradient( // LinearGradient is used to add linear gradient color to the container widget
                    colors: [Colors.green, Colors.yellow],
                    begin: Alignment.topLeft, // gradient start from top left
                    end: Alignment.bottomRight // gradient end at bottom right
                ),

                borderRadius: BorderRadius.circular(10),

                boxShadow: [
                  // Multiple BoxShadow can be added
                  BoxShadow( // BoxShadow is used to add shadow to the container widget
                    color: Colors.red,
                    blurRadius: 10, // shadow blur radius
                    spreadRadius: 1, // shadow spread radius
                    offset: Offset(5, 5), // shadow offset x and y axis
                  ),
                  BoxShadow( // BoxShadow is used to add shadow to the container widget
                    color: Colors.yellow,
                    blurRadius: 10, // shadow blur radius
                    spreadRadius: 1, // shadow spread radius
                    offset: Offset(5, 5), // shadow offset x and y axis
                  ),
                ],

              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(Icons.phone, color: Colors.white, size: 25,),
                  Text("Phone Container",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  )
                ],
              ),

            ),

          ],

        ),
      ),

    );
  }
}
