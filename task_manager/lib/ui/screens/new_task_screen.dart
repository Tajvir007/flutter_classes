import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';

import '../widgets/task_card.dart';
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
          ),

          // ******************* Main Content Body **********************
          Expanded(   // Here expanded is used to take full screen width as they need
            child: ListView.separated(
              itemCount: 10,
                itemBuilder: (context, index){
            
                return  TaskCard(); // It's a custom widget. It is used to show the task card in main body through list view
            
                },
                separatorBuilder: (context, index){
                return SizedBox(height: 4,);
                },
                ),
          ),


        ],
      ),

      // Floating action button for add new task
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewTaskScreen()));
          },
      child: Icon(Icons.add),
      ),

    );
  }
}





