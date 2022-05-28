import 'package:flutter/material.dart';
import 'package:momentum/widgets/nav_button.dart';

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
        child: Center(
          child: Text('PROJECTS'),
        ),
      ),
    );
  }
}
