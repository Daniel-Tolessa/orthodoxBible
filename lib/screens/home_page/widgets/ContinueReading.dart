import 'home_widgets.dart';

class Kontinue_reading extends StatefulWidget {
  @override
  _Kontinue_readingState createState() => _Kontinue_readingState();
}

class _Kontinue_readingState extends State<Kontinue_reading> {
  @override

  Widget build(BuildContext context) {
    setState(() {
      //TODO figure out what goes in here so it can update automatically
    });
    final BookDatabase bookdatabase = new BookDatabase();
    Book? book;
    return Container(
        color: Colors.black,
        height: 180,
        child: FutureBuilder(
            future: bookdatabase.getRecentBooks(),
            builder: (context, AsyncSnapshot<List<Book>> snapshot) {

              if (snapshot.hasData) {
                    List<Book>? reBooks = snapshot.data;

                    ///Render only the top 5 books
                    if (snapshot.data!.length >= 5) {
                      reBooks = snapshot.data!.getRange(snapshot.data!.length - 5, snapshot.data!.length).toList();
                    }
                    return ListView.builder(
                        addAutomaticKeepAlives: false,
                        reverse: true,
                        shrinkWrap: true,//snapshot.data.length > 5 ? 5: snapshot.data.length
                        itemCount: reBooks!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          Book abook = reBooks![index];
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) =>
                                      Chapter(book: abook)));
                              bookdatabase.insertBook(book!);
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