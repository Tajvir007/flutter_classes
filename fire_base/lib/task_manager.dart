import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskManager extends StatelessWidget {
   TaskManager({super.key});

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');


  Future<void> updateTask(String id, bool isCompleted)async {
    await tasks.doc(id).update(
      {
        'title' : titleController.text,
        'description' : descriptionController.text,
        'isCompleted' : isCompleted,
      }
    );
  }


   Future<void> updateStatus(String id, bool isCompleted)async {
     await tasks.doc(id).update(
         {
           'isCompleted' : isCompleted,
         }
     );
   }


Future<void> deleteTask(String id)async {
  await tasks.doc(id).delete();
}

  Future<void> addTask()async {

   await tasks.add(
      {
        'title' : titleController.text,
        'description' : descriptionController.text,
        'isCompleted' : false,
      }
    );

  }


  void ShowDialog(BuildContext context, [DocumentSnapshot ?doc]){

    if(doc != null){
      titleController.text = doc['title'];
      descriptionController.text = doc['description'];
    }else{
      titleController.clear();
      descriptionController.clear();
    }
    
    showDialog(context: context, builder: (_)=>AlertDialog(
      
      title: Text(doc != null ? 'Update Task' : 'Add Task'),
      
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

          doc != null ? updateTask(doc.id, doc['isCompleted']) : addTask();

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

          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator(),);
          }

          final docs = snapshot.data!.docs;

          return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index){

                final doc = docs[index];

                return Slidable(

                  key: ValueKey(doc.id),
                  endActionPane: ActionPane(
                      motion: DrawerMotion(),
                      children: [
                        SlidableAction(onPressed: (_){
                          deleteTask(doc.id);
                        },
                        backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),

                      ]),

                  child: Card(
                    child: ListTile(
                      title: Text(doc['title']),
                      subtitle: Text(doc['description']),
                      leading: Checkbox(value: doc['isCompleted'], onChanged: (value){

                        updateStatus(doc.id, value!);

                      }),
                      trailing: IconButton(onPressed: (){

                        ShowDialog(context, doc);

                      }, icon: Icon(Icons.edit)),
                    ),
                  ),
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
