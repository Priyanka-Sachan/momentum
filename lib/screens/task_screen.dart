import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';

class TaskScreen extends StatelessWidget {
  static const id = '/task-screen';
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)!.settings.arguments as Task;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Text(task.title),
          ElevatedButton(
            child: Text('RUN'),
            onPressed: () {
              // Start a sprint
            },
          )
        ],
      ),
    );
  }
}
