import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/providers/projects_provider.dart';
import 'package:provider/provider.dart';

class AddProjectScreen extends StatefulWidget {
  static const id = '/add-project-screen';

  const AddProjectScreen({Key? key}) : super(key: key);

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
        title: Text(
          'Add project',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            SvgPicture.asset('assets/illustrations/balloon.svg',
                semanticsLabel: 'Project',
                width: MediaQuery.of(context).size.width),
            ListView(
              children: [
                SizedBox(height: 256),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                  ),
                ),
                TextFormField(
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  minLines: 8,
                  maxLines: null,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: saveProject, child: Icon(Icons.add)),
    );
  }
}
