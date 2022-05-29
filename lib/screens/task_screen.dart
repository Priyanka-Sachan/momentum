import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/providers/profile_provider.dart';
import 'package:momentum/providers/sprints_provider.dart';
import 'package:momentum/screens/sprint_screen.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  static const id = '/task-screen';
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          task.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: ListView(
        children: [
          ElevatedButton(
            child: Provider.of<ProfileProvider>(context, listen: false)
                    .currentSprintId
                    .isEmpty
                ? Text('RUN')
                : Text('YOU ARE BUSY'),
            onPressed: () {
              // Start a sprint
              Provider.of<SprintsProvider>(context, listen: false)
                  .saveSprint('iNK2qbHd2orA4mSjjzN1', task.id);
              Navigator.pushNamed(context, SprintScreen.id);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all(CircleBorder()),
              padding: MaterialStateProperty.all(EdgeInsets.all(8)),
            ),
          )
        ],
      ),
    );
  }
}
