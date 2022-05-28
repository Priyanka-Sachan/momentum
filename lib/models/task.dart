import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  String projectId;
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
      required this.title,
      required this.scheduledDateTime,
      required this.intervalEstimated,
      required this.intervalTaken,
      required this.progress,
      required this.tags,
      required this.sprints});

  factory Task.fromJson(Map<String, dynamic> json) => _taskFromJson(json);

  Map<String, dynamic> toJson() => _taskToJson(this);
}

Task _taskFromJson(Map<String, dynamic> json) {
  return Task(
      id: json['id'] as String,
      projectId: json['projectId'] as String,
      title: json['title'] as String,
      scheduledDateTime: (json['scheduledDateTime'] as Timestamp).toDate(),
      intervalEstimated: json['intervalEstimated'] as int,
      intervalTaken: json['intervalTaken'] as int,
      progress: json['progress'] as int,
      tags: (json['tags'] as List<dynamic>).cast<String>(),
      sprints: (json['sprints'] as List<dynamic>).cast<String>());
}

Map<String, dynamic> _taskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'scheduledDateTime': instance.scheduledDateTime,
      'intervalEstimated': instance.intervalEstimated,
      'intervalTaken': instance.intervalTaken,
      'progress': instance.progress,
      'tags': instance.tags,
      'sprints': instance.sprints
    };
