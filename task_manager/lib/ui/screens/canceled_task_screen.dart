import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import '../widgets/task_manager_app_bar.dart';

class CanclledTaskScreen extends StatefulWidget {
  const CanclledTaskScreen({super.key});

  @override
  State<CanclledTaskScreen> createState() => _CanclledTaskScreenState();
}

class _CanclledTaskScreenState extends State<CanclledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TaskManagerAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: ListView.separated(
              itemBuilder: (context, index){
                // return TaskCard(status: 'Cancelled', cardColor: Colors.red,);
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
