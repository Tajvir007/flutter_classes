import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/models/task_status_count_model.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/screens/add_new_task_screen.dart';
import 'package:task_manager/ui/widgets/snack_bar.dart';

import '../widgets/task_card.dart';
import '../widgets/task_count_by_status.dart';
import '../widgets/task_manager_app_bar.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {


  bool _getTaskStatusCountProgress = false; // task status count আনতে গিয়ে loading চলছে কিনা সেটা track করার flag
  bool _getNewTaskProgress = false; // নতুন task আনার সময় loading দেখানোর জন্য flag

  // 1. Task count:
  List<TaskStatusCountModel> _taskStatusCountList = []; // API থেকে আসা সব task status count data এই list-এ store হবে

  // 1. New task:
  List<TaskModel> _newTaskList = [];

  // 2. Task count:
  Future<void> _getAllTaskCount() async {
    _getTaskStatusCountProgress = true;
    setState(() {

    });

    ApiResponse response = await ApiCaller.getRequest(url: Urls.taskCountUrl); // API call হচ্ছে

    _getTaskStatusCountProgress = false;
    setState(() {

    });

    List<TaskStatusCountModel> list = []; // temporary empty list, API থেকে পাওয়া data আগে এখানে ঢুকবে
    if(response.isSuccessful){

      // API response এর data array loop করা হচ্ছে, প্রতিটা item হলো একটা JSON object
      for(Map<String, dynamic> jsonData in response.responseData['data']){
        list.add(TaskStatusCountModel.formJson(jsonData)); // JSON → Model convert করা হচ্ছে, list-এ add করা হচ্ছে
      }
    }

    _taskStatusCountList = list; // final list main state variable-এ assign, UI তে এই data show হবে

  }


  // 2. New task:
  Future<void> _getAllNewTask() async {
    _getNewTaskProgress = true;
    setState(() {

    });

    ApiResponse response = await ApiCaller.getRequest(url: Urls.newTaskUrl); // API call হচ্ছে

    _getNewTaskProgress = false;
    setState(() {

    });

    List<TaskModel> taskList = []; // temporary empty list, API থেকে পাওয়া data আগে এখানে ঢুকবে
    if(response.isSuccessful){

      // API response এর data array loop করা হচ্ছে, প্রতিটা item হলো একটা JSON object
      for(Map<String, dynamic> jsonData in response.responseData['data']){
        taskList.add(TaskModel.fromJson(jsonData)); // JSON → Model convert করা হচ্ছে, list-এ add করা হচ্ছে
      }
    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }

    _newTaskList = taskList; // final list main state variable-এ assign, UI তে এই data show হবে

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTaskCount();
    _getAllNewTask();
    setState(() {

    });
  }


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

                itemCount: _taskStatusCountList.length,
                itemBuilder: (context, index){
                  return TaskCountByStatus(title: _taskStatusCountList[index].status,
                    count: _taskStatusCountList[index].count,
                  );
                },
            separatorBuilder: (context, index){
                return SizedBox(width: 4,);
            },
            ),
          ),

          // ******************* Main Content Body **********************
          Expanded(   // Here expanded is used to take full screen width as they need
            child: ListView.separated(
              itemCount: _newTaskList.length,
                itemBuilder: (context, index){
            
                return  TaskCard(
                 // status: 'New',
                  taskModel: _newTaskList[index],
                  refreshParent: (){
                    _getAllNewTask();
                    _getAllTaskCount();
                  },
                  cardColor: Colors.blue,); // It's a custom widget. It is used to show the task card in main body through list view

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





