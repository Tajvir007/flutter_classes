import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import 'package:task_manager/ui/widgets/task_manager_app_bar.dart';

import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/snack_bar.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});

  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {


  // 1. Completed task:
  List<TaskModel> _completedTaskList = [];

  bool _getCompletedTaskProgress = false;

  // 2. Completed task:
  Future<void> _getAllTask() async {
    _getCompletedTaskProgress = true;
    setState(() {

    });

    ApiResponse response = await ApiCaller.getRequest(url: Urls.completedTaskUrl); // API call হচ্ছে

    _getCompletedTaskProgress = false;
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

    _completedTaskList = taskList; // final list main state variable-এ assign, UI তে এই data show হবে

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTask();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: ListView.separated(
          itemCount: _completedTaskList.length,
          itemBuilder: (context, index){

            return  TaskCard(
              // status: 'New',
              taskModel: _completedTaskList[index],
              refreshParent: (){
                _getAllTask();
              },
              cardColor: Colors.blue,); // It's a custom widget. It is used to show the task card in main body through list view

          },
          separatorBuilder: (context, index){
            return SizedBox(height: 4,);
          },
        ),
      )
    );
  }
}
