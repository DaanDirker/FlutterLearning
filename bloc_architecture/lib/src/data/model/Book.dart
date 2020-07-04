import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Book extends Equatable {
  final String id;
  final String href;
  final String title;
  final List<String> authors;
  final String publisher;
  final String publishedData;
  final String description;

  Book({
    @required this.id,
    @required this.href,
    @required this.title,
    @required this.authors,
    @required this.publisher,
    @required this.publishedData,
    @required this.description,
  });

  List<Object> get props => [id];

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      href: json['selfLink'] ?? "Unknown",
      title: json['volumeInfo']['title'] ?? "Unknown",
      authors: ["Unknown"],
      publisher: json['volumeInfo']['publisher'] ?? "Unknown",
      publishedData: json['volumeInfo']['publishedDate'] ?? "Unknown",
      description: json['volumeInfo']['description'] ?? "Unknown",
    );
  }
}
