import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({Key? key, required this.projects}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                ' ALL ',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              Text(
                ' ACTIVE ',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                ' COMPLETED ',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    ?.copyWith(fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
        ListView.builder(
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: projects.length,
          itemBuilder: (ctx, i) {
            return ProjectCard(project: projects[i]);
          },
        ),
      ],
    );
  }
}
