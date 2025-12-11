import 'package:flutter/material.dart';

class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grid View Example"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body:
      // GridView.count is used to create a grid view with fixed number of columns.
      /** 
       * GridView.count(
          crossAxisCount: 2, // number of columns in the grid
          padding: EdgeInsets.all(10), // padding around the grid
          crossAxisSpacing: 10, // spacing between columns
          mainAxisSpacing: 10, // spacing between rows
          // 1. children: children is used to add child widgets to the grid
          children: List.generate(10, (index) =>
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
          ),
          ),
          )
       */
      
      // GridView.builder is used to create a grid view with dynamic number of columns.
      GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
          ),
          itemCount: 30,
          itemBuilder: (context,  index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
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
                    Text("Phone Container - ${index}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )
                  ],
                ),

              ),
            );
          }
      )
      ,

    );
  }
}
