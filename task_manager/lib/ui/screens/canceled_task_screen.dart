import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_card.dart';
import '../../data/models/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';
import '../widgets/snack_bar.dart';
import '../widgets/task_card.dart';
import '../widgets/task_manager_app_bar.dart';

class CanclledTaskScreen extends StatefulWidget {
  const CanclledTaskScreen({super.key});

  @override
  State<CanclledTaskScreen> createState() => _CanclledTaskScreenState();
}

class _CanclledTaskScreenState extends State<CanclledTaskScreen> {


  // 1. Progress task:
  List<TaskModel> _cancelledTaskList = [];

  bool _getcancelledTaskProgress = false;

  // 2. Progress task:
  Future<void> _getAllTask() async {
    _getcancelledTaskProgress = true;
    setState(() {

    });

    ApiResponse response = await ApiCaller.getRequest(url: Urls.cancelledTaskUrl); // API call হচ্ছে

    _getcancelledTaskProgress = false;
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

    _cancelledTaskList = taskList; // final list main state variable-এ assign, UI তে এই data show হবে

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTask();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskManagerAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ListView.separated(
            itemCount: _cancelledTaskList.length,
            itemBuilder: (context, index){

              return  TaskCard(
                // status: 'New',
                taskModel: _cancelledTaskList[index],
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
