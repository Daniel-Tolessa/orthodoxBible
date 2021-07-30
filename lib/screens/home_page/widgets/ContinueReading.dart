import 'home_widgets.dart';

class Kontinue_reading extends StatefulWidget {
  @override
  _Kontinue_readingState createState() => _Kontinue_readingState();
}

class _Kontinue_readingState extends State<Kontinue_reading> {
  @override

  Widget build(BuildContext context) {
    setState(() {
      //TODO figure out what goes in here
    });
    final BookDatabase bookdatabase = new BookDatabase();
    Book book;
    List<Book> recentBooks;
    Future<List<Book>> fetchBooks (BuildContext context) async {
      final jsonstring = await DefaultAssetBundle.of(context).loadString("json/ContinueReading.Json");
      return bookFromJson(jsonstring);
    }
    return Container(
        color: Colors.black,
        height: 180,
        child: FutureBuilder(
            future: bookdatabase.getRecentBooks(),
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                List<Book>? reBooks = snapshot.data as List<Book>?;
                // List<Book> copyHold = snapshot.data;
                // if (snapshot.data.length > 5) {
                //   copyHold = snapshot.data.getRange(0, 4);
                // }
                if (snapshot.data!.length >= 5) {
                  reBooks = snapshot.data.getRange(snapshot.data.length - 5, snapshot.data.length).toList();
                }
                return ListView.builder(
                  //addAutomaticKeepAlives: false,
                    reverse: true,
                    shrinkWrap: true,//snapshot.data.length > 5 ? 5: snapshot.data.length
                    itemCount: reBooks.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Book abook = reBooks[index];
                      return ElevatedButton(
                        // elevation: 30.0,
                        // color: Colors.black,
                        // //color: Colors.white,
                        // padding: EdgeInsets.only(left: 20),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  Chapter(book: abook)));
                          bookdatabase.insertBook(book);
                          book.numClicks++;
                          bookdatabase.updateBook(book);
                        },
                        child: BookCover(abook, index),
                      );
                    }
                );
              }
              return Container(child: Text("nothing yet", style: TextStyle(color: Colors.white),),);
            }
        )

    );

  }
}