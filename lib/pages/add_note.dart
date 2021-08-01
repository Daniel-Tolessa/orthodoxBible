import 'package:orthodoxbible/pages/pages_widgets.dart';
class AddNotePage extends StatefulWidget {
  @override
  _AddNotePageState createState() => _AddNotePageState();
  //changed type from Final to late so the same text would be able to updated
  late String edited_text;
  late String edited_description;
  AddNotePage({this.edited_text = "", this.edited_description = ""});
}

class _AddNotePageState extends State<AddNotePage> {
  final NoteDatabase notedatabase = new NoteDatabase();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late String title;
  late String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[700],
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.save, color: Colors.redAccent,),
        //     //TODO saves the given note
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Enter title",
                fillColor: Colors.white,
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
              ),
              maxLength: 20,
            ),
            Expanded(
              child: TextField(
                controller: descriptionController,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: "Enter description",
                  border: InputBorder.none,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            title = titleController.text;
            description = descriptionController.text;
          });
          Note newnote = Note(title, description);
          notedatabase.addNote(newnote);
        },
        backgroundColor: Colors.black,
        label: Text("Save Note"),
        icon: Icon(Icons.save),
      ),
    );
  }
}