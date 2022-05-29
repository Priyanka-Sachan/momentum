import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/models/task.dart';

class ProjectOverview extends StatelessWidget {
  final Project project;
  final List<Task> tasks;
  const ProjectOverview({Key? key, required this.project, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    project.timeEstimated = tasks.fold(0, (i, el) => i + el.intervalEstimated);
    project.timeTaken = tasks.fold(0, (i, el) => i + el.intervalTaken);
    int completedTasks = tasks.fold(0, (i, el) => el.progress == 100 ? 1 : 0);
    if (tasks.isNotEmpty) {
      // project.progress =
          // (tasks.fold(0, (i, el) => i + el.progress)) / tasks.length;
    }

    return ListView(
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            project.description,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        Card(
          child: Row(
            children: [
              Stack(
                children: [
                  CircularProgressIndicator(
                    value: project.progress / 100,
                    backgroundColor: Colors.grey,
                    color: Colors.redAccent,
                  ),
                  Text('${project.progress}%')
                ],
              ),
              Column(
                children: [
                  Text('Estimated time: ${project.timeEstimated}'),
                  Text('Taken time: ${project.timeTaken}')
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
