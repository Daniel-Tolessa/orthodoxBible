import 'general_widgets.dart';
class GridViewScreen extends StatelessWidget {

  late String jsonLocation;
  late String type_title;

  /// @jsonLocation: provides address and information for all the books including
  ///                  new and old testament
  /// @title: Whether it's an old or new testament
  ///

  GridViewScreen({required this.jsonLocation, required this.type_title});

  Future<List<Book>> fetchBooks (BuildContext context) async {//"json/bookjson.json
    final jsonstring = await DefaultAssetBundle.of(context).loadString(jsonLocation);
    return bookFromJson(jsonstring);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: Text(type_title, style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
        child: FutureBuilder(
            future: fetchBooks(context),
            builder: (context, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 5,
                      childAspectRatio: (2 / 2.5),
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Book abook = snapshot.data![index];
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                        ),
                        // elevation: 50.0,
                        // color: Colors.white30,
                        // highlightElevation: 20,
                        // padding: EdgeInsets.only(left: 5.0),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) =>
                                  Chapter(book: abook)));
                        },
                        child: BookCover(abook, index),
                      );
                    }
                );
              }
              return CircularProgressIndicator();
            }
        ),
      ),
    );
  }
}