import 'package:firebase_todo/src/data/model/Todo.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  TodoListItem(this.todo);
  final Todo todo;

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  Todo todo;

  void _toggleDone(Todo todo) {
    todo.toggleDone();
    setState(() {
      this.todo = todo;
    });
  }

  @override
  Widget build(BuildContext context) {
    todo = widget.todo;
    return GestureDetector(
      onTap: () => _toggleDone(todo),
      child: Container(
        height: 64,
        child: Card(
          shape: ContinuousRectangleBorder(),
          elevation: 1.0,
          child: Container(
            margin: EdgeInsets.only(left: 32.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  todo.text,
                  style: TextStyle(
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,
                    fontSize: 16.0,
                  ),
                ),
                Checkbox(
                    value: todo.isDone, onChanged: (_) => _toggleDone(todo)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
