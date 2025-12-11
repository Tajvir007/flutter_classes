import 'package:flutter/material.dart';

class Home2 extends StatelessWidget {
  const Home2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page 2"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Text("This is Home Page 2",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                backgroundColor: Colors.purple,
              ),
            ),

            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Back")),

          ],
        ),
      ),

    );
  }
}
