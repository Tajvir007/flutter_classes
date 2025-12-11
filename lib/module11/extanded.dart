import 'package:flutter/material.dart';

class ExpandedK extends StatelessWidget {
  const ExpandedK({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expanded Keyword"),
      ),

      body: Column(
        children: [
          Text('To Do List'),
          Text('To Do List'),
          Text('To Do List'),
          Text('To Do List'),

          // Expanded Widget to make ListView take remaining space in Column
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text('Task ${index + 1}'),
                  );
                }
            ),
          ),

          Container(
            width: 200,
            height: 200,
            color: Colors.red,
          ),

          /**
           * 1. Flaxible: It is used to make a child of a Row, Column, or Flex expand to fill the available space along the main axis.
           * 2. It takes a flex property which determines how much space the child should take relative to other Flexible widgets.
           * 3. Unlike Expanded, Flexible allows its child to be smaller than the available space if it wants to.
           4. It is useful when you want a widget to take up space but still allow it to be smaller if needed.
           5. In the example below, the first Container will take 1/4th of the available space, and the second Container will take 3/4th of the available space.
           6. If the Containers have a size smaller than the allocated space, they will only take up as much space as they need.
           * 7. Flex: It is an integer value that determines the proportion of space that a Flexible widget should take relative to other Flexible widgets in the same Row, Column, or Flex.
           */
          Flexible(
            flex: 3,
            child: Container(

              color: Colors.green,
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(

              color: Colors.orange,
            ),
          ),


        ],
      ),

    );
  }
}
