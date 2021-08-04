import 'database_packages.dart';

/*
 * Book Database
 */

class BookDatabase {
  late Database _database;

  /*
      Opens a connection to the database - books.db &&
      It creates books table with its properties as columns
   */
  Future openDb() async {
    _database = await openDatabase(
        join(await getDatabasesPath(), 'books.db'),
        version: 1,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE books(name TEXT PRIMARY KEY,numClicks INTEGER, type TEXT, numChapters INTEGER, bookIndex INTEGER)");
        });
  }

  /*
      Inserts a given Book to the database
      If there is a book that exists with that name it will be replaced
   */
  Future<int> insertBook(Book book) async {

    //getting a reference to the database
    await openDb();

    return await _database.insert("books", book.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /*
      returns query of all the books in the database
   */
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

  /*
    updates a given book with a matching name
   */
  Future<int> updateBook(Book book) async {
    await openDb();

    return await _database.update("books", book.toMap(), where: 'name = ?', whereArgs: [book.name],);
  }

  /*
    Completely removes all the books from the database
     Primarily used for testing reasons -- not applicable in actual production
   */
  Future<void> deleteBooks() async {
    await openDb();
    _database.delete("books");
  }

}
