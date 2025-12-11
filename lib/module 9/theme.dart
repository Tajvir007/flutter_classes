import 'package:flutter/material.dart';

class ThemeTest extends StatelessWidget {
  const ThemeTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme Example"),
        centerTitle: true,
     //   backgroundColor: Colors.green,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text("Theme",
            style: Theme.of(context).textTheme.headlineLarge, // headlineLarge is predefined in Material Design
            ),

            SizedBox(),
            TextField(),
            SizedBox(height: 10, ),
            TextField(),
            ElevatedButton(onPressed: (){}, child: Text("Button"))
          ],
        ),
      ),
      
    );
  }
}
