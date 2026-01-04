import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_manager_app_bar.dart';

import '../widgets/task_card.dart';

class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskManagerAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ListView.separated(
              itemBuilder: (context, index){
               // return TaskCard(status: 'Progress', cardColor: Colors.purple,);
                return Text('');
              },
              separatorBuilder: (context, index){
                return SizedBox(height: 5,);
              },
              itemCount: 10),
        )
    );
  }
}
