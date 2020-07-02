import 'package:firebase_todo/src/data/model/Todo.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatefulWidget {
  TodoListItem(this.todo, this.onTap, this.onLongTap);
  final Todo todo;
  final Function(Todo todo) onTap;
  final Function(Todo todo) onLongTap;

  @override
  _TodoListItemState createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  Todo todo;
  @override
  Widget build(BuildContext context) {
    todo = widget.todo;
    return GestureDetector(
      onTap: () => widget.onTap(todo),
      onLongPress: () => widget.onLongTap(todo),
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
                    value: todo.isDone, onChanged: (_) => widget.onTap(todo)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
