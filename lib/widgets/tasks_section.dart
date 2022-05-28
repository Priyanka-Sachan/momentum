import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/screens/task_screen.dart';

class TasksSection extends StatelessWidget {
  final List<Task> tasks;

  const TasksSection({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(tasks[i].title),
          subtitle: Text(tasks[i].intervalEstimated.toString()),
          onTap: () {
            Navigator.pushNamed(context, TaskScreen.id, arguments: tasks[i]);
          },
        );
      },
    );
  }
}
