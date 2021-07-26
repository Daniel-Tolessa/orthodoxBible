import 'general_widgets.dart';

Container BookCover(Book book, int counter) {
  return Container(
    margin: EdgeInsets.only(right: 10, top: 10),
    width: 110,

    decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage("assets/" + book.type + "/" + book.type.toLowerCase() +  book.bookIndex.toString() + ".png"),
            fit: BoxFit.fill
        )
    ),
  );
}