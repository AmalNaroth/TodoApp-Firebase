import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:todoapp_project/models/todomodel.dart';

class AddToFireBase {
  FirebaseFirestore db = FirebaseFirestore.instance;
  String retrunValue="";
  Future<String> datasAddToFirebase(
      {required String taskTitle,
      required String taskDescripction,
      required bool checkedBox}) async {
    try {
      TodoModel _tododetails = TodoModel(
          taskTitle: taskTitle,
          taskDescripction: taskDescripction,
          ckeckedBox: checkedBox,
          dateAndTime: DateTime.now().toString());
      await db
          .collection("TodoUserList")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("TodoItems")
          .add(_tododetails.toMap());
          retrunValue="Success";
    } catch (err) {
      retrunValue=err.toString();
    }
    return retrunValue;
  }
}
