
import '../homepage.dart';
import 'home_widgets.dart';
class Kontinue_reading extends StatefulWidget {
  @override
  _Kontinue_readingState createState() => _Kontinue_readingState();
}

class _Kontinue_readingState extends State<Kontinue_reading> {
  @override
  late int length;

  Widget build(BuildContext context) {
    setState(() {
      //TODO figure out what goes in here so it can update automatically
    });
    final BookDatabase bookdatabase = new BookDatabase();
    Book? book;
    return FutureBuilder(
            future: bookdatabase.getRecentBooks(),
            builder: (context, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.hasData) {
                    List<Book>? reBooks = snapshot.data;

                    length = snapshot.data!.length;

                    //determines whether to show continueReading or not
                      //on the homepage depending on the length of database
                    if (length > 0) {
                          ///Render only the top 5 books
                          if (length >= 5) {
                            reBooks = snapshot.data!
                                .getRange(length - 5, length).toList();
                          }
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Heading("Continue Reading"),
                                  SizedBox(width: 60,),
                                  Text(
                                    "Filter by",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.filter_list_outlined, color: Colors.white,),
                                    onPressed: () {},
                                  ),
                                ],
                              ),


                              Container(
                                height: 180,
                                child: ListView.builder(
                                  //addAutomaticKeepAlives: false,
                                  reverse: true,
                                  shrinkWrap: true,
                                  //snapshot.data.length > 5 ? 5: snapshot.data.length
                                  itemCount: reBooks!.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    Book abook = reBooks![index];
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                      ),
                                      onPressed: () {
                                        //TODO next
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) =>
                                              TextScreen("text_files/" + abook.type.toLowerCase() + "/" + abook.name + "/chapter" + abook.recentchapter.toString() + ".txt")));
                                        print ("text_files/" + abook.type.toLowerCase() + "/" + abook.name + "/chapter" + abook.recentchapter.toString() + ".txt");
                                        bookdatabase.insertBook(abook);
                                        bookdatabase.updateBook(abook);
                                      },
                                      child: BookCover(abook, index),
                                    );
                                  }
                                 ),
                              )
                            ],
                          );
                    }
                    else {
                      return SizedBox(width: 0.0, height: 0.0,);
                    }
              }
              return Container(child: Text("Loading..", style: TextStyle(color: Colors.white),),);
            }
        );
  }
}

