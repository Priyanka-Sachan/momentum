import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/providers/tasks_provider.dart';
import 'package:momentum/screens/add_task_screen.dart';
import 'package:momentum/widgets/tasks_section.dart';
import 'package:provider/provider.dart';

class ProjectScreen extends StatelessWidget {
  static const id = '/project-screen';
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final project = ModalRoute.of(context)!.settings.arguments as Project;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          project.title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              project.description,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
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
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AddTaskScreen.id,
                        arguments: project,
                      );
                    },
                    icon: const Icon(Icons.add))
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Provider.of<TasksProvider>(context, listen: true)
                .getTaskByProjectStream(project.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tasks = snapshot.data!.docs
                    .map((e) => Task.fromSnapshot(e))
                    .toList();
                return TasksSection(tasks: tasks);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
