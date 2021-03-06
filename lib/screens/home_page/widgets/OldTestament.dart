import 'home_widgets.dart';

class OldTestaments extends StatelessWidget {
  // function made to fetch from json
  Future<List<Book>> fetchBooks (BuildContext context) async {
    final jsonstring = await DefaultAssetBundle.of(context).loadString("json/oldbooks.json");
    return bookFromJson(jsonstring);
  }
  int _herocounter = 0;
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    _herocounter++;
    final BookDatabase bookdatabase = new BookDatabase();

    return Container(
        color: Colors.black,
        height: 200,
        child: FutureBuilder(
            future: fetchBooks(context),
            builder: (context, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    addAutomaticKeepAlives: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Book abook = snapshot.data![index];
                      return Hero(
                        tag: "book$index",
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          onPressed: () {
                            //bookdatabase.deleteBooks();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) =>
                                    Chapter(book: abook)));
                          },
                          child: BookCover(abook, index),
                        ),
                      );
                    }
                );
              }
              return CircularProgressIndicator();
            }
        )
    );
  }
}