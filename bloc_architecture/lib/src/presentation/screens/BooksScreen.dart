import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:bloc_architecture/src/domain/blocs/books/books_bloc.dart';
import 'package:bloc_architecture/src/domain/blocs/books/books_event.dart';
import 'package:bloc_architecture/src/domain/blocs/books/books_state.dart';
import 'package:bloc_architecture/src/presentation/widgets/BooksList.dart';
import 'package:bloc_architecture/src/resources/values/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final List<Book> dummyBooks = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BooksBloc>(context).add(BooksRequested(title: "Agathi"));

    return Container(
        margin: EdgeInsets.fromLTRB(
            AppDim.SMALL_100, AppDim.SMALL_50, AppDim.SMALL_100, 0),
        child: BlocBuilder<BooksBloc, BooksState>(builder: (context, state) {
          if (state is BooksInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is BooksLoadInProgress) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is BooksLoadSuccess) {
            return BooksList(books: state.books);
          }
          if (state is BooksLoadFailure) {
            return Center(child: Text("Unable to load books"));
          }
        }));
  }
}
