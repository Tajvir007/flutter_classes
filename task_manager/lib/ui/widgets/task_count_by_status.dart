import 'package:flutter/material.dart';

class TaskCountByStatus extends StatelessWidget {
  const TaskCountByStatus({
    super.key, required this.title, required this.count,
  });


  // To dynamic task title and status
  final String title;
  final int count;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          children: [
            Text(count.toString(), // Dynamic task number
              style: TextTheme.of(context).titleLarge,
            ),

            Text(title), // Dynamic task title

          ],
        ),
      ),

    );
  }
}