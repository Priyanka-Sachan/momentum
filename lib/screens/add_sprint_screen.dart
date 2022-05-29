import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';

class AddSprintScreen extends StatefulWidget {
  static const id = '/add-sprint-screen';
  const AddSprintScreen({Key? key}) : super(key: key);

  @override
  State<AddSprintScreen> createState() => _AddSprintScreenState();
}

class _AddSprintScreenState extends State<AddSprintScreen> {
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
          Text('You are currently'),
          Text(task.title),
          
        ],
      ),
    );
  }
}
