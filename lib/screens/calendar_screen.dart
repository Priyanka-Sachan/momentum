import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/widgets/task_card.dart';
import 'package:provider/provider.dart';

import '../providers/tasks_provider.dart';

class CalendarScreen extends StatefulWidget {
  static const id = '/calendar-screen';
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  late List<Task> filteredTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<QuerySnapshot>(
          stream: Provider.of<TasksProvider>(context, listen: true)
              .getTasksStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final tasks =
                  snapshot.data!.docs.map((e) => Task.fromSnapshot(e)).toList();
              filteredTasks = tasks
                  .where((t) =>
                      t.scheduledDateTime.year == _selectedDate.year &&
                      t.scheduledDateTime.month == _selectedDate.month &&
                      t.scheduledDateTime.day == _selectedDate.day)
                  .toList();
              return ListView(
                children: [
                  CalendarTimeline(
                    showYears: true,
                    initialDate: _selectedDate,
                    firstDate:
                        DateTime.now().subtract(const Duration(days: 3650)),
                    lastDate: DateTime.now().add(const Duration(days: 3650)),
                    onDateSelected: (date) {
                      setState(() {
                        _selectedDate = date!;
                        filteredTasks = tasks
                            .where((t) =>
                                t.scheduledDateTime.year ==
                                    _selectedDate.year &&
                                t.scheduledDateTime.month ==
                                    _selectedDate.month &&
                                t.scheduledDateTime.day == _selectedDate.day)
                            .toList();
                      });
                    },
                    leftMargin: 20,
                    monthColor: Colors.black54,
                    dayColor: Theme.of(context).colorScheme.secondary,
                    dayNameColor: Color(0xFF333A47),
                    activeDayColor: Colors.black,
                    activeBackgroundDayColor: Colors.redAccent[100],
                    dotsColor: Color(0xFF333A47),
                    selectableDayPredicate: (date) => date.day != 23,
                    locale: 'en',
                  ),
                  ListView.builder(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: filteredTasks.length,
                      itemBuilder: (ctx, i) => TaskCard(task: filteredTasks[i]))
                ],
              );
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
