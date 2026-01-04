import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });


  final TaskModel taskModel;
  final Color cardColor;

  final VoidCallback refreshParent;

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

          title: Text(taskModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20
          ),
          ),
          subtitle: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(taskModel.description),
              Text('Date: ${taskModel.createdDate}'),
              // Chip is a button
              Row(

                children: [
                  Chip(label: Text(taskModel.status), // Customize status by variable
                    backgroundColor: cardColor, // Customize status by variable
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
