import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String id;
  final String text;
  bool isDone;

  void toggleDone() => isDone = !isDone;

  Todo(this.id, this.text, this.isDone);

  factory Todo.fromSnapshot(DocumentSnapshot doc) {
    return Todo(doc.data["documentID"], doc.data["task"], doc.data["done"]);
  }
}
