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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: currentSprintId.isNotEmpty
          ? Container(
              child: FutureBuilder(
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
                    return CircularProgressIndicator();
                  }
                  if (snapshot.connectionState == ConnectionState.done) {
                    Sprint sprint = Sprint.fromSnapshot(snapshot.data![0]);
                    Task task = Task.fromSnapshot(snapshot.data![1]);
                    return ListTile(
                        title: Text(task.title),
                        subtitle: Text(sprint.startTimestamp.toString()));
                  }
                  return Text("loading");
                },
              ),
            )
          : Container(
              child: ListView(
                children: [
                  Text('You are so free ... DO SOME WORK.'),
                  OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      child: Text('Check some work'))
                ],
              ),
            ),
    );
  }
}
