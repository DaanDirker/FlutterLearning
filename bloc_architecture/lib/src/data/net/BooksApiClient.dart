import 'dart:convert';

import 'package:bloc_architecture/src/data/model/Book.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BooksApiClient {
  final String _baseUrl = "https://www.googleapis.com/books/v1";
  final http.Client httpClient;

  BooksApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<List<Book>> fetchBooks(String title) async {
    final String url = "$_baseUrl/volumes?q=$title";
    final response = await this.httpClient.get(url);

    if (response.statusCode != 200) {
      throw Exception("Unable to get books for $title");
    }
    final body = jsonDecode(response.body)['items'];

    final List<Book> result = [];
    body.forEach((item) => result.add(Book.fromJson(item)));
    return result;
  }
}
