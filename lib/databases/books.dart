import 'database_packages.dart';

class BookDatabase {
  late Database _database;

  Future openDb() async {
    _database = await openDatabase(
        join(await getDatabasesPath(), 'books.db'),
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE books(name TEXT PRIMARY KEY,numClicks INTEGER, type TEXT, numChapters INTEGER, bookIndex INTEGER)");
        });
  }

  //insert a book
  Future<int> insertBook(Book book) async {

    //getting a reference to the database
    await openDb();

    return await _database.insert("books", book.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Book>> getRecentBooks() async {
    await openDb();

    final List<Map<String, dynamic>> maps = await _database.query('books');

    return List.generate(maps.length, (i) {
      return Book(
        maps[i]["name"],
        maps[i]["type"],
        maps[i]["bookIndex"],
        maps[i]["numChapters"],
        numClicks: maps[i]["numClicks"],
      );
    });
  }

  Future<int> updateBook(Book book) async {
    await openDb();

    return await _database.update("books", book.toMap(), where: 'bookIndex = ?', whereArgs: [book.bookIndex],);
  }

  Future<void> deleteBooks() async {
    await openDb();
    _database.delete("books");
  }

}
