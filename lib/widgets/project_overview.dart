import 'dart:math';
import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/models/task.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProjectOverview extends StatelessWidget {
  final Project project;
  final List<Task> tasks;
  const ProjectOverview({Key? key, required this.project, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    project.timeEstimated = tasks.fold(
        0, (i, el) => i + (el.intervalEstimated * el.progress / 100).round());
    project.timeTaken = tasks.fold(0, (i, el) => i + el.intervalTaken);
    int completedTasks = tasks.fold(0, (i, el) => el.progress == 100 ? 1 : 0);
    if (tasks.isNotEmpty) {
      project.progress = tasks.fold(0, (i, el) => i + el.progress);
      project.progress = (project.progress / tasks.length).round();
    }
    Duration timeEstimated = Duration(minutes: project.timeEstimated);
    Duration timeTaken = Duration(minutes: project.timeTaken);

    List<ChartData> data = tasks
        .map((t) => ChartData(t.title, t.intervalTaken,
            Colors.primaries[Random().nextInt(Colors.primaries.length)]))
        .toList();

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
        Column(
          children: [
            SfCircularChart(series: <CircularSeries>[
              // Renders doughnut chart
              DoughnutSeries<ChartData, String>(
                dataSource: data,
                pointColorMapper: (ChartData data, _) => data.color,
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                //  cornerStyle: CornerStyle.bothCurve
              )
            ]),
            Column(
              children: [
                Text(
                    'Estimated time: ${timeEstimated.inHours > 0 ? timeEstimated.inHours.toString() + ' hours' : ''} ${timeEstimated.inMinutes - 60 * timeEstimated.inHours} minutes'),
                Text(
                    'Taken time: ${timeTaken.inHours > 0 ? timeTaken.inHours.toString() + ' hours' : ''} ${timeTaken.inMinutes - 60 * timeTaken.inHours} minutes'),
                Text('Progress: ${project.progress}%'),
                Text('${completedTasks} / ${tasks.length} tasks completed')
              ],
            )
          ],
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);

  final String x;
  final int y;
  final Color color;
}
