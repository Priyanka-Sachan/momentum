import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/sprint.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/providers/profile_provider.dart';
import 'package:momentum/providers/sprints_provider.dart';
import 'package:momentum/providers/tasks_provider.dart';
import 'package:momentum/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SprintScreen extends StatefulWidget {
  static const id = '/sprint-screen';
  const SprintScreen({Key? key}) : super(key: key);

  @override
  State<SprintScreen> createState() => _SprintScreenState();
}

class _SprintScreenState extends State<SprintScreen> {
  @override
  Widget build(BuildContext context) {
    String currentSprintId =
        Provider.of<ProfileProvider>(context, listen: true).currentSprintId;
    String currentTaskId =
        Provider.of<ProfileProvider>(context, listen: true).currentTaskId;
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(),
      body: currentSprintId.isNotEmpty
          ? FutureBuilder(
              future: Future.wait([
                Provider.of<SprintsProvider>(context, listen: false)
                    .getSprint(currentSprintId),
                Provider.of<TasksProvider>(context, listen: false)
                    .getTask(currentTaskId)
              ]),
              builder: (BuildContext context,
                  AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  Sprint sprint = Sprint.fromSnapshot(snapshot.data![0]);
                  Task task = Task.fromSnapshot(snapshot.data![1]);
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView(
                      children: [
                        Text(
                          'YOU ARE ON FIRE',
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.copyWith(color: Colors.red.shade50),
                        ),
                        Text(
                          task.title,
                          style: Theme.of(context)
                              .textTheme
                              .headline2
                              ?.copyWith(color: Colors.white),
                        ),
                        Text(
                            'Working since ${sprint.startTimestamp.toString()}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white))
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You are so free ... DO SOME WORK.',
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        ?.copyWith(color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, HomeScreen.id);
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 48,
                      child: Text('DO'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
