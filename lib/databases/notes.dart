import 'database_packages.dart';
class NoteDatabase {

  Database? _database;

  Future openDb() async {
    _database = await openDatabase(
        join (await getDatabasesPath(), 'notes.db'),
        version: 1,
        onCreate: (db, version) async {
          return db.execute  (
            'CREATE TABLE notes(id INTEGER PRIMARY KEY autoincrement, title TEXT, description TEXT)',
          );
        }
    );
  }

  Future<int> addNote(Note note) async {
    await openDb();
    return await _database!.insert("notes", note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> getNotes() async {
    await openDb();

    final List<Map<String, dynamic>> maps = await _database!.query('notes');

    List<Note> allNotes = List.generate(maps.length, (i) {
      return Note(
          id: maps[i]['id'],
          title: maps[i]['title'],
          description: maps[i]['description']
      );
    });

    allNotes.reversed;

    return allNotes;
  }

  Future<int> updateNote(Note note) async {
    await openDb();

    return await _database!.update("notes", note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  Future<int> deleteNote(int id) async {
    await openDb();

    return await _database!.delete("notes", where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAllNotes() async {
    await openDb();

    _database!.delete("notes");
  }

}