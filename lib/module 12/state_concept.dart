import 'package:flutter/material.dart';

class StateConcept extends StatefulWidget {
   StateConcept({super.key});

  @override
  State<StateConcept> createState() => _StateConceptState();
}

class _StateConceptState extends State<StateConcept> {
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(num.toString(), style: TextStyle(color: Colors.red, fontSize: 50),),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  IconButton(onPressed: (){
                    setState(() {
                      num--;
                      print(num);
                    });
                  }, icon: Icon(Icons.minimize_rounded)),
                  
                  IconButton(onPressed: (){
                    num++;
                    print(num);

                    setState(() {

                    });
                  }, icon: Icon(Icons.add)),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
