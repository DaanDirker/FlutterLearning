import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// One of these events gets dispatched from the UI, returning a state

abstract class BooksEvent extends Equatable {
  const BooksEvent();
}

class BooksRequested extends BooksEvent {
  final String title;

  BooksRequested({
    @required this.title,
  }) : assert(title != null);

  @override
  List<Object> get props => [title];
}
