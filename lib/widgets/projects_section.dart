import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/screens/project_screen.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (ctx, i) {
        return ListTile(
          title: Text(projects[i].title),
          subtitle: Text(projects[i].description),
          onTap: () {
            Navigator.pushNamed(context, ProjectScreen.id,
                arguments: projects[i]);
          },
        );
      },
    );
  }
}
