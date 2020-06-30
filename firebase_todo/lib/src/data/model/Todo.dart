class Todo {
  final String text;
  bool isDone;

  void toggleDone() => isDone = !isDone;

  Todo(this.text, this.isDone);
}
