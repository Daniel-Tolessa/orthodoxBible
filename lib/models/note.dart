/*
  Note model class
 */
class Note {
  final int id;
  final String title;
  final String description;

  //optional id value with a default value of 0
  Note(this.title, this.description, {this.id = 0});

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
      json['description'],
      json['title'],
      id : json['id']
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}