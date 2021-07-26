import 'package:flutter/material.dart';

class NewTestaments extends StatelessWidget {

  // function made to fetch from json
  Future<List<Book>> fetchBooks (BuildContext context) async {
    final jsonstring = await DefaultAssetBundle.of(context).loadString("json/newTestamentJson.json");
    return bookFromJson(jsonstring);
  }

  @override
  Widget build(BuildContext context) {
    final BookDatabase bookdatabase = new BookDatabase();
    return Container(
        color: Colors.black,
        height: 200,
        child: FutureBuilder(
            future: fetchBooks(context),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  //addAutomaticKeepAlives: false,
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Book abook = snapshot.data[index];
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Colors.black,
                            padding: EdgeInsets.fromLTRB(20, 0, 3, 10)
                        ),
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
        )

    );
  }
}