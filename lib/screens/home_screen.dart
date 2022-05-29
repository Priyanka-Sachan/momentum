import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/providers/profile_provider.dart';
import 'package:momentum/providers/tasks_provider.dart';
import 'package:momentum/widgets/nav_button.dart';
import 'package:momentum/widgets/tasks_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String username =
        Provider.of<ProfileProvider>(context, listen: false).username;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          NavButton(),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi $username',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text('Let\'s check your tasks',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Colors.grey)),
                Card(
                  child: Text('Overview of your work today...'),
                ),
              ],
            ),
          ),
          StreamBuilder<QuerySnapshot>(
            stream: Provider.of<TasksProvider>(context, listen: true)
                .getTaskByDateStream(DateTime.now()),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final tasks = snapshot.data!.docs
                    .map((e) => Task.fromSnapshot(e))
                    .toList();
                return TasksSection(tasks: tasks);
              } else {
                return const Center(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
