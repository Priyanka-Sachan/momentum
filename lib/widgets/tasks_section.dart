import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/screens/task_screen.dart';
import 'package:momentum/widgets/task_card.dart';

class TasksSection extends StatelessWidget {
  final List<Task> tasks;

  const TasksSection({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:8.0),
      child: ListView.builder(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (ctx, i) {
          return TaskCard(task: tasks[i]);
        },
      ),
    );
  }
}
