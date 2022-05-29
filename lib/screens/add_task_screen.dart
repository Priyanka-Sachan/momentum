import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';
import 'package:momentum/models/task.dart';
import 'package:momentum/providers/tasks_provider.dart';
import 'package:provider/provider.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddTaskScreen extends StatefulWidget {
    static const id = '/add-task-screen';

  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();

  late Project _project ;
  String _title = "";
  DateTime _scheduledDateTime = DateTime.now();
  int _intervalEstimated = 0;
  List<String> _tags = [];

  @override
  void initState() {
    _titleController.addListener(() {
      setState(() {
        _title = _titleController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Task getTask() {
    Task task = Task(
        id: "",
        projectId: _project.id,
        projectTitle: _project.title,
        title: _title,
        scheduledDateTime: _scheduledDateTime,
        intervalEstimated: _intervalEstimated,
        intervalTaken: 0,
        progress: 0,
        tags: _tags,
        sprints: []);
    return task;
  }

  saveTask() {
    Task task = getTask();
    Provider.of<TasksProvider>(context, listen: false)
        .saveTask('iNK2qbHd2orA4mSjjzN1', task);
  }

  String _selectedDate = 'Tap to select date';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2012),
      lastDate: DateTime(2032),
    );
    if (d != null) {
      setState(() {
        _selectedDate = '${d.day} ${d.month}, ${d.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _project = ModalRoute.of(context)!.settings.arguments as Project;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add task',
          style: Theme.of(context).textTheme.headline3,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: saveTask,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  InkWell(
                    child: Text(_selectedDate,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF000000))),
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.calendar_today),
                    tooltip: 'Tap to open date picker',
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                ],
              ),
              Slider(
                value: _intervalEstimated.toDouble(),
                min: 0,
                max: 100,
                label: _intervalEstimated.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _intervalEstimated = value.round();
                  });
                },
              ),
              TextFieldTags(
                  initialTags: _tags,
                  textSeparators: [','],
                  textFieldStyler: TextFieldStyler(
                      helperText: '',
                      helperStyle:
                          TextStyle(color: Theme.of(context).colorScheme.primary),
                      textFieldBorder: InputBorder.none,
                      textFieldFocusedBorder: InputBorder.none,
                      textFieldDisabledBorder: InputBorder.none,
                      textFieldEnabledBorder: InputBorder.none),
                  tagsStyler: TagsStyler(
                      tagPadding: const EdgeInsets.all(8.0),
                      tagDecoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius:
                              const BorderRadiusDirectional.all(Radius.circular(8))),
                      tagCancelIcon: const Icon(Icons.cancel,
                          size: 18.0, color: Colors.white)),
                  onTag: (tag) {
                    _tags.add(tag);
                  },
                  onDelete: (tag) {
                    _tags.remove(tag);
                  },
                  validator: (tag) {
                    if (tag.length > 16) {
                      return "Hey that's too long";
                    }
                    if (_tags.contains(tag)) {
                      return "Tag already added";
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
