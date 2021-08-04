import 'widgets/home_widgets.dart';

///Provides Search functionality on the homepage Appbar
class BookSearch extends SearchDelegate<Book> {

  List<Book> suggestion = [];
  // function made to fetch oldTestaments books from json
  Future<List<Book>> fetchBooks (BuildContext context) async {
    final jsonstring = await DefaultAssetBundle.of(context).loadString("json/bookjson.json");
    return bookFromJson(jsonstring);
  }

  // function made to fetch newTestaments books from json
  Future<List<Book>> fetchNewTesBooks (BuildContext context) async {
    final jsonstring = await DefaultAssetBundle.of(context).loadString("json/newTestamentJson.json");
    return bookFromJson(jsonstring);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.delete),onPressed: () {
      query = "";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //close(context, buildResults);
        //TODO fix onPressed for build leading section
      },);
  }


  @override
  Widget buildResults(BuildContext context) {
    //TODO ignore it
    throw ("");
  }

  ///To build suggestions both the oldTestament and newTestament
  ///  were merged together as a list
  @override
  Widget buildSuggestions(BuildContext context) {

    //combines the old and new Testament books
    List<Book> combo = [];
    List<Book> oldTestaments = [];
    List<Book> newTestaments = [];

    fetchBooks(context).then((returnedList) {
      suggestion = returnedList.where((book) =>
          book.name.toLowerCase().contains(query.toLowerCase())).toList();
    });

    fetchNewTesBooks(context).then((returnedList) {
      suggestion = suggestion + returnedList.where((book) =>
          book.name.toLowerCase().contains(query.toLowerCase())).toList();
    });

    combo = oldTestaments + newTestaments;

    return ListView.builder(
        itemCount: suggestion.length,
        itemBuilder: (builder, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      Chapter(book: suggestion[index])));
            },
            title: Text(suggestion[index].name),
            leading: Icon(Icons.book),
          );
        }
    );
  }
}