import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/screens/task_screen.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double estimateTimeLeft =
        (100 - task.progress) / 100 * task.intervalEstimated;
    return InkWell(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.projectTitle.toUpperCase(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(color: Colors.grey),
                  ),
                  Text(
                    task.title,
                     style: Theme.of(context)
                        .textTheme
                        .headline6
                  ),
                  Text(
                    'About ${estimateTimeLeft.round()} minutes left',
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: task.progress / 100,
                    backgroundColor: Colors.grey,
                    color: Colors.black,
                  ),
                  Text('${task.progress}%')
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, TaskScreen.id, arguments: task);
      },
    );
  }
}
