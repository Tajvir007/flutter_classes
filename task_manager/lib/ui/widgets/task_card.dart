import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(

        color: Colors.white70,

        child: ListTile(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),

          title: Text('This is task title'),
          subtitle: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text("Description of task"),
              Text('Date: 22/12/2025'),
              // Chip is a button
              Row(

                children: [
                  Chip(label: Text('New'),
                    backgroundColor: Colors.blue,
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Spacer(),

                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_note, color: Colors.green,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete, color: Colors.red,)),

                ],
              ),
            ],
          ),

        ),
      ),
    );
  }
}
