import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/sprint.dart';

class SprintsProvider with ChangeNotifier {
  String uid = 'iNK2qbHd2orA4mSjjzN1';
  String _selectedId = '';

  String get selectedId => _selectedId;

  final CollectionReference collection = FirebaseFirestore.instance
      .collection('users')
      .doc('iNK2qbHd2orA4mSjjzN1') //should be uid here
      .collection('sprints');

  Stream<QuerySnapshot> getSprintsStream() {
    return collection.snapshots();
  }

  void saveSprint(String userId, String taskId) {
    Sprint sprint = Sprint(
        id: '$userId@${DateTime.now()}',
        taskId: taskId,
        startTimestamp: DateTime.now(),
        endTimestamp: DateTime.now());
    var sprintJson = sprint.toJson();
    collection.doc(sprint.id).set(sprintJson);
    FirebaseFirestore.instance
        .collection('users')
        .doc('iNK2qbHd2orA4mSjjzN1')
        .set({'currentSprint': sprint.id}, SetOptions(merge: true));
    FirebaseFirestore.instance
        .collection('users')
        .doc('iNK2qbHd2orA4mSjjzN1')
        .set({'currentTask': sprint.taskId}, SetOptions(merge: true));
  }

  void updateSprint(String userId, Sprint sprint) {
    var sprintJson = sprint.toJson();
    collection.doc(sprintJson['id']).set(sprint.toJson());
  }

  // Stream<DocumentSnapshot<Object?>> getSprintStream(String id) {
  //   return collection.doc(id).snapshots();
  // }

  Future<DocumentSnapshot<Object?>> getSprint(String id) {
    return collection.doc(id).get();
  }

  Stream<QuerySnapshot<Object?>> getSprintByDateStream(DateTime dateTime) {
    DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return collection
        .where('startTimestamp',
            isLessThanOrEqualTo: date.add(const Duration(days: 1)))
        .where('endTimestamp', isGreaterThanOrEqualTo: date)
        .snapshots();
  }

  void tapItem(String id) {
    _selectedId = id;
    notifyListeners();
  }
}
