import 'database_packages.dart';

/*
    Note Database
 */
class NoteDatabase {

  Database? _database;

  /*
      Opens a connection to the database - notes.db &&
      It creates notes table with its properties as columns
   */

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

  /*
      Inserts a given Note to the database
      If there is a Note that exists with that name it will be replaced -- updated
   */
  Future<int> addNote(Note note) async {
    await openDb();
    return await _database!.insert("notes", note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /*
      returns query of all the notes in the database
   */
  Future<List<Note>> getNotes() async {
    await openDb();

    final List<Map<String, dynamic>> maps = await _database!.query('notes');

    List<Note> allNotes = List.generate(maps.length, (i) {
      return Note(
          maps[i]['title'],
          maps[i]['description'],
          id: maps[i]['id'],
      );
    });

    //reversed so that the recent notes can show on top
    //       when using listview widget
    allNotes.reversed;

    return allNotes;
  }

  /*
    updates a given note with a matching id
   */
  Future<int> updateNote(Note note) async {
    await openDb();

    return await _database!.update("notes", note.toMap(), where: 'id = ?', whereArgs: [note.id]);
  }

  /*
      Deletes only one note that matches the id from the database
   */
  Future<int> deleteNote(int id) async {
    await openDb();

    return await _database!.delete("notes", where: 'id = ?', whereArgs: [id]);
  }

  /*
    Completely removes all the notes from the database
     Primarily used for testing reasons -- not applicable in actual production
   */
  Future<void> deleteAllNotes() async {
    await openDb();

    _database!.delete("notes");
  }
}