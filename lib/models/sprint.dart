import 'package:cloud_firestore/cloud_firestore.dart';

class Sprint {
  String id;
  String taskId;
  DateTime startTimestamp;
  DateTime endTimestamp;

  Sprint(
      {required this.id,
      required this.taskId,
      required this.startTimestamp,
      required this.endTimestamp});

  factory Sprint.fromJson(Map<String, dynamic> json) => _sprintFromJson(json);

  Map<String, dynamic> toJson() => _sprintToJson(this);
}

Sprint _sprintFromJson(Map<String, dynamic> json) {
  return Sprint(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      startTimestamp: (json['startTimestamp'] as Timestamp).toDate(),
      endTimestamp: (json['endTimestamp'] as Timestamp).toDate());
}

Map<String, dynamic> _sprintToJson(Sprint instance) => <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'startTimestamp': instance.startTimestamp,
      'endTimestamp': instance.endTimestamp
    };
