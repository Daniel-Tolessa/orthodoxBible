class Note {
  final int id;
  final String title;
  final String description;

  //Note({required this.id, required this.title, required this.description});
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