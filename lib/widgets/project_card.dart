import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/screens/project_screen.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(4),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('URGENT',
                          style: Theme.of(context).textTheme.bodyText2),
                      Text(project.title,
                          style: Theme.of(context).textTheme.headline6),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: project.progress / 100,
                        backgroundColor: Colors.grey,
                        color: Colors.black,
                      ),
                      Text('${project.progress}%')
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${project.tasks.length} tasks'),
                  Icon(Icons.arrow_forward_rounded),
                ],
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, ProjectScreen.id, arguments: project);
      },
    );
  }
}
