import 'package:momentum/models/task.dart';

class Project {
  String id;
  String title;
  String description;
  int timeEstimated;
  int timeTaken;
  int progress;
  List<String> tasks;

  Project.name(this.id, this.title, this.description, this.timeEstimated,
      this.timeTaken, this.progress, this.tasks);
}
