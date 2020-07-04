import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => [];
}

class BooksInitial extends BooksState {}

class BooksLoadInProgress extends BooksState {}

class BooksLoadSuccess extends BooksState {
  final List<Book> books;

  BooksLoadSuccess({
    @required this.books,
  }) : assert(books != null);

  @override
  List<Object> get props => [books];
}

class BooksLoadFailure extends BooksState {}
