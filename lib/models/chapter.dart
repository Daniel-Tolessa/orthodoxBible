import 'model_libraries.dart';

/*
    Book model class && Writing files to the local device
       to store information
 */
class Chapter extends StatelessWidget {

  final Book? book;

  //this.book -- book required to show relevant number of chapters
  Chapter({@required this.book});


  /*
    Finds the current local path
    helps navigate where to store the file
   */
  Future<String> get localpath async {
    final dir = await getExternalStorageDirectory();
    return dir!.path;
  }

  /*
     Gets a reference to the file's location
   */
  Future<File> get localFile async {
    final path = await localpath;
    return File("$path/chapters.json");
  }

  /*
     adds a given book to the local disk
     //TODO figure out usability of writebook in other classes
   */
  void writeBook(Book book) async {
    final file = await localFile;

    String json = jsonEncode(book);
    file.writeAsString(json);
  }


  ///Build a listview of the relevant chapters for each book selected
  ///
  @override
  Widget build(BuildContext context) {
    final BookDatabase bookdatabase = new BookDatabase();

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(book!.name),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black38,
        child: ListView.separated(
            itemCount: book!.numChapters,
            separatorBuilder: (BuildContext context, int index) => Divider(thickness: 2.5, height: 5, color: Colors.white,),
            itemBuilder: (Context, index) {
              return ListTile(
                trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                tileColor: Colors.black,
                enabled: true,
                title: Text("Chapter " + (index + 1).toString(), style: TextStyle(color: Colors.white),),

                onTap: () {
                  writeBook(book!);
                  bookdatabase.insertBook(book!);
                  book!.numClicks++;
                  bookdatabase.updateBook(book!);
                  Navigator.push(context,
                      //TODO delete the extra comment
                      MaterialPageRoute(//TextScreen(textLocation: "texts/Genesis/chapter1/hello.txt")
                        builder: (context) => TextScreen("text_files/old/Genesis/chapter1.txt"),
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