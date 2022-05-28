import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/providers/tasks_provider.dart';
import 'package:momentum/widgets/nav_button.dart';
import 'package:momentum/widgets/tasks_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const id = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          NavButton(),
        ],
      ),
      body: Column(
        children: [
          Text('Hi Sachan'),
          Text('Let\'s check your tasks'),
          Card(
            child: Text('Overview of your work today...'),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: Provider.of<TasksProvider>(context, listen: true)
                    .getTaskByDateStream(new DateTime.now()),
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
                }),
          ),
        ],
      ),
    );
  }
}
