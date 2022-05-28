import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/providers/projects_provider.dart';
import 'package:provider/provider.dart';

class AddProjectScreen extends StatefulWidget {
  const AddProjectScreen({Key? key}) : super(key: key);
  static const id = '/add-project-screen';

  @override
  State<AddProjectScreen> createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _title = "";
  String _description = "";

  @override
  void initState() {
    _titleController.addListener(() {
      setState(() {
        _title = _titleController.text;
      });
    });
    _descriptionController.addListener(() {
      setState(() {
        _description = _descriptionController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Project getProject() {
    Project project = Project(
        id: "",
        title: _title,
        description: _description,
        timeEstimated: 0,
        timeTaken: 0,
        progress: 0,
        tasks: []);
    return project;
  }

  saveProject() {
    Project project = getProject();
    Provider.of<ProjectsProvider>(context, listen: false)
        .saveProject('iNK2qbHd2orA4mSjjzN1', project);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: saveProject,
          ),
        ],
      ),
      body: Form(
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: _descriptionController,
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: null,
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
