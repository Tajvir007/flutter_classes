import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Button Page"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Center( // Center widget will center the Column in the available space
        child: Column(
          children: [

            // Children 1: Elevated Button
            SizedBox( // SizedBox is used to give fixed height and width to the button
              height: 50,
              width: double.infinity, // full width button
              // width: 200, // fixed width button

              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.black,
                    shadowColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  ),
                  onPressed: (){},
                  child: Text("Submit")),
            ),

            // Children 2
            SizedBox(height: 20,), // Add some space between buttons

            // Children 3
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  shadowColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                ),
                onPressed: (){},
                child: Text("Demo")),


            SizedBox(height: 50,),
            
            // Children 4: Outlined Button
            SizedBox(

              height: 50,
              width: double.infinity,

              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(

                  ),
                  onPressed: (){},
                  child: Text("Outlined Button")),
            ),
            
            SizedBox(height: 20,),

            // Children 5: Text Button
            TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                onPressed: (){
                  print("Read more Clicked");
                }, child: Text("Read More..")),

            // Children 6: Icon
            Icon(Icons.phone_android, size: 50, color: Colors.orange,),

            SizedBox(height: 20,),
            
            // Children 7: Icon Button
            IconButton(onPressed: (){}, icon: Icon(Icons.delete, size: 50, color: Colors.red,)),

            // Children 8: Gesture Detector
            GestureDetector( // Gesture Detector is used to detect gestures like tap, double tap, long press etc.
                onLongPress: (){
                  print("Long Pressed");
                },
                child: Text("Long press"))
            
          ],

        ),

      ),

      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.black,
          onPressed: (){
            print("FAB clicked");
          },
          child: Icon(Icons.add)),

    );
  }
}
