import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/task.dart';

class TasksProvider with ChangeNotifier {
  String _selectedId = '';

  String get selectedId => _selectedId;

  final CollectionReference collection = FirebaseFirestore.instance
      .collection('users')
      .doc('iNK2qbHd2orA4mSjjzN1') //should be uid here
      .collection('tasks');

  Stream<QuerySnapshot> getTasksStream() {
    return collection.snapshots();
  }

  void saveTask(String userId, Task task) {
    task.id = '$userId@${DateTime.now()}';
    var taskJson = task.toJson();
    collection.doc(task.id).set(taskJson);
  }

  void updateTask(String userId, Task task) {
    var taskJson = task.toJson();
    collection.doc(taskJson['id']).set(task.toJson());
  }

  // Stream<DocumentSnapshot<Object?>> getTaskStream(String id) {
  //   return collection.doc(id).snapshots();
  // }

  Future<DocumentSnapshot<Object?>> getTask(String id) {
    return collection.doc(id).get();
  }

  Stream<QuerySnapshot<Object?>> getTaskByProjectStream(String id) {
    return collection.where('projectId', isEqualTo: id).snapshots();
  }

  Stream<QuerySnapshot<Object?>> getTaskByDateStream(DateTime dateTime) {
    DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
    return collection
        .where('scheduledDateTime',
            isLessThanOrEqualTo: date.add(const Duration(days: 1)))
        .where('scheduledDateTime', isGreaterThanOrEqualTo: date)
        .snapshots();
  }

  void addSprint(String id, String sprintPath) {
    collection.doc(id).update({
      'sprints': FieldValue.arrayUnion([sprintPath])
    });
  }

  void tapItem(String id) {
    _selectedId = id;
    notifyListeners();
  }
}
