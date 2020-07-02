import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_todo/src/data/model/Todo.dart';
import 'package:firebase_todo/src/presentation/widgets/TodoList.dart';
import 'package:flutter/material.dart';
import 'package:firebase_todo/src/util/Constants.dart' as Consts;

class TodoScreen extends StatelessWidget {
  final CollectionReference todos =
      Firestore.instance.collection(Consts.FIREBASE_COLLECTION);

  void _addTodo() {
    todos.add({"task": "New taks herrreeee", "done": false});
  }

  void _handleOnTap(Todo todo) {
    todos.document(todo.id).setData({"done": !todo.isDone});
  }

  void _handleOnLongTap(Todo todo) {
    print(todo.toString() + " LONG TAPPED");
  }

  //Parsing is done here for simplicity, should be handled as a stream in domain
  List<Todo> _parseResults(List<DocumentSnapshot> docs) {
    const String firstKey = "task";
    const String secondKey = "done";

    final List<Todo> result = [];
    docs.forEach((e) {
      if (e.data.containsKey(firstKey) && e.data.containsKey(secondKey)) {
        result.add(Todo.fromSnapshot(e));
      }
    });
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0),
        child: StreamBuilder<QuerySnapshot>(
            stream: todos.snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return LinearProgressIndicator();
              return TodoList(_parseResults(snapshot.data.documents),
                  _handleOnTap, _handleOnLongTap);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        onPressed: () => _addTodo(),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32.0,
        ),
      ),
    );
  }
}
