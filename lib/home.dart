import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
      title: Text("Home Page"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ), // AppBar


      body: SingleChildScrollView(

        /**
         * Column হচ্ছে একটা Children layout widget যেটা একাধিক child widget কে উপর-নিচে (vertical) সাজায়।
            মানে — প্রথম Text উপরে, দ্বিতীয় Text নিচে দেখাবে।
         */
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // পুরো column কে vertically center এ রাখবে
          crossAxisAlignment: CrossAxisAlignment.center, // horizontally center এ রাখবে

          /**
           * 1. In one Children layout widget, we can add multiple child widgets.
           */
          children: [

            // First child Text widget
            Text("Home page body",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  backgroundColor: Colors.yellow
              ),
            ),

            // Second child Text widget
            Text("Home page body",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  backgroundColor: Colors.yellow
              ),
            ),

            // 3rd child Text widget
            Text("Home page body",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  backgroundColor: Colors.yellow
              ),
            ),

            // 4th child Text widget
            Text("Home page body",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                  backgroundColor: Colors.yellow
              ),
            ),


            SingleChildScrollView(

                scrollDirection: Axis.horizontal,

                /**
                 * Now we can do row wise design in one column.
                 */
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    ),
                    Text("Row",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          backgroundColor: Colors.yellow
                      ),
                    )


                  ],

                )
            )


          ],
        ),

      ),

    ); // Scaffold
  }
}
