import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TaskManager extends StatelessWidget {
   TaskManager({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');

  Future<void> addTask()async {

   await tasks.add(
      {
        'title' : titleController.text,
        'description' : descriptionController.text,
        'isCompleted' : false,
      }
    );

  }


  void ShowDialog(BuildContext context){
    
    showDialog(context: context, builder: (_)=>AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
        ],
      ),


      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel')),
        TextButton(onPressed: (){
          addTask();
          Navigator.pop(context);
        }, child: Text('Add')),
      ],

    ));
    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Manager'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: tasks.snapshots(),
        builder: (context, snapshot) {

          final docs = snapshot.data!.docs;

          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index){

                final doc = docs[index];

                return ListTile(
                  title: Text(doc['title']),
                  subtitle: Text(doc['description']),
                  leading: Checkbox(value: false, onChanged: (value){}),
                  trailing: Icon(Icons.edit),
                );
              });
        }
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: (){
          ShowDialog(context);
        },
        child: Icon(Icons.add),),

    );

  }
}
