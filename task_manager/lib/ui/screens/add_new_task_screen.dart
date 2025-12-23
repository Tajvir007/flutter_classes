import 'package:flutter/material.dart';
import 'package:task_manager/ui/widgets/background_page_logo.dart';
import 'package:task_manager/ui/widgets/background_screen.dart';

import '../widgets/task_manager_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TaskManagerAppBar(),
      
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 150,),
                Text('Add New Task',
                style: Theme.of(context).textTheme.titleLarge,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Subject',
                    labelText: 'Subject',
                  ),
                ),
                const SizedBox(height: 20,),

                TextFormField(
                  maxLines: 6,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                  ),
                ),

                SizedBox(
                    width: double.infinity,
                    child: FilledButton(onPressed: (){},
                        child: Icon(Icons.arrow_circle_right)))
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
