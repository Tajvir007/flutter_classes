import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentInfo extends StatefulWidget {
  const StudentInfo({super.key});

  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Student Info'),
      ),

      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('students').snapshots(),
          builder: (context, snapshot) {


            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }

            final students = snapshot.data!.docs;

            if(students.isEmpty){
              return Center(child: Text('No students found'),);
            }

            return ListView.builder(
                itemCount: 3,

                itemBuilder: (context, index){

                  final doc = students[index];
                  final data = doc.data() as Map<String, dynamic>;


                  return Card(
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 10,),

                        Column(
                          children: [
                            Text('Name: ${data['name']}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),

                            Text('Roll No: ${data['rollNumber']}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),

                            Text('Course: ${data['course']}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  );
                }
            );
          }
      ),

    );
  }
}
