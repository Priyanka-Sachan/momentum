import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  String uid = 'iNK2qbHd2orA4mSjjzN1';

  final DocumentReference documentReference = FirebaseFirestore.instance
      .collection('users')
      .doc('iNK2qbHd2orA4mSjjzN1');

  String username = "Anonymous";
  String currentSprintId = "";
  String currentTaskId = "";

  void initProfile() async {
    documentReference.snapshots().listen((documentSnapshots) {
      if (documentSnapshots.exists) {
        Map<String, dynamic> data =
            documentSnapshots.data() as Map<String, dynamic>;
        username = documentSnapshots['username'];
        currentSprintId = documentSnapshots['currentSprint'];
        currentTaskId = documentSnapshots['currentTask'];
        notifyListeners();
      }
    });
  }

  void saveProfile(String userId, String username) {
    documentReference.set({'username': username}, SetOptions(merge: true));
  }

  void stopCurrentSprint(String userId) {
    // FirebaseFirestore.instance
    //     .collection('users')
    //     .doc('iNK2qbHd2orA4mSjjzN1') //should be uid here
    //     .collection('sprints')
    //     .doc(currentSprintId)
    //     .set({'endTimestamp': DateTime.now()}, SetOptions(merge: true));
    documentReference.set({'currentSprint': ""}, SetOptions(merge: true));
    currentSprintId = "";
    documentReference.set({'currentTask': ""}, SetOptions(merge: true));
    currentTaskId = "";
    notifyListeners();
  }

  bool getCurrentStatus() {
    return currentSprintId.isNotEmpty;
  }
}
