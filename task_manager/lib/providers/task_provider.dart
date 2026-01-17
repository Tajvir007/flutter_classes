import 'package:flutter/cupertino.dart';
import 'package:task_manager/core/enums/api_state.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/data/models/task_status_count_model.dart';

import '../data/services/api_caller.dart';
import '../data/utils/urls.dart';

class TaskProvider extends ChangeNotifier{

  List<TaskModel> _newTask = [];
  List<TaskModel> _CompletedTask = [];
  List<TaskModel> _progressTask = [];
  List<TaskModel> _canceledTask = [];

  List<TaskStatusCountModel> _taskStatusCount = [];

  ApiState _taskListState = ApiState.initial;
  ApiState _taskCountState = ApiState.initial;

  String ? _errorMessage;

  List<TaskModel> get newTask => _newTask;
  List<TaskModel> get completedTask => _CompletedTask;
  List<TaskModel> get progressTask => _progressTask;
  List<TaskModel> get canceledTask => _canceledTask;
  List<TaskStatusCountModel> get taskStatusCount => _taskStatusCount;

Future<void> fetchTaskStatusCount() async {
  _taskCountState = ApiState.loading;
  notifyListeners();

  ApiResponse response = await ApiCaller.getRequest(url: Urls.taskCountUrl); // API call হচ্ছে
  if(response.isSuccessful){
    _taskStatusCount = [];
    // API response এর data array loop করা হচ্ছে, প্রতিটা item হলো একটা JSON object
    for(Map<String, dynamic> jsonData in response.responseData['data']){
      _taskStatusCount.add(TaskStatusCountModel.formJson(jsonData)); // JSON → Model convert করা হচ্ছে, list-এ add করা হচ্ছে

      _taskCountState = ApiState.success;
      _errorMessage = null;
    }
  }else{
    _taskCountState = ApiState.error;
    _errorMessage = response.errorMessage ?? 'Failed to fetch task count';
  }

  notifyListeners();

}

  Future<void> fetchNewTaskByStatus(String status) async {
    _taskListState = ApiState.loading;
    notifyListeners();

    String url;

    switch(status){
      case('New'):
        url = Urls.newTaskUrl;
        break;

      case('Progress'):
        url = Urls.progressTaskUrl;
        break;

      case('Completed'):
        url = Urls.completedTaskUrl;
        break;

      case('Canceled'):
        url = Urls.createTaskUrl;
        break;

      default:
        url = Urls.newTaskUrl;

    }

    ApiResponse response = await ApiCaller.getRequest(url: url); // API call হচ্ছে
    
    if(response.isSuccessful){
      
      List<TaskModel> tasks = [];
      
      // API response এর data array loop করা হচ্ছে, প্রতিটা item হলো একটা JSON object
      for(Map<String, dynamic> jsonData in response.responseData['data']){
        tasks.add(TaskModel.fromJson(jsonData)); // JSON → Model convert করা হচ্ছে, list-এ add করা হচ্ছে


        switch(status){
          case('New'):
            _newTask = tasks;
            break;

          case('Progress'):
            _progressTask = tasks;
            break;

          case('Completed'):
            _canceledTask = tasks;;
            break;

          case('Canceled'):
            _canceledTask = tasks;
            break;

          default:
            _newTask = tasks;

        }


        _taskListState = ApiState.success;
        _errorMessage = null;
      }
    }else{
      _taskCountState = ApiState.error;
      _errorMessage = response.errorMessage ?? 'Failed to fetch task';
    }

    notifyListeners();

  }

}