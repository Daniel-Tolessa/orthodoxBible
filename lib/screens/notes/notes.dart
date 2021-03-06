import 'package:orthodoxbible/screens/notes/widgets/note_widgets.dart';

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}


class _NotesState extends State<Notes> {
  final NoteDatabase notedatabase = new NoteDatabase();
  @override
  Widget build(BuildContext context) {

    setState(() {
      //TODO figure out how to make it update when any change occurs
    });

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text("My Notes"),
        centerTitle: true,
      ),
      //TODO favorite color
      backgroundColor: Color(0xFF262b2d),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder(
                future: notedatabase.getNotes(),
                builder: (context, AsyncSnapshot<List<Note>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        reverse: true,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (builder, index) {
                          Note note = snapshot.data![index];
                          return Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[800],
                                      borderRadius: BorderRadius.circular(15.0)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.0, top: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(note.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                        SizedBox(height: 10.0,),
                                        Text(note.description, style: TextStyle(color: Colors.white),),
                                        Row(
                                          children: [
                                            Icon(Icons.edit, color: Colors.blue,),
                                            Icon(Icons.delete, color: Colors.red,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                          ////
                        }
                    );
                  }
                  return Center(child: Text("No notes in here mate", style: TextStyle(color: Colors.white),));
                }
            )],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.orangeAccent,
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context) =>  AddNotePage()));
      //     },
      //     child: Icon(Icons.add, color: Colors.white,)
      // ),
    );
  }
}