import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/widgets/task_card.dart';

class TasksSection extends StatelessWidget {
  final List<Task> tasks;

  const TasksSection({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    ' ALL ',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    ' ACTIVE ',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (ctx, i) {
              return TaskCard(task: tasks[i]);
            },
          ),
        ),
      ],
    );
  }
}
