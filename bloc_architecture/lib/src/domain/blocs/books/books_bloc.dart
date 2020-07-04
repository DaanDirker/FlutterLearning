import 'package:bloc_architecture/src/data/BooksRepository.dart';
import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:bloc_architecture/src/domain/blocs/books/books_event.dart';
import 'package:bloc_architecture/src/domain/blocs/books/books_state.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

// The BLoC handles events that are dispatched..
// One events can dispatch another event

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  final BooksRepository booksRepository;

  BooksBloc({
    @required this.booksRepository,
  })  : assert(booksRepository != null),
        super(BooksInitial());

  @override
  Stream<BooksState> mapEventToState(BooksEvent event) async* {
    if (event is BooksRequested) {
      yield BooksLoadInProgress();
      try {
        final List<Book> books = await booksRepository.getBooks(event.title);
        yield BooksLoadSuccess(books: books);
      } catch (e) {
        print(e);
        yield BooksLoadFailure();
      }
    }
  }
}
