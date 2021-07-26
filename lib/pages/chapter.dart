import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';
class Chapter extends StatelessWidget {

  Book book;

  Chapter({@required this.book});

  Future<String> get localpath async {
    final dir = await getExternalStorageDirectory();
    return dir.path;
  }

  Future<File> get localFile async {
    final path = await localpath;
    return File("$path/ffffff.json");
  }

  void writeBook(Book book) async {
    final file = await localFile;

    String json = jsonEncode(book);
    file.writeAsString(json);
  }

  @override
  Widget build(BuildContext context) {
    final BookDatabase bookdatabase = new BookDatabase();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(book.name),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black38,
        child: ListView.separated(
            itemCount: book.numChapters,
            separatorBuilder: (BuildContext context, int index) => Divider(thickness: 2.5, height: 5, color: Colors.white,),
            itemBuilder: (Context, index) {
              return ListTile(
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                tileColor: Colors.black,
                enabled: true,
                title: Text("Chapter " + (index + 1).toString(), style: TextStyle(color: Colors.white),),

                onTap: () {
                  writeBook(book);
                  bookdatabase.insertBook(book);
                  book.numClicks++;
                  bookdatabase.updateBook(book);
                  //print(writeBook(book));
                  Navigator.push(context,
                      MaterialPageRoute(//TextScreen(textLocation: "texts/Genesis/chapter1/hello.txt")
                        builder: (context) => TextScreen(textLocation: "texts/Genesis/chapter1/hello.txt"),
                      )
                  );

                },
              );
            }
        ),
      ),
    );
  }
}

class noIdea extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Yellow"),),
    );
  }
}