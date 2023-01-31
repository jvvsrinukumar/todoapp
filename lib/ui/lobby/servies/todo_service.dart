import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todoapp/entites/users.dart';
import 'package:todoapp/ui/lobby/servies/firebase_service.dart';


class TodoService extends FirebaseService {
  TodoService();

  @override
  CollectionReference getCollectionReference() {
    return FirebaseService.db
        .collection("tasks")
        .doc(Users().getID())
        .collection("tasks");
  }

  @override
  String getID() {
    return getCollectionReference().doc().id;
  }

  Stream<QuerySnapshot> getTodoListOfCurrentUser() {
    return getCollectionReference().snapshots();
  }
}