import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/providers/projects_provider.dart';
import 'package:momentum/screens/add_project_screen.dart';
import 'package:momentum/widgets/nav_button.dart';
import 'package:momentum/widgets/projects_section.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({Key? key}) : super(key: key);
  static const id = '/projects-screen';

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          NavButton(),
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
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
