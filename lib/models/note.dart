class Note {
  final int id;
  final String title;
  final String description;

  Note({required this.id, required this.title, required this.description});

  factory Note.fromMap(Map<String, dynamic> json) => new Note(
      id: json['id'],
      title: json['title'],
      description: json['description']
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}