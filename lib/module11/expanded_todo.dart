import 'package:flutter/material.dart';

class ToDoExpanded extends StatefulWidget {
  const ToDoExpanded({super.key});

  @override
  State<ToDoExpanded> createState() => _ToDoExpandedState();
}

class _ToDoExpandedState extends State<ToDoExpanded> {

  // 1. Controller to get text from input field
  TextEditingController taskController = TextEditingController();

  // 2. take list to get input serialwise
  List<String> tasks = [];

  // 4. create method to get task
  addTask(){

    // 4.2 if else condition to check the input field is empty or not
    final task = taskController.text;
    if(task.isNotEmpty){

      // 4.1 setState will auto update the input
      setState(() {
        tasks.add(taskController.text);
        taskController.clear(); // it will auto clear the input field
      });
    }
    else{

    }

  }

  // Update method to update task by index
  updateTask(String value, int index){

    if(value.isNotEmpty){

      setState(() {
        tasks[index] = value;
      });
    }
    else{

    }
  }


  // 1. Delete method will delete task
  deleteTask(int index){

    setState(() {
      tasks.removeAt(index);
    });
  }

  // 2. Edit method will edit task by index and show in input field and save button
  editTask(int index){

    final editTaskController = TextEditingController(text: tasks[index]);

    // ডায়ালগ ওপেন করা হচ্ছে
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Task edit'),
      content: TextField(
        controller: editTaskController,
      ),

      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel')),
        // ✔ Update বাটন – চাপ দিলে updateTask() কল হয়
        TextButton(onPressed: (){
          updateTask(editTaskController.text, index);
          Navigator.pop(context); // // ডায়ালগ বন্ধ করার জন্য
        }, child: Text('Update')),
      ],

    ));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do Extand"),
      ),

      body: Column(
        children: [

          // Input field to enter task
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded( // It will auto space
                  child: TextField(

                    controller: taskController, // 3. assign controller for specific field

                    decoration: InputDecoration(
                      labelText: 'Enter Task',
                    ),
                  ),
                ),

                ElevatedButton(onPressed: addTask, // 5. Call method. when add button is pressed then the method will call
                    child: Text('Add',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                      ),
                    ))

              ],
            ),
          ),

          // List view to show task
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length, // 6. for dynamic value. it will show task index
                itemBuilder: (context, index){
                return Card(
                  child: ListTile(
                    title: Text(tasks[index]), // 7. It'll show task name.
                    trailing: Row( //
                  
                      mainAxisSize: MainAxisSize.min,
                  
                      children: [
                        IconButton(onPressed: (){
                          editTask(index); // call method to edit task by index
                        }, icon: Icon(Icons.edit, color: Colors.green,)),
                        IconButton(onPressed: (){
                          deleteTask(index); // call method to delete task by index
                        }, icon: Icon(Icons.delete, color: Colors.red,)),
                      ],
                    ),
                  ),
                );
                }),
          ),

        ],
      ),

    );
  }
}
