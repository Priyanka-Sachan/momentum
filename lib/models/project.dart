import 'package:cloud_firestore/cloud_firestore.dart';

class Project {
  String id;
  String title;
  String description;
  int timeEstimated;
  int timeTaken;
  int progress;
  List<String> tasks;

  Project(
      {required this.id,
      required this.title,
      required this.description,
      required this.timeEstimated,
      required this.timeTaken,
      required this.progress,
      required this.tasks});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        timeEstimated: json['timeEstimated'] as int,
        timeTaken: json['timeTaken'] as int,
        progress: json['progress'] as int,
        tasks: (json['tasks'] as List<dynamic>).cast<String>());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'timeEstimated': timeEstimated,
      'timeTaken': timeTaken,
      'progress': progress,
      'tasks': tasks
    };
  }

  factory Project.fromSnapshot(DocumentSnapshot snapshot) {
    final project = Project.fromJson(snapshot.data() as Map<String, dynamic>);
    return project;
  }
}
