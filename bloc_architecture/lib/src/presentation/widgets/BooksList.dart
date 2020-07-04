import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:bloc_architecture/src/presentation/widgets/BooksListItem.dart';
import 'package:flutter/material.dart';

class BooksList extends StatefulWidget {
  BooksList({@required this.books});
  final List<Book> books;

  @override
  _BooksListState createState() => _BooksListState();
}

class _BooksListState extends State<BooksList> {
  @override
  Widget build(BuildContext context) {
    final List<Book> books = widget.books;

    return ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          return BooksListItem(book: books[index]);
        });
  }
}
