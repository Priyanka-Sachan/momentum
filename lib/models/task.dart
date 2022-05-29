import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String projectId;
  String projectTitle;
  String title;
  DateTime scheduledDateTime;
  int intervalEstimated;
  int intervalTaken;
  int progress;
  List<String> tags;
  List<String> sprints;

  Task(
      {required this.id,
      required this.projectId,
      required this.projectTitle,
      required this.title,
      required this.scheduledDateTime,
      required this.intervalEstimated,
      required this.intervalTaken,
      required this.progress,
      required this.tags,
      required this.sprints});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
        id: json['id'] as String,
        projectId: json['projectId'] as String,
        projectTitle: json['projectTitle'] as String,
        title: json['title'] as String,
        scheduledDateTime: (json['scheduledDateTime'] as Timestamp).toDate(),
        intervalEstimated: json['intervalEstimated'] as int,
        intervalTaken: json['intervalTaken'] as int,
        progress: json['progress'] as int,
        tags: (json['tags'] as List<dynamic>).cast<String>(),
        sprints: (json['sprints'] as List<dynamic>).cast<String>());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'projectId': projectId,
      'projectTitle': projectTitle,
      'title': title,
      'scheduledDateTime': scheduledDateTime,
      'intervalEstimated': intervalEstimated,
      'intervalTaken': intervalTaken,
      'progress': progress,
      'tags': tags,
      'sprints': sprints
    };
  }

  factory Task.fromSnapshot(DocumentSnapshot snapshot) {
    final task = Task.fromJson(snapshot.data() as Map<String, dynamic>);
    return task;
  }
}
