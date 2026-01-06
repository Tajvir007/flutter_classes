import 'package:flutter/material.dart';
import 'package:task_manager/data/models/task_model.dart';
import 'package:task_manager/ui/widgets/snack_bar.dart';

import '../../data/models/task_status_count_model.dart';
import '../../data/services/api_caller.dart';
import '../../data/utils/urls.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });


  final TaskModel taskModel;
  final Color cardColor;

  final VoidCallback refreshParent;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

// 1. Change Status:
class _TaskCardState extends State<TaskCard> {

  bool _changeStatusInProgress = false;

  // 2. Change Status:
  Future<void> _changeStatus(String status) async {
    _changeStatusInProgress = true;
    setState(() {

    });

    ApiResponse response = await ApiCaller.getRequest(url: Urls.changeStatusUrl(widget.taskModel.id, status)); // API call হচ্ছে

    _changeStatusInProgress = false;
    setState(() {

    });


    if(response.isSuccessful){

      widget.refreshParent();
      Navigator.pop(context);

    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }


  }


  @override
  Widget build(BuildContext context) {


    // 1. Change status: It'll show a dialog to change the status
    void _showChangeStatusDialog(){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(

            mainAxisSize: MainAxisSize.min,

            children: [
              ListTile(
                onTap: (){
                  _changeStatus('New');
                },
                title: Text('New'),
                trailing: widget.taskModel.status == 'New' ? Icon(Icons.done) : null,
              ),

              ListTile(
                onTap: (){
                  _changeStatus('Completed');
                },
                title: Text('Completed'),
                trailing: widget.taskModel.status == 'Completed' ? Icon(Icons.done) : null,
              ),

              ListTile(
                onTap: (){
                  _changeStatus('progress');
                },
                title: Text('progress'),
                trailing: widget.taskModel.status == 'progress' ? Icon(Icons.done) : null,
              ),

              ListTile(
                onTap: (){
                  _changeStatus('Cancelled');
                },
                title: Text('Cancelled'),
                trailing: widget.taskModel.status == 'Cancelled' ? Icon(Icons.done) : null,
              ),


            ],
          ),
        );
      });
    }



    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Card(

        color: Colors.white70,

        child: ListTile(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),

          title: Text(widget.taskModel.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 20
          ),
          ),
          subtitle: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(widget.taskModel.description),
              Text('Date: ${widget.taskModel.createdDate}'),
              // Chip is a button
              Row(

                children: [
                  Chip(label: Text(widget.taskModel.status), // Customize status by variable
                    backgroundColor: widget.cardColor, // Customize status by variable
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Spacer(),

                  IconButton(onPressed: (){
                    _showChangeStatusDialog();
                  }, icon: Icon(Icons.edit_note, color: Colors.green,)),
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
