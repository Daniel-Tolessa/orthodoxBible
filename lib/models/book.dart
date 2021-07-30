import 'dart:convert';

// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);


List<Book> bookFromJson(String str) => List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

String bookToJson(List<Book> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Book {
  Book(
    this.name,
    this.type,
    this.bookIndex,
    this.numChapters,
    {this.numClicks = 0}
      //TODO check if numclicks resets to 0 for every book
      );

  String name;
  String type;
  int bookIndex;
  int numChapters;
  int numClicks = 0;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    json["name"],
    json["type"],
    json["bookIndex"],
    json["numChapters"],
    numClicks: json["numClicks"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "type": type,
    "bookIndex": bookIndex,
    "numChapters": numChapters,
    "numClicks": numClicks,
  };

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "type": type,
      "bookIndex": bookIndex,
      "numChapters": numChapters,
      "numClicks": numClicks,
    };
  }

  @override
  String toString() {
    return "BookIndex: ${this.bookIndex}, NAMEE: ${this.name}, # Chapters: ${this.numChapters}, NumClicks: ${this.numClicks}";
  }
}