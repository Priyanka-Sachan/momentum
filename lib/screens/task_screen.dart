import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          SvgPicture.asset('assets/illustrations/yatch.svg',
              semanticsLabel: 'Wave', width: MediaQuery.of(context).size.width),
          SizedBox(
            height: 32,
          ),
          Text(
            'Currently ${task.progress}% done.',
            style: Theme.of(context).textTheme.headline6,
          ),
          task.intervalEstimated * task.progress / 100 > task.intervalTaken
              ? Text(
                  'We are on the right track i.e. speed...\n Enjoy it with a cup of tea.',
                  style: Theme.of(context).textTheme.headline5,
                )
              : Text(
                  'Working slow...Let\'s pick up the pace..',
                  style: Theme.of(context).textTheme.headline5,
                ),
          SizedBox(
            height: 32,
          ),
          OutlinedButton(
            child: Provider.of<ProfileProvider>(context, listen: false)
                    .currentSprintId
                    .isEmpty
                ? Text('RUN')
                : Text('YOUR TIMER IS ALREADY ON! \n ARE YOU MULTITASKING?'),
            onPressed: () {
              // Start a sprint
              Provider.of<SprintsProvider>(context, listen: false)
                  .saveSprint('iNK2qbHd2orA4mSjjzN1', task.id);
              Navigator.pushNamed(context, SprintScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
