import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';

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
        );
      },
    );
  }
}
