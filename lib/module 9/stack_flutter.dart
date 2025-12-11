import 'package:flutter/material.dart';

import 'custom_widget/card_widget.dart';

class StackFlutter extends StatelessWidget {
  const StackFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Widget"),
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Stack with Image and Text
            cardWidget(img: '', title: '', rating: '',),

            SizedBox(height: 10,),

            // Stack with Containers
            Stack(
              children: [

                // Stack Container
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                ),

                // Child Container - 1
                Positioned( // Positioned is used to position the child widget within the Stack
                  top: 10,
                  left: 20,
                  bottom: 30,
                  right: 20,

                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.red,
                  ),
                ),

                // Child Container - 2
                Positioned(
                  left: 30,
                  right: 20,
                  top: 30,
                  bottom: 20,

                  child: Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                ),

              ],
            ),

            SizedBox(height: 10,),

            // Stack with CircleAvatar and online status indicator
            Stack(
              children: [

                CircleAvatar( // CircleAvatar is used to create a circular avatar
                  radius: 70,
                  backgroundImage: NetworkImage('https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg'),
                ),

                Positioned(

                  bottom: 15,
                  right: 5,

                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2
                        )
                    ),
                  ),
                )

              ],
            )

          ],
        ),
      ),

    );
  }
}


