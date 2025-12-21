import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/task_manager_app_bar.dart';

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

      body: Column(
        children: [
          Text('Progress task')
        ],
      ),
    );
  }
}
