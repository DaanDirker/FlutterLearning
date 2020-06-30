import 'package:firebase_todo/src/data/model/Todo.dart';
import 'package:firebase_todo/src/presentation/widgets/TodoList.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Temporary
    final List<Todo> todos = [
      Todo("First", true),
      Todo("Second", false),
      Todo("Third", true),
    ];

    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 0),
        child: TodoList(todos),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 8.0,
        onPressed: null,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32.0,
        ),
      ),
    );
  }
}
