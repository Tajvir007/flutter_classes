import 'package:flutter/material.dart';

class ResponsiveDesign extends StatelessWidget {
  const ResponsiveDesign({super.key});

  @override
  Widget build(BuildContext context) {

    // Get Screen Size using MediaQuery class
    Size screenSize = MediaQuery.of(context).size;

    // Determine if the device is a tablet based on width
    bool isTablet = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Design"),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [

              /**
               * 1. Responsive layout using isTablet boolean variable
               * 2. If the device is a tablet, display icons in a row
               * 3. If the device is not a tablet, display icons in a column
               */
              
              Text('Im ${isTablet ? 'Tablet' : 'Phone'}'),
              SizedBox(height: 10,),
              
              isTablet ? Row(
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10,),
                  Icon(Icons.man),
                  SizedBox(width: 10,),
                  Icon(Icons.home),
                  SizedBox(width: 10,),
                  Icon(Icons.money),
                  SizedBox(width: 10,),
                  Icon(Icons.key),
                  SizedBox(width: 10,),
                ],
              ) : Column(
                children: [
                  Icon(Icons.phone),
                  SizedBox(height: 10,),
                  Icon(Icons.man),
                  SizedBox(height: 10,),
                  Icon(Icons.home),
                  SizedBox(height: 10,),
                  Icon(Icons.money),
                  SizedBox(height: 10,),
                  Icon(Icons.key),
                  SizedBox(height: 10,),
                ],
              ),
          
              Container(
                height: 100,
                width: 100,
                color: Colors.red,
              ),
          
              SizedBox(height: 10,),

              // Responsive Container using screen size
              Container(
                height: screenSize.height*.2,
                width: screenSize.width*.5,
                color: Colors.green,
              ),

              SizedBox(height: 10,),

              Text('Hello world',
              style: TextStyle(
                fontSize: 10,
                color: Colors.red
              ),),

              SizedBox(height: 10,),

              Text('Hello world',
                style: TextStyle(
                    fontSize: screenSize.width*.023,
                    color: Colors.green
                ),),
          
            ],
          ),
        ),
      ),

    );
  }
}
