import 'widgets/home_widgets.dart';

class BookSearch extends SearchDelegate<Book> {

  List<Book> suggestion = [];
  // function made to fetch from json
  Future<List<Book>> fetchBooks (BuildContext context) async {
    final jsonstring = await DefaultAssetBundle.of(context).loadString("json/bookjson.json");
    return bookFromJson(jsonstring);
  }

  // function made to fetch from json
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
        close(context, null);
      },);
  }


  @override
  Widget buildResults(BuildContext context) {
    //TODO ignore it
    throw ("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    List<Book> combo = [];
    List<Book> oldTestaments = [];
    List<Book> newTestaments = [];
    //combine old and new Testament books
    fetchBooks(context).then((returnedList) {
      //oldTestaments = returnedList.toList();
      suggestion = returnedList.where((book) =>
          book.name.toLowerCase().contains(query.toLowerCase())).toList();
    });

    fetchNewTesBooks(context).then((returnedList) {
      // newTestaments = returnedList.toList();
      suggestion = suggestion + returnedList.where((book) =>
          book.name.toLowerCase().contains(query.toLowerCase())).toList();
    });

    //suggestion.shuffle();
    //suggestion = suggestion.sublist(1, 5);

    combo = oldTestaments + newTestaments;
    print (combo);
    // suggestion = combo.where((book) =>
    //         book.name.toLowerCase().contains(query.toLowerCase())).toList();

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