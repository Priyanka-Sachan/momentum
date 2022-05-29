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
                int completedTasks =
                    tasks.fold(0, (i, el) => el.progress == 100 ? 1 : 0);
                return ListView(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.redAccent[100]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: 128,
                                height: 128,
                                child: CircularProgressIndicator(
                                  value: tasks.length > 0
                                      ? completedTasks * 100 / tasks.length
                                      : 0,
                                  backgroundColor: Theme.of(context).colorScheme.secondary,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${completedTasks * 100 / tasks.length}%',
                                style: Theme.of(context).textTheme.headline5,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Superhero',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                '${completedTasks}/${tasks.length} tasks completed',
                                style: Theme.of(context).textTheme.headline5,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    TasksSection(tasks: tasks),
                  ],
                );
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
