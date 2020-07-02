import 'package:firebase_todo/src/data/model/Todo.dart';
import 'package:firebase_todo/src/presentation/widgets/TodoListItem.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  TodoList(this.todos, this.onTap, this.onLongTap);
  final List<Todo> todos;
  final Function(Todo todo) onTap;
  final Function(Todo todo) onLongTap;

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final List<Todo> todos = widget.todos;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            margin: EdgeInsets.only(bottom: 2.0),
            child: TodoListItem(todos[index], widget.onTap(todos[index]),
                widget.onLongTap(todos[index])));
      },
    );
  }
}
