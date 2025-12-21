import 'package:flutter/material.dart';

import '../widgets/task_count_by_status.dart';
import '../widgets/task_manager_app_bar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: TaskManagerAppBar(),

      body: Column(
        children: [
          SizedBox(height: 15,),

          // ******************* Task count status ************************
          SizedBox( // In list view size is mandatory. Otherwise it will show error
            height: 90,
            child: ListView.separated( // separator will show between each item. It hols Sizebox. It'll separate every item in list view in same distance

              scrollDirection: Axis.horizontal, // scroll direction is use to define the scroll direction

                itemCount: 4,
                itemBuilder: (context, index){
                  return TaskCountByStatus(title: 'new task', count: index+5,);
                },
            separatorBuilder: (context, index){
                return SizedBox(width: 4,);
            },
            ),
          )

        ],
      ),
    );
  }
}



