import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:flutter/material.dart';

class BooksListItem extends StatefulWidget {
  BooksListItem({@required this.book});
  final Book book;

  @override
  _BooksListItemState createState() => _BooksListItemState();
}

class _BooksListItemState extends State<BooksListItem> {
  @override
  Widget build(BuildContext context) {
    final Book book = widget.book;
    return Card(
      child: ListTile(
        leading: Icon(Icons.book),
        title: Text(book.title),
        subtitle: Text(book.description),
        trailing: Icon(Icons.dehaze),
      ),
    );
  }
}
