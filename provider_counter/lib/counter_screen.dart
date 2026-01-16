import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/counter_provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final counter = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Provider Counter App'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.count.toString(),
            style: TextStyle(
              fontSize: 50
            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white
                      ),
                      onPressed: (){
                        counter.incremant();
                      }, child: Text('+')),
                ),
                SizedBox(width: 20,),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white
                      ),
                      onPressed: (){
                        counter.decrement();
                      }, child: Text('-')),
                ),
              ],
            ),
            
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            counter.decrement();
          }, child: Icon(Icons.remove),),
          SizedBox(width: 10,),
          FloatingActionButton(onPressed: (){
            counter.incremant();
          }, child: Icon(Icons.add),),
        ],
      ),

    );
  }
}
