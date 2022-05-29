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

  factory Sprint.fromJson(Map<String, dynamic> json) {
    return Sprint(
        id: json['id'] as String,
        taskId: json['taskId'] as String,
        startTimestamp: (json['startTimestamp'] as Timestamp).toDate(),
        endTimestamp: (json['endTimestamp'] as Timestamp).toDate());
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'taskId': taskId,
      'startTimestamp': startTimestamp,
      'endTimestamp': endTimestamp
    };
  }

  factory Sprint.fromSnapshot(DocumentSnapshot snapshot) {
    final sprint = Sprint.fromJson(snapshot.data() as Map<String, dynamic>);
    return sprint;
  }
}
