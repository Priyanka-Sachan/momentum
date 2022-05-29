import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/providers/projects_provider.dart';
import 'package:momentum/screens/add_project_screen.dart';
import 'package:momentum/widgets/nav_button.dart';
import 'package:momentum/widgets/projects_section.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatefulWidget {
  static const id = '/projects-screen';

  const ProjectsScreen({Key? key}) : super(key: key);

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Projects',
          style: Theme.of(context).textTheme.headline4,
        ),
        actions: [
          NavButton(),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: Provider.of<ProjectsProvider>(context, listen: true)
              .getProjectsStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final projects = snapshot.data!.docs
                  .map((e) => Project.fromSnapshot(e))
                  .toList();
              return ProjectsSection(projects: projects);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            AddProjectScreen.id,
          );
        },
      ),
    );
  }
}
