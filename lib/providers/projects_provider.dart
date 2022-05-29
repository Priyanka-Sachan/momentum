import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:momentum/models/project.dart';

class ProjectsProvider with ChangeNotifier {
  String uid='iNK2qbHd2orA4mSjjzN1';
  String _selectedId = '';

  String get selectedId => _selectedId;

  final CollectionReference collection = FirebaseFirestore.instance
      .collection('users')
      .doc('iNK2qbHd2orA4mSjjzN1') //should be uid here
      .collection('projects');

  Stream<QuerySnapshot> getProjectsStream() {
    return collection.snapshots();
  }

  void saveProject(String userId, Project project) {
    project.id='$userId@${DateTime.now()}';
    var projectJson = project.toJson();
    collection.doc(project.id).set(projectJson);
  }

  void updateProject(String userId, Project project) {
    var projectJson = project.toJson();
    collection.doc(projectJson['id']).set(project.toJson());
  }

  Stream<DocumentSnapshot<Object?>> getProjectStream(String id) {
    return collection.doc(id).snapshots();
  }

  void addTask(String id, String taskPath) {
    collection.doc(id).update({
      'tasks': FieldValue.arrayUnion([taskPath])
    });
  }

  void tapItem(String id) {
    _selectedId = id;
    notifyListeners();
  }
}
