import 'package:flutter/material.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/widgets/background_page_logo.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';
import 'package:task_manager/ui/widgets/snack_bar.dart';

import '../widgets/task_manager_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBar(),
      
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(

              key: _formKey,

              child: Column(
                children: [
                  const SizedBox(height: 150,),
                  Text('Add New Task',
                  style: Theme.of(context).textTheme.titleLarge,
                  ),

                  TextFormField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      hintText: 'Title',
                      labelText: 'Title',
                    ),

                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return 'Title required';
                      }

                    },

                  ),
                  const SizedBox(height: 20,),

                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                    ),

                    validator: (String ? value){
                      if(value == null || value.isEmpty){
                        return 'Description required';
                      }

                    },

                  ),

                  SizedBox(
                      width: double.infinity,
                      child: FilledButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          addNewTask();
                        }
                      },
                          child: Icon(Icons.arrow_circle_right)))
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }



  bool _addtaskProgress = false; // নতুন task add করার সময় loading / progress চলছে কিনা তা track করার জন্য flag

  // নতুন task add করার async function (API call করার জন্য async)
  Future<void> addNewTask()async {

    _addtaskProgress = true;
    setState(() {

    });

    // API তে পাঠানোর জন্য request body তৈরি করা হচ্ছে
    Map<String, dynamic> requestBody = {

        "title": _titleController.text,
        "description": _descriptionController.text,
        "status":"New"

    };

    final ApiResponse response = await ApiCaller.postRequest( // API তে POST request পাঠানো হচ্ছে এবং response wait করা হচ্ছে
    url: Urls.createTaskUrl,
      body: requestBody

    );

    _addtaskProgress = false;
    setState(() {

    });

    if(response.isSuccessful){

      _clearField();
      Navigator.pushNamedAndRemoveUntil(context, 'mainNavBarHolderScreen', (predicate) => false);
      showSnackBarMessage(context, 'New Task added');

    }else{
      showSnackBarMessage(context, response.errorMessage!);
    }

  }


  _clearField(){
    _titleController.clear();
    _descriptionController.clear();
  }

}
