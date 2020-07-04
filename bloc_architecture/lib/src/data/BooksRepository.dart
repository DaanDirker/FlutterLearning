import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:bloc_architecture/src/data/net/BooksApiClient.dart';
import 'package:flutter/material.dart';

class BooksRepository {
  final BooksApiClient booksApiClient;

  BooksRepository({
    @required this.booksApiClient,
  }) : assert(booksApiClient != null);

  Future<List<Book>> getBooks(String title) async {
    return await booksApiClient.fetchBooks(title);
  }
}
